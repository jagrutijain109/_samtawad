// Automatic FlutterFlow imports
import '../../pages/popupcomponent/firestlogin/firestlogin_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui';

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:io';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart' as xml;
import 'package:html/parser.dart' as htmlParser;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

class FlipEpubReader extends StatefulWidget {
  final double width;
  final double height;
  final String userId;
  final DocumentReference bookRef;
  final String bookname;
  final String epubUrl;

  const FlipEpubReader(
      {Key? key,
      required this.width,
      required this.height,
      required this.userId,
      required this.epubUrl,
      required this.bookname,
      required this.bookRef})
      : super(key: key);
  @override
  _FlipEpubReaderState createState() => _FlipEpubReaderState();
}

class PageData {
  final String title;
  final String text;
  final List<String> images;
  final List<Map<String, String>> lineAttributes; // New field to hold line style info

  PageData({
    required this.title,
    required this.text,
    required this.images,
    required this.lineAttributes,
  });
}

class _FlipEpubReaderState extends State<FlipEpubReader> {
  final String epubUrl =
      'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FAfTY8RocJCW6J9N6VBDCp74AmGT2%2Fuploads%2F1749614538803000.epub?alt=media&token=9c40f59d-420d-44e6-abd2-9b40c72ad075';
  List<PageData> pages = [];
  Map<String, int> tocMap = {}; // TOC entries (title -> index)
  // bool isLoading = true;
  final List<ScreenshotController> pageScreenshotControllers = [];
  final ScreenshotController screenshotController = ScreenshotController();
  FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;
  int currentPage = 0;
  double fontSize = 18;
  double ttsSpeed = 0.4;

  Map<String, Uint8List> imageMap = {};
  final GlobalKey _fullContentKey = GlobalKey();
  Set<int> bookmarkedPages = {};
  String? bookmarkDocID;
  int spokenTextIndex = 0;
  final GlobalKey previewContainerKey = GlobalKey();
  String lastSpokenText = "";
  bool _showFabOptions = false;

  // final searchController = TextEditingController();
  String searchText = "";
  PageController pageController = PageController();
  final searchController = TextEditingController();
  List<dynamic> allVoices = [];
  bool isPaused = false;
  List<Map<String, String>> dynamicTocList = []; // chapter title + page
  Map<String, String>? selectedFixedVoice;
  List<Map<String, dynamic>> firestoreChapters = [];
  List<String> ttsLines = [];
  int currentLineIndex = 0;

//  List<PageData> pages = [];
  // Map<String, int> tocMap = {};
  bool isLoading = true;
  // List<Map<String, dynamic>> firestoreChapters = [];

  dynamic selectedActualVoice;
  String lastText = '';
  List<Map<String, String>> autoTocList = [];

  final List<Map<String, String>> fixedVoiceOptions = [
    {'label': 'Hindi Male Voice', 'locale': 'hi-IN', 'type': 'male'},
    {'label': 'Hindi Female Voice', 'locale': 'hi-IN', 'type': 'female'},
    {'label': 'English Male Voice', 'locale': 'en-IN', 'type': 'male'},
    {'label': 'English Female Voice', 'locale': 'en-IN', 'type': 'female'},
  ];

  @override
  void initState() {
    super.initState();
    _loadLastRead();
    _loadEpubContent();
    _initTts();
    fetchChaptersFromFirestore();
  }
  TextAlign getTextAlignFromClassOrStyle(String classAttr, String styleAttr, String alignAttr) {
    classAttr = classAttr.toLowerCase();
    styleAttr = styleAttr.toLowerCase();
    alignAttr = alignAttr.toLowerCase();

    if (classAttr.contains('center') ||
        styleAttr.contains('text-align:center') ||
        alignAttr == 'center') {
      return TextAlign.center;
    }
    if (classAttr.contains('right') ||
        styleAttr.contains('text-align:right') ||
        alignAttr == 'right') {
      return TextAlign.right;
    }
    if (styleAttr.contains('text-align:justify') ||
        alignAttr == 'justify') {
      return TextAlign.justify;
    }
    return TextAlign.start;
  }
  int? _mapSrcToSpineIndex(
    String src,
    Map<String, String> manifest,
    List<String> spine,
  ) {
    for (int i = 0; i < spine.length; i++) {
      final href = manifest[spine[i]];
      if (href != null && src.contains(href)) {
        return i;
      }
    }
    return null;
  }

  Future<void> takeScreenshotAndSave(GlobalKey previewContainerKey) async {
    try {
      RenderRepaintBoundary boundary = previewContainerKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final imagePath =
          '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(pngBytes);

      await Share.shareXFiles(
        [XFile(imageFile.path)],
        text: 'ॐ ब्रह्म सत्यं सर्वधार🙏',
      );
    } catch (e) {
      print("❌ Screenshot Error: $e");
    }
  }

  Future<void> captureAndUploadScreenshot(
      ScreenshotController screenshotController) async
  {
    try {
      final imageBytes = await screenshotController.capture();
      if (imageBytes == null) {
        print("❌ Screenshot capture failed");
        return;
      }

      final directory = await getTemporaryDirectory();
      final imagePath =
          '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(imageBytes);

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('screenshots')
          .child('screenshot_${DateTime.now().millisecondsSinceEpoch}.png');

      final uploadTask = storageRef.putFile(imageFile);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      print("✅ Image uploaded! Download URL: $downloadUrl");
    } catch (e) {
      print("❌ Error: $e");
    }
  }

  Future<void> _initTts() async {
    await flutterTts.setSpeechRate(ttsSpeed);
    allVoices = await flutterTts.getVoices;
    selectedFixedVoice = fixedVoiceOptions[0];
    await _mapFixedVoiceToActual();

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });

      if (currentPage + 1 < pages.length) {
        currentPage++;
        pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        Future.delayed(Duration(milliseconds: 600), () {
          toggleSpeakLineByLine(pages[currentPage].text);
        });
      }
    });

    setState(() {});
  }

  Future<void> stopSpeak() async
  {
    await flutterTts.stop();
    isSpeaking = false;
    isPaused = false;
    currentLineIndex = 0;
  }

  Future<void> speakNextLine() async {
    if (currentLineIndex >= ttsLines.length || isPaused) {
      return;
    }

    final line = ttsLines[currentLineIndex];
    await _setVoice(); // Apply selected voice and speed
    await flutterTts.speak(line);

    flutterTts.setCompletionHandler(() async {
      if (!isPaused) {
        currentLineIndex++;
        if (currentLineIndex < ttsLines.length) {
          await speakNextLine();
        } else {
          // ✅ Page finished, move to next
          if (currentPage + 1 < pages.length) {
            setState(() {
              currentPage++;
            });
            pageController.animateToPage(
              currentPage,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );

            Future.delayed(Duration(milliseconds: 600), () {
              toggleSpeakLineByLine(pages[currentPage].text);
            });
          } else {
            // ✅ Last page finished
            setState(() {
              isSpeaking = false;
            });
          }
        }
      }
    });
  }

  Future<void> toggleSpeakLineByLine(String text) async {
    final cleanText = cleanTextForTts(text);
    if (!isSpeaking) {
      ttsLines =
          cleanText.split('\n').where((l) => l.trim().isNotEmpty).toList();
      currentLineIndex = 0;
      isSpeaking = true;
      isPaused = false;
      lastText = text;

      await speakNextLine();
    } else if (isSpeaking && !isPaused) {
      isPaused = true;
      await flutterTts.stop();
    } else if (isSpeaking && isPaused) {
      isPaused = false;
      await speakNextLine();
    }
  }

  Future<void> _mapFixedVoiceToActual() async {
    String? locale = selectedFixedVoice?['locale'];
    String? type = selectedFixedVoice?['type'];

    dynamic foundVoice = allVoices.firstWhere(
      (voice) =>
          voice['locale'].toString().toLowerCase() == locale!.toLowerCase() &&
          ((type == 'male' &&
                  (voice['name'].toString().toLowerCase().contains('hie') ||
                      voice['name']
                          .toString()
                          .toLowerCase()
                          .contains('end'))) ||
              (type == 'female' &&
                  (voice['name'].toString().toLowerCase().contains('hif') ||
                      voice['name'].toString().toLowerCase().contains('enf') ||
                      voice['name']
                          .toString()
                          .toLowerCase()
                          .contains('female')))),
      orElse: () => null,
    );

    if (foundVoice == null) {
      foundVoice = allVoices.firstWhere(
        (voice) =>
            voice['locale'].toString().toLowerCase() == locale!.toLowerCase(),
        orElse: () => allVoices.isNotEmpty ? allVoices[0] : null,
      );
    }
    selectedActualVoice = foundVoice;
  }

  // Future<void> captureFullScrollScreenshot(BuildContext context) async {
  //   try {
  //     RenderRepaintBoundary boundary = _fullContentKey.currentContext!
  //         .findRenderObject() as RenderRepaintBoundary;
  //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  //     ByteData? byteData =
  //         await image.toByteData(format: ui.ImageByteFormat.png);
  //     Uint8List pngBytes = byteData!.buffer.asUint8List();

  //     await Permission.storage.request();
  //     await Permission.photos.request();

  //     showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext sheetContext) {
  //         return Padding(
  //           padding: const EdgeInsets.all(16),
  //           child: Wrap(
  //             children: [
  //               ListTile(
  //                 leading: Icon(Icons.save),
  //                 title: Text("Save to Gallery"),
  //                 onTap: () async {
  //                   Navigator.pop(sheetContext);
  //                   final result = await ImageGallerySaver.saveImage(
  //                     pngBytes,
  //                     quality: 100,
  //                     name:
  //                         "epub_screenshot_${DateTime.now().millisecondsSinceEpoch}",
  //                   );

  //                   ScaffoldMessenger.of(context).showSnackBar(
  //                     SnackBar(
  //                       content: Text(
  //                         result['isSuccess'] == true
  //                             ? "Saved to gallery successfully."
  //                             : "Failed to save to gallery.",
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //               ListTile(
  //                 leading: Icon(Icons.share),
  //                 title: Text("Share"),
  //                 onTap: () async {
  //                   Navigator.pop(sheetContext);
  //                   final tempDir = await getTemporaryDirectory();
  //                   final file =
  //                       await File('${tempDir.path}/screenshot.png').create();
  //                   await file.writeAsBytes(pngBytes);

  //                   await Share.shareXFiles(
  //                     [XFile(file.path)],
  //                     text: "ॐ ब्रह्म सत्यम सर्वाधार🙏",
  //                   );
  //                 },
  //               ),
  //               ListTile(
  //                 leading: Icon(Icons.cancel),
  //                 title: Text("Cancel"),
  //                 onTap: () => Navigator.pop(sheetContext),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint("Screenshot error: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Error taking screenshot.")),
  //     );
  //   }
  // }
  // Future<void> toggleSpeak(String text) async {
  //   if (!isSpeaking) {
  //     await stopSpeak(); // <- stop any prior speech
  //     await _setVoice();
  //     setState(() {
  //       isSpeaking = true;
  //     });
  //     await flutterTts.speak(text);
  //   } else {
  //     await stopSpeak();
  //   }
  // }

  String cleanTextForTts(String text) {
    final lines = text
        .replaceAll(
            RegExp(r'\[/?(CENTER|LEFT|RIGHT|BOLD)\]'), '') // remove markers
        .split('\n')
        .map((line) => line.trim())
        .where((line) {
      // Remove empty lines or lines like "3", "*", "#", etc.
      if (line.isEmpty) return false;
      if (line.length <= 2 && RegExp(r'^[\d\W]+$').hasMatch(line)) return false;
      return true;
    }).toList();

    return lines.join('\n');
  }

  Future<void> toggleSpeak(String text) async {
    final cleanText = cleanTextForTts(text);
    if (!isSpeaking) {
      await _setVoice(); // ✅ Apply selected voice
      isSpeaking = true;
      isPaused = false;
      lastText = text;
      await flutterTts.speak(cleanText);
    } else if (isSpeaking && !isPaused) {
      await flutterTts.pause();
      isPaused = true;
    } else if (isSpeaking && isPaused) {
      await _setVoice(); // ✅ Re-apply voice before resuming
      await flutterTts.speak(lastText);
      isPaused = false;
    }
  }

  Future<void> _setVoice() async {
    if (selectedActualVoice != null) {
      await flutterTts.setLanguage(selectedActualVoice['locale']);
      await flutterTts.setSpeechRate(ttsSpeed);
      await flutterTts.setVoice({
        "name": selectedActualVoice['name'],
        "locale": selectedActualVoice['locale'],
      });
    }
  }

  Future<void> saveBookmark(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastReadPage', currentPage);
    if(FFAppState().islogin) {
      try {
        final snapshot = await FirebaseFirestore.instance
            .collection('bookmarks')
            .where('userId', isEqualTo: widget.userId)
            .where('bookId', isEqualTo: widget.bookRef.id)
            .where('page', isEqualTo: currentPage)
            .get();

        if (snapshot.docs.isNotEmpty) {
          // Bookmark exists –> remove it
          for (final doc in snapshot.docs) {
            await FirebaseFirestore.instance
                .collection('bookmarks')
                .doc(doc.id)
                .delete();
          }

          setState(() {
            bookmarkedPages.remove(currentPage);
            bookmarkDocID = null;
          });

          debugPrint("✅ Bookmark removed from page $currentPage");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Bookmark removed from page $currentPage")),
          );
        } else {
          // Bookmark does not exist –> add it
          final docRef =
          await FirebaseFirestore.instance.collection('bookmarks').add({
            'userId': widget.userId,
            'bookId': widget.bookRef.id,
            'page': currentPage,
            'title': pages[currentPage].title.isNotEmpty
                ? pages[currentPage].title
                : pages[currentPage]
                .text
                .split('\n')
                .firstWhere((l) =>
            l
                .trim()
                .isNotEmpty, orElse: () => ''),
            'timestamp': FieldValue.serverTimestamp(),
          });

          setState(() {
            bookmarkedPages.add(currentPage);
            bookmarkDocID = docRef.id;
          });

          debugPrint("✅ Bookmark saved at page $currentPage");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Bookmark saved at page $currentPage")),
          );
        }
      } catch (e) {
        debugPrint("❌ Error saving/removing bookmark: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update bookmark.")),
        );
      }
    }
    else{
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => const FirestloginWidget(),
      );
    }
  }

  // Future<void> captureFullScrollScreenshot(BuildContext context) async {
  //   try {
  //     RenderRepaintBoundary boundary = _fullContentKey.currentContext!
  //         .findRenderObject() as RenderRepaintBoundary;
  //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  //     ByteData? byteData =
  //         await image.toByteData(format: ui.ImageByteFormat.png);
  //     Uint8List pngBytes = byteData!.buffer.asUint8List();

  //     await Permission.storage.request();
  //     await Permission.photos.request();

  //     showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext sheetContext) {
  //         return Padding(
  //           padding: const EdgeInsets.all(16),
  //           child: Wrap(
  //             children: [
  //               ListTile(
  //                 leading: Icon(Icons.save),
  //                 title: Text("Save to Gallery"),
  //                 onTap: () async {
  //                   Navigator.pop(sheetContext);
  //                   final result = await ImageGallerySaver.saveImage(
  //                     pngBytes,
  //                     quality: 100,
  //                     name:
  //                         "epub_screenshot_${DateTime.now().millisecondsSinceEpoch}",
  //                   );

  //                   ScaffoldMessenger.of(context).showSnackBar(
  //                     SnackBar(
  //                       content: Text(
  //                         result['isSuccess'] == true
  //                             ? "Saved to gallery successfully."
  //                             : "Failed to save to gallery.",
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //               ListTile(
  //                 leading: Icon(Icons.share),
  //                 title: Text("Share"),
  //                 onTap: () async {
  //                   Navigator.pop(sheetContext);
  //                   final tempDir = await getTemporaryDirectory();
  //                   final file =
  //                       await File('${tempDir.path}/screenshot.png').create();
  //                   await file.writeAsBytes(pngBytes);
  //                   await Share.shareXFiles(
  //                     [XFile(file.path)],
  //                     text: "ॐ ब्रह्म सत्यम सर्वाधार🙏",
  //                   );
  //                 },
  //               ),
  //               ListTile(
  //                 leading: Icon(Icons.cancel),
  //                 title: Text("Cancel"),
  //                 onTap: () => Navigator.pop(sheetContext),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint("Screenshot error: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Error taking screenshot.")),
  //     );
  //   }
  // }

  Future<void> _showNotesForPage(BuildContext context) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('notes')
          .where('userId', isEqualTo: widget.userId)
          .where('bookId', isEqualTo: widget.bookRef.id)
          // .orderBy('timestamp', descending: true)
          .get();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: snapshot.docs.isEmpty
                ? Text('No notes found for this book.')
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.docs.length,
                    itemBuilder: (context, index) {
                      final doc = snapshot.docs[index];
                      final note = doc['noteText'] ?? '';
                      final date = (doc['timestamp'] as Timestamp?)?.toDate();
                      final int targetPage = doc['pageNumber'] ?? 0;

                      return ListTile(
                        title: Text(note),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Page $targetPage'),
                            if (date != null)
                              Text(
                                '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(fontSize: 12),
                              ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context); // Close bottom sheet
                          setState(() => currentPage = targetPage);
                          pageController
                              .jumpToPage(targetPage); // Go to the note's page
                        },
                      );
                    },
                  ),
          );
        },
      );
    } catch (e) {
      debugPrint("❌ Error fetching notes: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load notes.")),
      );
    }
  }

  Future<void> checkBookmark() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('bookmarks')
          .where('userId', isEqualTo: widget.userId)
          .where('bookId',
              isEqualTo: widget.bookRef.id) // Use ID, not reference
          .get();

      debugPrint(
          "Fetched \${snapshot.docs.length} bookmark(s) for user ${widget.userId}, book ${widget.bookRef.id}");

      Set<int> pagesSet = {};

      for (var doc in snapshot.docs) {
        final pageNum = doc.data()['page'];
        if (pageNum is int) {
          pagesSet.add(pageNum);
        }
      }

      setState(() {
        bookmarkedPages = pagesSet;
      });
    } catch (e) {
      debugPrint("❌ Error fetching bookmarks: \$e");
    }
  }

  Future<void> _loadLastRead() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPage = prefs.getInt('lastReadPage') ?? 0;
    setState(() {
      currentPage = savedPage;
    });
  }

// REPLACE your _loadEpubContent() method with this updated one
  Future<void> _loadEpubContent() async {
    try {
      final response = await http.get(Uri.parse(widget.epubUrl));
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/book.epub';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      final bytes = await file.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      for (final file in archive) {
        if (file.isFile &&
            (file.name.endsWith('.jpg') ||
                file.name.endsWith('.jpeg') ||
                file.name.endsWith('.png'))) {
          imageMap[file.name] = Uint8List.fromList(file.content as List<int>);
        }
      }

      final containerFile =
      archive.firstWhere((f) => f.name == 'META-INF/container.xml');
      final containerXml = xml.XmlDocument.parse(
          utf8.decode(containerFile.content as List<int>));
      final opfPath = containerXml
          .findAllElements('rootfile')
          .first
          .getAttribute('full-path')!;

      final opfFile = archive.firstWhere((f) => f.name == opfPath);
      final opfXml =
      xml.XmlDocument.parse(utf8.decode(opfFile.content as List<int>));

      final manifest = {
        for (var item in opfXml.findAllElements('item'))
          item.getAttribute('id')!: item.getAttribute('href')!
      };

      final spine = opfXml
          .findAllElements('itemref')
          .map((e) => e.getAttribute('idref'))
          .whereType<String>()
          .toList();

      List<Map<String, dynamic>> parsedPages = [];

      for (var id in spine) {
        final href = manifest[id];
        if (href == null) continue;

        final contentPath = opfPath.contains('/')
            ? opfPath.substring(0, opfPath.lastIndexOf('/')) + '/' + href
            : href;

        final contentFile = archive.firstWhere(
              (f) => f.name == contentPath,
          orElse: () => ArchiveFile('not_found', 0, []),
        );

        if (contentFile.name == 'not_found') continue;

        final document =
        htmlParser.parse(utf8.decode(contentFile.content as List<int>));
        final buffer = StringBuffer();
        final lineStyleList = <Map<String, String>>[];
        final seenLines = <String>{};
        final body = document.body;
        String titleCandidate = '';

        if (body != null) {
          for (final node in body.querySelectorAll('*')) {
            final tag = node.localName?.toLowerCase();
            final text = node.text.trim();
            if (text.isEmpty || seenLines.contains(text)) continue;
            if (text.length <= 2 && RegExp(r'^\d+$').hasMatch(text)) continue;
            seenLines.add(text);

            final style = node.attributes['style']?.toLowerCase() ?? '';
            final align = node.attributes['align']?.toLowerCase() ?? '';
            final classAttr = node.attributes['class']?.toLowerCase() ?? '';

            if (['h1', 'h2', 'h3'].contains(tag) && titleCandidate.isEmpty) {
              titleCandidate = text;
            }

            String finalText = text;

            if (tag == 'li') {
              finalText = '• $text';
            } else if (tag == 'tr') {
              final row = node
                  .getElementsByTagName('td')
                  .map((td) => td.text.trim())
                  .where((cell) => cell.isNotEmpty)
                  .join("   ");
              if (row.isNotEmpty && !seenLines.contains(row)) {
                finalText = row;
                seenLines.add(row);
              } else {
                continue;
              }
            }

            buffer.writeln(finalText);
            lineStyleList.add({
              'text': finalText,
              'style': style,
              'class': classAttr,
              'align': align,
            });
          }
        }

        final images = document
            .getElementsByTagName('img')
            .map((img) =>
            resolveImagePath(contentPath, img.attributes['src'] ?? ''))
            .toList();

        parsedPages.add({
          'originalIndex': spine.indexOf(id),
          'title': titleCandidate,
          'text': buffer.toString().trim(),
          'images': images,
          'lineAttributes': lineStyleList,
        });
      }

      final indexMap = <int, int>{};
      List<PageData> finalPages = [];
      final seenGlobalLines = <String>{};
      int newPageIndex = 0;

      for (var entry in parsedPages) {
        final text = entry['text'] as String;
        final images = entry['images'] as List<String>;
        final lineAttrs = entry['lineAttributes'] as List<Map<String, String>>;
        String title = entry['title'] ?? '';

        final lines = text.split('\n');
        final uniqueLines = lines.where((line) {
          final trimmed = line.trim();
          if (trimmed.isEmpty || seenGlobalLines.contains(trimmed)) return false;
          seenGlobalLines.add(trimmed);
          return true;
        }).toList();

        if (uniqueLines.isEmpty && images.isEmpty) continue;

        if (title.isEmpty) {
          title = fallbackTitle(uniqueLines.join(' '));
        }

        indexMap[entry['originalIndex']] = newPageIndex;

        finalPages.add(PageData(
          title: title,
          text: uniqueLines.join('\n'),
          images: images,
          lineAttributes: lineAttrs,
        ));

        newPageIndex++;
      }

      // 🔖 Load .ncx TOC
      final ncxItemElements = opfXml.findAllElements('item');
      final ncxItemElement = ncxItemElements.firstWhere(
            (item) => item.getAttribute('media-type') == 'application/x-dtbncx+xml',
        orElse: () => null as xml.XmlElement, // 👈 Dart needs an XmlElement
      );
      autoTocList.clear();
      if (ncxItemElement != null) {
        final ncxHref = ncxItemElement.getAttribute('href')!;
        final ncxPath = opfPath.contains('/')
            ? opfPath.substring(0, opfPath.lastIndexOf('/')) + '/' + ncxHref
            : ncxHref;

        final ncxFile = archive.firstWhere((f) => f.name == ncxPath);
        final ncxXml =
        xml.XmlDocument.parse(utf8.decode(ncxFile.content as List<int>));

        final navPoints = ncxXml.findAllElements('navPoint');
        for (var nav in navPoints) {
          final title = nav
              .getElement('navLabel')
              ?.getElement('text')
              ?.text ??
              'Untitled';
          final src = nav.getElement('content')?.getAttribute('src') ?? '';
          final srcIndex = _mapSrcToSpineIndex(src, manifest, spine);

          if (srcIndex != null && indexMap.containsKey(srcIndex)) {
            final correctedIndex = indexMap[srcIndex]!;
            autoTocList
                .add({'title': title, 'page': correctedIndex.toString()});
            tocMap['Page ${correctedIndex + 1}'] = correctedIndex;
          }
        }
      }

      setState(() {
        pages = finalPages;
        isLoading = false;
      });

      await checkBookmark();
    } catch (e) {
      debugPrint('❌ EPUB load error: $e');
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Failed to load EPUB content.')),
      );
    }
  }


// 🔥 Fallback title function
  String fallbackTitle(String text) {
    final cleaned = text
        .replaceAll(RegExp(r'\[/?(CENTER|LEFT|RIGHT|BOLD)\]'), '')
        .replaceAll('\n', ' ')
        .trim();

    final words = cleaned
        .split(RegExp(r'\s+'))
        .where((word) => word.trim().isNotEmpty)
        .take(3)
        .join(" ");

    return words.isNotEmpty ? "$words ..." : "Untitled";
  }

  Future<void> _showAddNoteDialog(BuildContext context) async {
    final noteController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Note'),
          content: TextField(
            controller: noteController,
            maxLines: 4,
            decoration: InputDecoration(hintText: 'Write your note here...'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final noteText = noteController.text.trim();
                if (noteText.isNotEmpty) {
                  await _saveNoteToFirebase(noteText, context);
                  Navigator.pop(context);
                  // await _showNotesForPage(context); // ✅ refresh notes dialog
                }
              },
              child: Text('Add Note'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveNoteToFirebase(
      String noteText, BuildContext context) async
  {
    if(FFAppState().islogin) {
      try {
        await FirebaseFirestore.instance.collection('notes').add({
          'userId': widget.userId,
          'bookId': widget.bookRef.id,
          'noteText': noteText,
          'pageNumber': currentPage, // ✅ keep it as int
          'timestamp': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Note added successfully.")),
        );
      } catch (e) {
        debugPrint("Error saving note: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add note.")),
        );
      }
    }else{
      await showModalBottomSheet(
          context: context,
          builder: (context) => const FirestloginWidget(),
        isScrollControlled: true,
        backgroundColor: Colors.transparent
      );
    }
  }

  Future<void> _showUserBookmarks(BuildContext context) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('bookmarks')
          .where('userId', isEqualTo: widget.userId)
          .where('bookId', isEqualTo: widget.bookRef.id)
          .get();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: snapshot.docs.isEmpty
                ? Text('No bookmarks found.')
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.docs.length,
                    itemBuilder: (context, index) {
                      final doc = snapshot.docs[index];
                      final int page = (doc['page'] as int?) ?? 0;
                      final title = doc['title'] ?? 'Page $page';

                      return ListTile(
                        title: Text(title.toString()),
                        subtitle: Text('Page $page'),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() => currentPage = page);
                          pageController.jumpToPage(page);
                        },
                      );
                    },
                  ),
          );
        },
      );
    } catch (e) {
      debugPrint("❌ Error loading bookmarks: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load bookmarks.")),
      );
    }
  }
  FontWeight getFontWeightFromClassOrStyle(String classAttr, String styleAttr) {
    classAttr = classAttr.toLowerCase();
    styleAttr = styleAttr.toLowerCase();
    if (classAttr.contains('bold') || styleAttr.contains('bold')) {
      return FontWeight.bold;
    }
    return FontWeight.normal;
  }
  Widget highlightText(PageData page) {
    final lines = page.lineAttributes;
    final defaultStyle = TextStyle(fontSize: fontSize, color: Colors.black);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: lines.map((lineData) {
        final text = lineData['text'] ?? '';
        final lineStyle = lineData['style'] ?? '';
        final lineClass = lineData['class'] ?? '';
        final lineAlign = lineData['align'] ?? '';

        if (text.trim().isEmpty) return SizedBox(height: 8);

        final textAlign = getTextAlignFromClassOrStyle(lineClass, lineStyle, lineAlign);
        final alignment = textAlign == TextAlign.center
            ? Alignment.center
            : textAlign == TextAlign.right
            ? Alignment.centerRight
            : textAlign == TextAlign.justify
            ? Alignment.topLeft
            : Alignment.centerLeft;

        final fontWeight = getFontWeightFromClassOrStyle(lineClass, lineStyle);

        // Highlighting logic remains same
        if (searchText.isEmpty) {
          return Align(
            alignment: alignment,
            child: Text(
              text,
              textAlign: textAlign,
              style: defaultStyle.copyWith(fontWeight: fontWeight),
            ),
          );
        }

        final matches = RegExp(RegExp.escape(searchText), caseSensitive: false).allMatches(text);
        if (matches.isEmpty) {
          return Align(
            alignment: alignment,
            child: Text(
              text,
              textAlign: textAlign,
              style: defaultStyle.copyWith(fontWeight: fontWeight),
            ),
          );
        }

        List<TextSpan> spans = [];
        int start = 0;
        for (final match in matches) {
          if (match.start > start) {
            spans.add(TextSpan(text: text.substring(start, match.start)));
          }
          spans.add(TextSpan(
            text: text.substring(match.start, match.end),
            style: TextStyle(backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),
          ));
          start = match.end;
        }
        if (start < text.length) {
          spans.add(TextSpan(text: text.substring(start)));
        }

        return Align(
          alignment: alignment,
          child: RichText(
            textAlign: textAlign,
            text: TextSpan(
              style: defaultStyle.copyWith(fontWeight: fontWeight),
              children: spans,
            ),
          ),
        );
      }).toList(),
    );
  }
  Future<void> fetchChaptersFromFirestore() async {
    try {
      debugPrint("Fetching chapters from: ${widget.bookRef.path}");

      final snapshot = await FirebaseFirestore.instance
          .collection('EpubBook')
          .doc(widget.bookRef.id)
          .collection('chapter')
          .orderBy('chapter_number')
          .get();

      debugPrint("Fetched ${snapshot.docs.length} chapters");

      for (final doc in snapshot.docs) {
        debugPrint("Chapter doc: ${doc.data()}");
      }

      setState(() {
        firestoreChapters = snapshot.docs.map((doc) {
          final data = doc.data();

          return {
            'chapter_number': data['chapter_number'] ?? 0,
            'chapter_name': data['chapter_name'] ?? 'Unnamed',
            'start_page_no': data['start_page_no'] ?? 0,
            'end_page_no': data['end_page_no'] ?? 0,
            'additional_information': data['additional_information'] ?? '',
          };
        }).toList();
      });

      debugPrint("firestoreChapters: $firestoreChapters");
    } catch (e) {
      debugPrint("❌ Error fetching chapters: $e");
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text("Failed to load chapters from Firestore.")),
      );
    }
  }
  String resolveImagePath(String basePath, String relativePath) {
    if (relativePath.contains('://')) return relativePath;
    final dir = basePath.contains('/')
        ? basePath.substring(0, basePath.lastIndexOf('/') + 1)
        : '';
    final fullPath = (dir + relativePath).replaceAll('\\', '/');
    return fullPath;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC25123),
        title: Text(widget.bookname),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showFabOptions) ...[
            FloatingActionButton(
              backgroundColor: Color(0xFFc25123),
              heroTag: "view_bookmarks",
              // backgroundColor: Colors.blueGrey,
              child: Icon(
                Icons.bookmarks,
                color: Colors.white,
              ),
              tooltip: 'View Bookmarks',
              onPressed: () {
                _showUserBookmarks(context);
              },
            ),
            FloatingActionButton(
              backgroundColor: Color(0xFFc25123),
              heroTag: "add_note",
              child: Icon(
                Icons.note_add,
                color:Colors.white,
              ),
              onPressed: () {
                _showAddNoteDialog(context);
              },
              tooltip: 'Add Note',
            ),
            FloatingActionButton(
              backgroundColor: Color(0xFFc25123),
              heroTag: "close_fab",
              mini: true,
              tooltip: 'Close Options',
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => setState(() => _showFabOptions = false),
            ),
          ],
          FloatingActionButton(
            backgroundColor: Color(0xFFc25123),
            heroTag: "main_fab",
            tooltip: 'More Options',
            child: Icon(Icons.menu, color: Colors.white),
            onPressed: () => setState(() => _showFabOptions = !_showFabOptions),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  '📖 Chapters',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

              // ✅ 1. Official EPUB TOC from .ncx
              if (autoTocList.isNotEmpty)
                ...autoTocList.map((item) {
                  final title = item['title'] ?? 'Untitled';
                  final pageIndex = int.tryParse(item['page'] ?? '') ?? 0;
                  return ListTile(
                    title: Text(title),
                    subtitle: Text('Page ${pageIndex + 1}'),
                    onTap: () {
                      Navigator.pop(context);
                      pageController.jumpToPage(pageIndex);
                      setState(() => currentPage = pageIndex);
                    },
                  );
                }).toList()

              // ✅ 2. Firestore-based TOC fallback
              else if (firestoreChapters.isNotEmpty)
                ...firestoreChapters.map((chapter) {
                  final title = chapter['chapter_name'] ?? 'Unnamed';
                  final startPageNo = chapter['start_page_no'] ?? 0;
                  final endPageNo = chapter['end_page_no'] ?? startPageNo;

                  return ListTile(
                    title: Text(title),
                    subtitle: Text('Pages $startPageNo–$endPageNo'),
                    onTap: () {
                      Navigator.pop(context);
                      pageController.jumpToPage(startPageNo);
                      setState(() => currentPage = startPageNo);
                    },
                  );
                }).toList()

              // ✅ 3. Auto-generated TOC from first lines
              else if (dynamicTocList.isNotEmpty)
                ...dynamicTocList.map((item) {
                  final title = item['title'] ?? 'Untitled';
                  final pageStr = item['page']?.replaceAll('Page ', '') ?? '0';
                  final pageIndex = int.tryParse(pageStr) ?? 0;

                  return ListTile(
                    title: Text(title),
                    subtitle: Text('Page $pageIndex'),
                    onTap: () {
                      Navigator.pop(context);
                      pageController.jumpToPage(pageIndex);
                      setState(() => currentPage = pageIndex);
                    },
                  );
                }).toList()

              // ❌ No TOC available
              else
                ListTile(
                  title: Text('No chapters found'),
                  subtitle:
                      Text('Try reloading the book or check EPUB content.'),
                ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        suffixIcon: searchText.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    searchText = '';
                                    searchController.clear();
                                  });
                                },
                              )
                            : null,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value.trim();
                        });
                      },
                    ),
                  ),
                  IconButton(
                    tooltip: "Bookmarks",
                    icon: Icon(
                      Icons.bookmark,
                      color: bookmarkedPages.contains(currentPage)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () => saveBookmark(context),
                  ),
                  IconButton(
                    tooltip: "Notes",
                    icon: Icon(Icons.notes, color: Color(0xFFC25123)),
                    onPressed: () => _showNotesForPage(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Font Size Slider
                  // Font Icon

                  // Voice Speed Slider
                  Icon(Icons.speed),
                  Expanded(
                    child: Slider(
                      value: ttsSpeed,
                      min: 0.2,
                      max: 1.0,
                      activeColor: Color(0xFFC25123),
                      onChanged: (v) async {
                        setState(() => ttsSpeed = v);
                        await flutterTts.setSpeechRate(ttsSpeed);

                        if (isSpeaking && !isPaused) {
                          await flutterTts.stop();
                          await speakNextLine();
                        }
                      },
                    ),
                  ),
                  // Speed Icon

                  // Male / Female Buttons
                  IconButton(
                    icon: Icon(Icons.man,
                        size: 40,
                        color: selectedFixedVoice?['type'] == 'male'
                            ? Colors.blue
                            : Colors.grey),
                    onPressed: () async {
                      setState(() {
                        selectedFixedVoice = fixedVoiceOptions.firstWhere((v) =>
                            v['type'] == 'male' &&
                            v['locale'] == selectedFixedVoice?['locale']);
                      });
                      await _mapFixedVoiceToActual();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.woman,
                        size: 40,
                        color: selectedFixedVoice?['type'] == 'female'
                            ? Colors.pink
                            : Colors.grey),
                    onPressed: () async {
                      setState(() {
                        selectedFixedVoice = fixedVoiceOptions.firstWhere((v) =>
                            v['type'] == 'female' &&
                            v['locale'] == selectedFixedVoice?['locale']);
                      });
                      await _mapFixedVoiceToActual();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 📏 Font Slider
                  Icon(Icons.text_fields),
                  Expanded(
                    child: Slider(
                      value: fontSize,
                      min: 12,
                      max: 90,
                      activeColor: Color(0xFFC25123),
                      onChanged: (v) => setState(() => fontSize = v),
                      label: fontSize.toInt().toString(),
                    ),
                  ),

                  // 📷 Screenshot Button
                  IconButton(
                    tooltip: "Screenshot",
                    icon: Icon(Icons.camera_alt, color: Color(0xFFC25123)),
                    onPressed: () async {
                      await takeScreenshotAndSave(previewContainerKey);
                      // await captureAndUploadScreenshot(screenshotController);
                    },
                  ),

                  // 🔊 TTS Button (toggle play/pause/resume)
                  IconButton(
                    tooltip: isSpeaking
                        ? (isPaused ? "Resume Reading" : "Pause Reading")
                        : "Start Reading",
                    icon: Icon(
                      isSpeaking
                          ? (isPaused
                              ? Icons.play_arrow_rounded
                              : Icons.pause_circle_filled)
                          : Icons.record_voice_over,
                      size: 32,
                      color: Color(0xFFC25123),
                    ),
                    onPressed: () =>
                        toggleSpeakLineByLine(pages[currentPage].text),
                  ),

                  // 🛑 Stop Button (only visible when speaking)
                  if (isSpeaking)
                    IconButton(
                      tooltip: "Stop Reading",
                      icon: Icon(Icons.stop_circle_outlined,
                          size: 28, color: Color(0xFFC25123)),
                      onPressed: () => stopSpeak(),
                    ),
                ],
              ),
            ),
            Expanded(
              child: RepaintBoundary(
                key: previewContainerKey,
                child: Container(
                  color: Colors.white,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: pages.length,
                    onPageChanged: (index) async {
                      setState(() {
                        currentPage = index;
                        isSpeaking = false;
                      });
                      await flutterTts.stop();
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setInt('lastReadPage', index);
                      await checkBookmark();
                    },
                    itemBuilder: (context, index) {
                      final page = pages[index];
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height * 0.8,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  for (var imgPath in page.images)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: imageMap.containsKey(imgPath)
                                          ? Image.memory(imageMap[imgPath]!)
                                          : Text('[Image not found: $imgPath]'),
                                    ),
                                  const SizedBox(height: 12),
                                  highlightText(page),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),


            // Expanded(
            //   child: Screenshot(
            //     controller: screenshotController,
            //     child: Container(
            //       color: Colors.white,
            //       child: PageView.builder(
            //         controller: pageController,
            //         itemCount: pages.length,
            //         onPageChanged: (index) async {
            //           setState(() {
            //             currentPage = index;
            //             isSpeaking = false;
            //           });
            //           await flutterTts.stop();
            //           final prefs = await SharedPreferences.getInstance();
            //           await prefs.setInt('lastReadPage', index);
            //           await checkBookmark();
            //         },
            //         itemBuilder: (context, index) {
            //           final page = pages[index];
            //           return Padding(
            //             padding: const EdgeInsets.all(16),
            //             child: SingleChildScrollView(
            //               child: ConstrainedBox(
            //                 constraints: BoxConstraints(
            //                   minHeight:
            //                       MediaQuery.of(context).size.height * 0.8,
            //                 ),
            //                 child: IntrinsicHeight(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.stretch,
            //                     children: [
            //                       for (var imgPath in page.images)
            //                         Padding(
            //                           padding: const EdgeInsets.symmetric(
            //                               vertical: 8),
            //                           child: imageMap.containsKey(imgPath)
            //                               ? Image.memory(imageMap[imgPath]!)
            //                               : Text('[Image not found: $imgPath]'),
            //                         ),
            //                       const SizedBox(height: 12),
            //                       highlightText(page.text),
            //                       const SizedBox(height: 8),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
