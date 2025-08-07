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

import 'package:flutter/rendering.dart';

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class QuestionAndAnswerPage extends StatefulWidget {
  final DocumentReference questionRef;
  final double? width;
  final double? height;

  const QuestionAndAnswerPage({
    Key? key,
    this.width,
    this.height,
    required this.questionRef,
  }) : super(key: key);

  @override
  _QuestionAndAnswerPageState createState() => _QuestionAndAnswerPageState();
}

class _QuestionAndAnswerPageState extends State<QuestionAndAnswerPage> {
  ScreenshotController screenshotController = ScreenshotController();
  DocumentSnapshot? currentQuestion;
  List<QueryDocumentSnapshot>? answersList;
  final currentUser = FirebaseAuth.instance.currentUser;
  bool isFavorite = false;
  String? favoriteDocID;
  bool _showFabOptions = false;

  DocumentSnapshot? previousQuestion;
  DocumentSnapshot? nextQuestion;
  bool isBookmark = false;
  final GlobalKey previewContainerKey = GlobalKey();

  String? bookmarkDocID;

  late DocumentReference currentQuestionRef;

  FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;
  List<String> contentChunks = [];
  int currentChunkIndex = 0;

  @override
  void initState() {
    super.initState();
    currentQuestionRef = widget.questionRef;
    loadInitialData();

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
  }

  Future<void> loadInitialData() async {
    currentQuestion = await currentQuestionRef.get();
    await Future.wait([
      fetchAnswers(),
      checkFavorite(),
      checkBookmark(),
      fetchPreviousAndNextQuestions(),
    ]);
    setState(() {});
  }

  Future<void> fetchAnswers() async {
    final snapshot = await currentQuestionRef.collection('answer').get();
    answersList = snapshot.docs;

    // Client-side numeric sort
    answersList!.sort((a, b) {
      String strA = (a.get('vachan') ?? '').toString().trim();
      String strB = (b.get('vachan') ?? '').toString().trim();

      int numA = int.tryParse(strA.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      int numB = int.tryParse(strB.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      return numA.compareTo(numB);
    });
  }

  Future<void> checkFavorite() async {
    final favSnapshot = await FirebaseFirestore.instance
        .collection('question_favorites')
        .where('questionDocumentID', isEqualTo: currentQuestionRef.id)
        .where('uid', isEqualTo: currentUser?.uid)
        .limit(1)
        .get();

    if (favSnapshot.docs.isNotEmpty) {
      isFavorite = true;
      favoriteDocID = favSnapshot.docs.first.id;
    } else {
      isFavorite = false;
      favoriteDocID = null;
    }
  }

  Future<void> checkBookmark() async {
    final bookmarkSnapshot = await FirebaseFirestore.instance
        .collection('question_bookmarks')
        .where('questionDocumentID', isEqualTo: currentQuestionRef.id)
        .where('uid', isEqualTo: currentUser?.uid)
        .limit(1)
        .get();

    if (bookmarkSnapshot.docs.isNotEmpty) {
      isBookmark = true;
      bookmarkDocID = bookmarkSnapshot.docs.first.id;
    } else {
      isBookmark = false;
      bookmarkDocID = null;
    }
  }

  Future<void> fetchPreviousAndNextQuestions() async {
    int currentQuestionNumber =
        _getIntValue(currentQuestion?.get('question_number'));

    final prevSnap = await FirebaseFirestore.instance
        .collection('question')
        .where('question_number', isLessThan: currentQuestionNumber)
        .orderBy('question_number', descending: true)
        .limit(1)
        .get();

    previousQuestion = prevSnap.docs.isNotEmpty ? prevSnap.docs.first : null;

    final nextSnap = await FirebaseFirestore.instance
        .collection('question')
        .where('question_number', isGreaterThan: currentQuestionNumber)
        .orderBy('question_number')
        .limit(1)
        .get();

    nextQuestion = nextSnap.docs.isNotEmpty ? nextSnap.docs.first : null;
  }

  int _getIntValue(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  Future<void> toggleBookmark() async {
    if(FFAppState().islogin) {
      if (isBookmark) {
        setState(() => isBookmark = false);
        if (bookmarkDocID != null) {
          await FirebaseFirestore.instance
              .collection('question_bookmarks')
              .doc(bookmarkDocID)
              .delete();
          bookmarkDocID = null;
        }
      } else {
        setState(() => isBookmark = true);
        final docRef = await FirebaseFirestore.instance
            .collection('question_bookmarks')
            .add({
          'questionDocumentID': currentQuestionRef.id,
          'questionname': currentQuestion!.get('question_name') ?? '',
          'questionnumber': currentQuestion!.get('question_number') ?? '',
          'pageno': currentQuestion!.get('page_no') ?? '',
          'timestamp': FieldValue.serverTimestamp(),
          'uid': currentUser?.uid,
        });
        bookmarkDocID = docRef.id;
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

  Future<void> toggleFavorite() async {
    if (FFAppState().islogin) {
      if (isFavorite) {
        setState(() => isFavorite = false);
        if (favoriteDocID != null) {
          await FirebaseFirestore.instance
              .collection('question_favorites')
              .doc(favoriteDocID)
              .delete();
          favoriteDocID = null;
        }
      } else {
        setState(() => isFavorite = true);
        List<Map<String, dynamic>> answers = answersList!.map((doc) {
          return {
            'vachan': doc.get('vachan') ?? '',
            'description': doc.get('description') ?? '',
          };
        }).toList();

        final docRef = await FirebaseFirestore.instance
            .collection('question_favorites')
            .add({
          'questionDocumentID': currentQuestionRef.id,
          'questionname': currentQuestion!.get('question_name') ?? '',
          'questionnumber': currentQuestion!.get('question_number') ?? '',
          'pageno': currentQuestion!.get('page_no') ?? '',
          'answers': answers,
          'timestamp': FieldValue.serverTimestamp(),
          'uid': currentUser?.uid,
        });

        favoriteDocID = docRef.id;
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

  Future<void> shareContent() async {
    if (answersList == null) return;

    StringBuffer shareText = StringBuffer();
    shareText.writeln(currentQuestion!.get('question_name') ?? '');
    shareText.writeln('');

    for (var doc in answersList!) {
      final vachan = doc.get('vachan') ?? '';
      final description = doc.get('description') ?? '';
      shareText.writeln("👉 $vachan");
      shareText.writeln(description);
      shareText.writeln('');
    }

    await Share.share(shareText.toString());
  }

  Future<void> handleSpeakToggle() async {
    if (!isSpeaking) {
      if (currentQuestion == null ||
          answersList == null ||
          answersList!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Answers not loaded yet. Please wait.")),
        );
        return;
      }

      if (contentChunks.isEmpty || currentChunkIndex == 0) {
        String fullContent = '';
        fullContent += currentQuestion!.get('question_name') ?? '';
        for (var doc in answersList!) {
          final vachan = doc.get('vachan') ?? '';
          final description = doc.get('description') ?? '';
          fullContent += '\n$vachan\n$description';
        }
        contentChunks = fullContent.split('.');
        currentChunkIndex = 0;
      }

      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.setLanguage("hi-IN");
      await flutterTts.setSpeechRate(0.3);
      setState(() => isSpeaking = true);
      speakChunks();
    } else {
      await flutterTts.stop();
      setState(() => isSpeaking = false);
    }
  }

  Future<void> speakChunks() async {
    if (currentChunkIndex >= contentChunks.length) {
      setState(() => isSpeaking = false);
      return;
    }
    String text = contentChunks[currentChunkIndex];
    currentChunkIndex++;
    await flutterTts.speak(text);
    flutterTts.setCompletionHandler(() {
      if (isSpeaking) {
        speakChunks();
      }
    });
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
      if (imageBytes == null) return;

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

  Future<void> _showFavoritesBottomSheet() async {
    final favSnapshot = await FirebaseFirestore.instance
        .collection('question_favorites')
        .where('uid', isEqualTo: currentUser?.uid)
        // .orderBy('timestamp', descending: true)
        .get();

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: favSnapshot.docs.isEmpty
              ? Text('No favorite questions found.')
              : ListView.builder(
                  itemCount: favSnapshot.docs.length,
                  itemBuilder: (context, index) {
                    final doc = favSnapshot.docs[index];
                    final title = doc['questionname'] ?? 'Untitled';
                    final subtitle = doc['questionnumber'] ?? 'Untitled';
                    final questionRefId = doc['questionDocumentID'] ?? '';

                    return ListTile(
                      title: Text("$subtitle" + "." + " "+title),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          currentQuestionRef = FirebaseFirestore.instance
                              .collection('question')
                              .doc(questionRefId);
                        });
                        loadInitialData();
                      },
                    );
                  },
                ),
        );
      },
    );
  }

  Future<void> _showBookmarksBottomSheet() async {
    final bookmarkSnapshot = await FirebaseFirestore.instance
        .collection('question_bookmarks')
        .where('uid', isEqualTo: currentUser?.uid)
        // .orderBy('timestamp', descending: true)
        .get();

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: bookmarkSnapshot.docs.isEmpty
              ? Text('No bookmarked questions found.')
              : ListView.builder(
                  itemCount: bookmarkSnapshot.docs.length,
                  itemBuilder: (context, index) {
                    final doc = bookmarkSnapshot.docs[index];
                    final number = doc['questionnumber'] ?? 'Unitled';
                    final title = doc['questionname'] ?? 'Untitled';
                    final questionRefId = doc['questionDocumentID'] ?? '';

                    return ListTile(
                      title: Text("$number"+"." + " " + "$title"),

                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          currentQuestionRef = FirebaseFirestore.instance
                              .collection('question')
                              .doc(questionRefId);
                        });
                        loadInitialData();
                      },
                    );
                  },
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion == null || answersList == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showFabOptions) ...[
            FloatingActionButton(
              backgroundColor: Color(0xFFc25123),
              heroTag: "view_favorites",
              tooltip: 'View Favorites',
              child: Icon(Icons.favorite, color: Colors.white),
              onPressed: () async {
                await _showFavoritesBottomSheet();
              },
            ),
            FloatingActionButton(
              backgroundColor: Color(0xFFC25123),
              heroTag: "view_bookmarks",
              tooltip: 'View Bookmarks',
              child: Icon(Icons.stars, color: Colors.white),
              onPressed: () async {
                await _showBookmarksBottomSheet();
              },
            ),
            FloatingActionButton(
              backgroundColor: Color(0xFFC25123),
              heroTag: "close_fab",
              mini: true,
              child: Icon(Icons.close,color: Colors.white,),
              onPressed: () {
                setState(() => _showFabOptions = false);
              },
            ),
          ],
          FloatingActionButton(
            heroTag: "main_fab",
            child: Icon(Icons.menu,color: Colors.white,),
            backgroundColor: Color(0xFFC25123),
            onPressed: () {
              setState(() => _showFabOptions = !_showFabOptions);
            },
          ),
        ],
      ),
      body:
      // SafeArea(
      //   child: RepaintBoundary(
      //     key: previewContainerKey,
      //     child: LayoutBuilder(
      //       builder: (context, constraints) {
      //         return ListView(
      //           padding: EdgeInsets.zero,
      //           children: [
      //             buildTopHeader(),
      //             buildQuestionNavigation(),
      //             ConstrainedBox(
      //               constraints: BoxConstraints(
      //                 minHeight: constraints.maxHeight,
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(16),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     const SizedBox(height: 15),
      //                     Text(
      //                       "Page No: ${currentQuestion!.get('page_no') ?? ''}",
      //                       style: const TextStyle(fontSize: 16, color: Color(0xFFC25123)),
      //                     ),
      //                     const SizedBox(height: 20),
      //                     ...answersList!.map((doc) {
      //                       final vachan = doc.get('vachan') ?? '';
      //                       final description = doc.get('description') ?? '';
      //                       return Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Row(
      //                             children: [
      //                               const Text("वचन: ",
      //                                   style: TextStyle(
      //                                       fontSize: 16,
      //                                       fontWeight: FontWeight.bold,
      //                                       color: Color(0xFFC25123))),
      //                               Expanded(
      //                                 child: Text(
      //                                   vachan,
      //                                   style: const TextStyle(
      //                                       fontSize: 16,
      //                                       fontWeight: FontWeight.bold,
      //                                       color: Color(0xFFC25123)),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           const SizedBox(height: 5),
      //                           Text(
      //                             description,
      //                             style: TextStyle(fontSize: 16, color: Colors.grey[800]),
      //                           ),
      //                           // const SizedBox(height: 15),
      //                         ],
      //                       );
      //                     }).toList(),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         );
      //       },
      //     ),
      //   ),
      // ),
      SafeArea(
        child: RepaintBoundary(
          key: previewContainerKey,
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildTopHeader(),
                SizedBox(height: 10,),
                buildQuestionNavigation(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        "Page No: ${currentQuestion!.get('page_no') ?? ''}",
                        style: const TextStyle(fontSize: 16, color: Color(0xFFC25123)),
                      ),
                      const SizedBox(height: 20),
                      ...answersList!.map((doc) {
                        final vachan = doc.get('vachan') ?? '';
                        final description = doc.get('description') ?? '';
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("वचन: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFC25123))),
                                Expanded(
                                  child: Text(
                                    vachan,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFC25123)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              description,
                              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                            ),
                            const SizedBox(height: 8),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      // body: SafeArea(
      //   child: Screenshot(
      //     controller: screenshotController,
      //     child: ListView(
      //       padding: EdgeInsets.zero,
      //       children: [
      //         buildTopHeader(),
      //         buildQuestionNavigation(),
      //         Padding(
      //           padding: const EdgeInsets.all(16),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               const SizedBox(height: 15),
      //               Text(
      //                 "Page No: ${currentQuestion!.get('page_no') ?? ''}",
      //                 style: const TextStyle(
      //                     fontSize: 16, color: Color(0xFFC25123)),
      //               ),
      //               const SizedBox(height: 20),
      //               ...answersList!.map((doc) {
      //                 final vachan = doc.get('vachan') ?? '';
      //                 final description = doc.get('description') ?? '';
      //                 return Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         const Text("वचन: ",
      //                             style: TextStyle(
      //                                 fontSize: 16,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Color(0xFFC25123))),
      //                         Expanded(
      //                           child: Text(
      //                             vachan,
      //                             style: const TextStyle(
      //                                 fontSize: 16,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Color(0xFFC25123)),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     const SizedBox(height: 5),
      //                     Text(
      //                       description,
      //                       style: TextStyle(
      //                           fontSize: 16, color: Colors.grey[800]),
      //                     ),
      //                     const SizedBox(height: 15),
      //                   ],
      //                 );
      //               }).toList(),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget buildTopHeader() {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meditation-app-template-u-i-tevvk0/assets/pqmv8sqyiwn2/Samtawad_UIUX__21_-removebg-preview_(1).png',
                fit: BoxFit.contain,
              ),
              const Text(
                'श्री समता विलास अध्याय सहित्',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC25123)),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 28, color: Color(0xFFC25123)),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined,
                  size: 30, color: Color(0xFFC25123)),
              onPressed: () async {
                await takeScreenshotAndSave(previewContainerKey);
                // await captureAndUploadScreenshot(screenshotController);
              },
            ),
            IconButton(
              icon: const Icon(Icons.share_sharp,
                  size: 30, color: Color(0xFFC25123)),
              onPressed: shareContent,
            ),
            IconButton(
              icon: Icon(Icons.favorite,
                  size: 30, color: isFavorite ? Colors.red : Color(0xFFC25123)),
              onPressed: toggleFavorite,
            ),
            IconButton(
              icon: Icon(Icons.stars,
                  size: 30, color: isBookmark ? Colors.red : Color(0xFFC25123)),
              onPressed: toggleBookmark,
            ),
            IconButton(
              icon: Icon(isSpeaking ? Icons.pause : Icons.volume_up,
                  size: 30, color: Color(0xFFC25123)),
              onPressed: handleSpeakToggle,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildQuestionNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        previousQuestion != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    currentQuestionRef = previousQuestion!.reference;
                  });
                  loadInitialData();
                },
                child: buildCircleButtonWithImage(
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meditation-app-template-u-i-tevvk0/assets/45x0ez7yg2hn/back_arrow.png'),
              )
            : const SizedBox(width: 48),
        const SizedBox(width: 20),
        Expanded(
          child: Row(
            children: [
              Text(
                currentQuestion!.get('question_number').toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text('.',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  currentQuestion!.get('question_name') ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        nextQuestion != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    currentQuestionRef = nextQuestion!.reference;
                  });
                  loadInitialData();
                },
                child: buildCircleButtonWithImage(
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meditation-app-template-u-i-tevvk0/assets/vi3p7918id8i/next_arrow.png'),
              )
            : const SizedBox(width: 48),
      ],
    );
  }

  Widget buildCircleButtonWithImage(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(8),
      child:
          Image.network(imageUrl, width: 30, height: 30, fit: BoxFit.contain),
    );
  }
}
