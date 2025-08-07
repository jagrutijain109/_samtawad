// Automatic FlutterFlow imports
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

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

import 'package:firebase_storage/firebase_storage.dart';

import 'package:screenshot/screenshot.dart';

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';

import '/flutter_flow/custom_functions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:share_plus/share_plus.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class PDFViewerWithVoiceSearch extends StatefulWidget {
  final double width;
  final double height;
  final String pdfUrl;
  final String userId;

  const PDFViewerWithVoiceSearch({
    Key? key,
    required this.width,
    required this.height,
    required this.pdfUrl,
    required this.userId,
  }) : super(key: key);

  @override
  _PDFViewerWithVoiceSearchState createState() =>
      _PDFViewerWithVoiceSearchState();
}

enum PatternStyle {
  none,
  verticalBars,
  doubleColons,
  asteriskWrap,
}

class _PDFViewerWithVoiceSearchState extends State<PDFViewerWithVoiceSearch> {
  late PdfViewerController _pdfViewerController;
  late PdfTextSearchResult _searchResult;
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey _fullContentKey = GlobalKey(); // For screenshot
  late stt.SpeechToText _speech;
  final GlobalKey previewContainerKey = GlobalKey();
  int? _ocrMatchedPage;
  bool _isListening = false;
  int _currentPage = 0;
  // late PdfTextSearchResult _searchResult;
  bool _isPdfReady = false;
  final ScreenshotController screenshotController = ScreenshotController();

  Set<int> _bookmarkedPages = {};
  PatternStyle selectedPatternStyle = PatternStyle.none;
  bool _showFabOptions = false;
  int _ocrMatchIndex = 0;
  List<int> _ocrMatchedPages = [];

  void _resetOcrMatches() {
    _ocrMatchedPages.clear();
    _ocrMatchIndex = 0;
  }
  void nextOcrMatch() {
    if (_ocrMatchedPages.isEmpty) return;
    _ocrMatchIndex = (_ocrMatchIndex + 1) % _ocrMatchedPages.length;
    _pdfViewerController.jumpToPage(_ocrMatchedPages[_ocrMatchIndex]);
  }

  void previousOcrMatch() {
    if (_ocrMatchedPages.isEmpty) return;
    _ocrMatchIndex = (_ocrMatchIndex - 1 + _ocrMatchedPages.length) % _ocrMatchedPages.length;
    _pdfViewerController.jumpToPage(_ocrMatchedPages[_ocrMatchIndex]);
  }
  Future<File> _saveTempImage(Uint8List bytes) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/ocr_temp_${DateTime.now().millisecondsSinceEpoch}.png');
    return await file.writeAsBytes(bytes);
  }

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();
    _speech = stt.SpeechToText();
    _checkMicPermission();
    _loadBookmarksFromFirestore();
  }

  Future<void> _checkMicPermission() async {
    await Permission.microphone.request();
  }
  Future<void> takeScreenshotAndSave(GlobalKey key) async {
    try {
      final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
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
      // Capture screenshot
      final imageBytes = await screenshotController.capture();
      if (imageBytes == null) {
        print("❌ Screenshot capture failed");
        return;
      }

      // Save as temporary file
      final directory = await getTemporaryDirectory();
      final imagePath =
          '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(imageBytes);

      // Upload to Firebase Storage
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


  String applyPattern(String input, PatternStyle style) {
    switch (style) {
      case PatternStyle.verticalBars:
        return '||$input||';
      case PatternStyle.doubleColons:
        return '::$input::';
      case PatternStyle.asteriskWrap:
        return '*$input*';
      case PatternStyle.none:
      default:
        return input;
    }
  }
  Future<void> _toggleBookmark(BuildContext context) async {
    final pdfUrl = widget.pdfUrl;
if(FFAppState().islogin) {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('pdfBookmarks')
        .where('userId', isEqualTo: widget.userId)
        .where('pdfUrl', isEqualTo: pdfUrl)
        .where('page', isEqualTo: _currentPage)
        .get();

    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        await FirebaseFirestore.instance
            .collection('pdfBookmarks')
            .doc(doc.id)
            .delete();
      }
      setState(() => _bookmarkedPages.remove(_currentPage));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bookmark removed from page $_currentPage')),
      );
    } else {
      await FirebaseFirestore.instance.collection('pdfBookmarks').add({
        'userId': widget.userId,
        'pdfUrl': pdfUrl,
        'page': _currentPage,
        'timestamp': FieldValue.serverTimestamp(),
      });
      setState(() => _bookmarkedPages.add(_currentPage));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Page $_currentPage bookmarked')),
      );
    }
  } catch (e) {
    debugPrint("Bookmark toggle error: $e");
  }
}else{
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const FirestloginWidget(),
  );
}
  }
  Future<void> _loadBookmarksFromFirestore() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('pdfBookmarks')
        .where('userId', isEqualTo: widget.userId)
        .where('pdfUrl', isEqualTo: widget.pdfUrl)
        .get();

    setState(() {
      _bookmarkedPages = snapshot.docs.map((doc) => doc['page'] as int).toSet();
    });
  }
  void _showBookmarksDrawer(BuildContext context) {
    final bookmarks = _bookmarkedPages.toList()..sort();
    if (bookmarks.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No bookmarks yet.')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            final page = bookmarks[index];
            return ListTile(
              title: Text('Page $page'),
              onTap: () {
                Navigator.pop(context);
                _pdfViewerController.jumpToPage(page);
              },
            );
          },
        );
      },
    );
  }
  Future<void> downloadToDownloadsFolder() async {
    try {
      final url =
          "https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/shri-samta-prakash.pdf?alt=media&token=219337db-4f81-4104-a655-a9dba1a6230a";
      final fileName = "Samta_Shri_Prakash.pdf";

      final status = await Permission.storage.request();
      if (!status.isGranted) {
        throw Exception("Storage permission denied");
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw Exception("Download failed with status ${response.statusCode}");
      }

      final dir = await getExternalStorageDirectory();
      final downloadsDirPath = '${dir!.path}/Download';
      final downloadsDir = Directory(downloadsDirPath);

      if (!await downloadsDir.exists()) {
        await downloadsDir.create(recursive: true);
      }

      final filePath = '${downloadsDir.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ PDF saved: $filePath')),
      );
    } catch (e) {
      debugPrint("❌ Download error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Failed to download: $e")),
      );
    }
  }
  // Future<void> downloadToDownloadsFolder() async {
  //   try {
  //     final url =
  //         "https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/shri-samta-prakash.pdf?alt=media&token=219337db-4f81-4104-a655-a9dba1a6230a";
  //     final fileName = "Samta_Shri_Prakash.pdf";

  //     final status = await Permission.storage.request();
  //     if (!status.isGranted) {
  //       throw Exception("Storage permission denied");
  //     }

  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode != 200) {
  //       throw Exception("Download failed with status ${response.statusCode}");
  //     }

  //     final tempDir = await getTemporaryDirectory();
  //     final tempFilePath = '${tempDir.path}/$fileName';
  //     final tempFile = File(tempFilePath);
  //     await tempFile.writeAsBytes(response.bodyBytes);

  //     final result = await ImageGallerySaver.saveFile(tempFilePath);

  //     if (result['isSuccess'] == true) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('✅ PDF saved to Downloads or Gallery')),
  //       );
  //     } else {
  //       throw Exception("Save failed");
  //     }
  //   } catch (e) {
  //     debugPrint("❌ Download error: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("❌ Failed to download: $e")),
  //     );
  //   }
  // }

  // Future<void> captureFullScrollScreenshot(BuildContext context) async {
  //   try {
  //     RenderRepaintBoundary boundary = _fullContentKey.currentContext!
  //         .findRenderObject() as RenderRepaintBoundary;
  //     final image = await boundary.toImage(pixelRatio: 3.0);
  //     final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //     final pngBytes = byteData!.buffer.asUint8List();

  //     await Permission.storage.request();
  //     await Permission.photos.request();

  //     showModalBottomSheet(
  //       context: context,
  //       builder: (sheetContext) {
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
  //                   final tempDir = await getTemporaryDirectory();
  //                   final file =
  //                       await File('${tempDir.path}/screenshot.png').create();
  //                   await file.writeAsBytes(pngBytes);
  //                   Navigator.pop(sheetContext);
  //                   await Share.shareXFiles(
  //                     [XFile(file.path)],
  //                     text: "ॐ ब्रह्म सत्यम सर्वाधार🙏",
  //                   );
  //                 },
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

  Future<void> _searchAndNavigate(BuildContext context) async {
    final rawKeyword = _searchController.text.trim();
    // final keyword = applyPattern(rawKeyword, selectedPatternStyle);

    // if (keyword.isEmpty) return;

    _searchResult = await _pdfViewerController.searchText(rawKeyword);
    if (_searchResult.hasResult) {
      _searchResult.nextInstance();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Text not found: "$rawKeyword"')),
      );
    }
  }

  // Future<void> _searchWithFallback(String keyword) async {
  //   try {
  //     _searchResult.clear(); // Clear previous search highlights
  //
  //     // 🚫 Do NOT await directly — this avoids auto-jump
  //     final result = await _pdfViewerController.searchText(keyword);
  //
  //     if (result.hasResult) {
  //       setState(() {
  //         _searchResult = result; // Assign result after it’s fully ready
  //       });
  //
  //       // Optional: scroll back to user's current page
  //       _pdfViewerController.jumpToPage(_currentPage);
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("✅ मिला! ➡️ दबाएं आगे बढ़ने के लिए")),
  //       );
  //     } else {
  //       // OCR fallback if no result found in built-in search
  //       await ocrSearchAcrossPages(
  //         key: previewContainerKey,
  //         keyword: keyword,
  //         maxPages: 20,
  //       );
  //     }
  //   } catch (e) {
  //     print("❌ Search crash: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("❌ Search Error: $e")),
  //     );
  //   }
  // }


  // Future<void> ocrSearchAcrossPages({
  //   required GlobalKey key,
  //   required String keyword,
  //   int maxPages = 10,
  // }) async
  // {
  //   final textRecognizer = TextRecognizer();
  //   _resetOcrMatches();
  //
  //   try {
  //     for (int i = 1; i <= maxPages; i++) {
  //       _pdfViewerController.jumpToPage(i);
  //       await Future.delayed(Duration(milliseconds: 1000));
  //
  //       final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
  //       if (boundary == null) continue;
  //
  //       final image = await boundary.toImage(pixelRatio: 3.0);
  //       final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //       if (byteData == null) continue;
  //
  //       final pngBytes = byteData.buffer.asUint8List();
  //       final imageFile = await _saveTempImage(pngBytes);
  //
  //       final inputImage = InputImage.fromFilePath(imageFile.path);
  //       final visionText = await textRecognizer.processImage(inputImage);
  //       if (visionText.text.contains(keyword)) {
  //         _ocrMatchedPages.add(i);
  //       }
  //     }
  //
  //     if (_ocrMatchedPages.isNotEmpty) {
  //       _ocrMatchIndex = 0;
  //       _pdfViewerController.jumpToPage(_ocrMatchedPages[_ocrMatchIndex]);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("✅ मिला: ${_ocrMatchedPages.length} match")),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("❌ '$keyword' नहीं मिला किसी पृष्ठ में")),
  //       );
  //     }
  //   } catch (e) {
  //     print("OCR error: $e");
  //   } finally {
  //     textRecognizer.close();
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showFabOptions) ...[
            FloatingActionButton(
              backgroundColor: Color(0xFFC25123),
              heroTag: "bookmark_fab",
              mini: true,
              tooltip: 'View Bookmarks',
              child: Icon(
                Icons.bookmarks,
                color: Colors.white,
              ),
              onPressed: () => _showBookmarksDrawer(context),
            ),
            FloatingActionButton(
                backgroundColor:Color(0xFFC25123),
                heroTag: "screenshot_fab",
                mini: true,
                tooltip: 'Take Screenshot',
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await takeScreenshotAndSave(previewContainerKey);
                }
              // captureFullScrollScreenshot(context),
            ),
            FloatingActionButton(
              backgroundColor:Color(0xFFC25123),
              heroTag: "download_fab",
              mini: true,
              tooltip: 'Download',
              child: Icon(
                Icons.download,
                color: Colors.white
              ),
              onPressed: () => downloadToDownloadsFolder(),
            ),
            FloatingActionButton(
              backgroundColor:Color(0xFFC25123),
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
            backgroundColor:Color(0xFFC25123),
            heroTag: "main_fab",
            tooltip: 'More Options',
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => setState(() => _showFabOptions = !_showFabOptions),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFC25123),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("ग्रन्थ श्री समता प्रकाश"),
        actions: [
          IconButton(
            icon: Icon(
              _bookmarkedPages.contains(_currentPage)
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              color: _bookmarkedPages.contains(_currentPage)
                  ? Colors.amber
                  : Colors.white,
            ),
            onPressed: () => _toggleBookmark(context),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Doha,Doha Number,||',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color(0xFFC25123),
                    ),
                    // onSubmitted: (_) => _searchAndNavigate(context),
                  ),
                ),
                // DropdownButton<PatternStyle>(
                //   value: selectedPatternStyle,
                //   icon: Icon(Icons.arrow_drop_down, color: Color(0xFFC25123)),
                //   dropdownColor: Colors.white,
                //   underline: SizedBox(),
                //   onChanged: (newStyle) {
                //     setState(() => selectedPatternStyle = newStyle!);
                //   },
                //   items: PatternStyle.values.map((style) {
                //     final label = style.toString().split('.').last;
                //     return DropdownMenuItem(
                //       value: style,
                //       child: Text(label),
                //     );
                //   }).toList(),
                // ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _isPdfReady
                      ? () async {
                    final keyword = _searchController.text.trim();
                    if (keyword.isNotEmpty) {
                      // await _searchWithFallback(keyword);
                      await _searchAndNavigate(context);
                    }
                  }
                      : null,
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xFFC25123),
                  ),
                  tooltip: 'Previous',
                  onPressed: () => _searchResult.previousInstance(),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(0xFFC25123),
                  ),
                  tooltip: 'Next',
                  onPressed: () => _searchResult.nextInstance(),
                ),

                // IconButton(
                //   icon: Icon(
                //     _isListening ? Icons.mic_off : Icons.mic,
                //     color: Color(0xFFC25123),
                //   ),
                //   onPressed: () => _listenToVoice(context),
                // ),
              ],
            ),
          ),
          Expanded(
            child: RepaintBoundary(
              key: previewContainerKey,
              child: SfPdfViewer.network(
                widget.pdfUrl,
                controller: _pdfViewerController,
                scrollDirection: PdfScrollDirection.horizontal,
                onDocumentLoaded: (_) => setState(() => _isPdfReady = true),
                onPageChanged: (details) => setState(() => _currentPage = details.newPageNumber),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
