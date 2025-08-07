// Automatic FlutterFlow imports
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

import 'package:flutter_tts/flutter_tts.dart';

class VoiceSelectorWidget extends StatefulWidget {
  const VoiceSelectorWidget({
    Key? key,
    this.width = 300,
    this.height = 400,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _VoiceSelectorWidgetState createState() => _VoiceSelectorWidgetState();
}

class _VoiceSelectorWidgetState extends State<VoiceSelectorWidget> {
  FlutterTts flutterTts = FlutterTts();
  List<dynamic> allVoices = [];
  dynamic selectedVoice;
  double ttsSpeed = 0.4;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // _pdfViewerController = PdfViewerController();
    // _searchResult = PdfTextSearchResult();
    // _speech = stt.SpeechToText();
    // _checkMicPermission();
    // _loadBookmarksFromFirestore();

    // Show popup message about large PDF
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPdfLoadInfoDialog(context);
    });
  }

  Future<void> _initTts() async {
    try {
      await flutterTts.setLanguage('hi-IN');
      await flutterTts.setSpeechRate(ttsSpeed);

      List<dynamic> voices = await flutterTts.getVoices;
      allVoices = voices;

      voices.forEach((voice) {
        print('${voice['name']} - ${voice['locale']}');
      });

      final femaleVoice = voices.firstWhere((voice) {
        final name = voice['name'].toString().toLowerCase();
        return name.contains('female') || name.contains('hindifemale');
      }, orElse: () => voices.isNotEmpty ? voices[0] : null);

      selectedVoice = femaleVoice;
    } catch (e) {
      print('Error initializing TTS: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _setVoice() async {
    if (selectedVoice != null) {
      await flutterTts.setLanguage(selectedVoice['locale']);
      await flutterTts.setSpeechRate(ttsSpeed);
      await flutterTts.setVoice(
          {"name": selectedVoice['name'], "locale": selectedVoice['locale']});
    }
  }

  Future<void> speakText(String text) async {
    await _setVoice();
    await flutterTts.speak(text);
  }

  void _showPdfLoadInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("📄 ध्यान दें"),
          content: Text(
            "यह PDF फ़ाइल बड़ी है, इसलिए इसे लोड होने में थोड़ा समय लग सकता है। यदि आपका नेटवर्क धीमा है, तब भी कृपया प्रतीक्षा करें।",
          ),
          actions: [
            TextButton(
              child: Text("ठीक है"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void selectMaleVoice() {
    if (allVoices.isEmpty) {
      print("Voices not loaded yet.");
      return;
    }
    final maleVoice = allVoices.firstWhere((voice) {
      final name = voice['name'].toString().toLowerCase();
      return name.contains('male') || name.contains('hindimale');
    }, orElse: () => allVoices[0]);

    setState(() {
      selectedVoice = maleVoice;
    });
  }

  void selectFemaleVoice() {
    if (allVoices.isEmpty) {
      print("Voices not loaded yet.");
      return;
    }
    final femaleVoice = allVoices.firstWhere((voice) {
      final name = voice['name'].toString().toLowerCase();
      return name.contains('female') || name.contains('hindifemale');
    }, orElse: () => allVoices[0]);

    setState(() {
      selectedVoice = femaleVoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select Your Voice",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: selectMaleVoice,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: (selectedVoice != null &&
                                      (selectedVoice['name']
                                              .toString()
                                              .toLowerCase()
                                              .contains('male') ||
                                          selectedVoice['name']
                                              .toString()
                                              .toLowerCase()
                                              .contains('hindimale')))
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/236/236831.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: 8),
                            Text("Male", style: TextStyle(fontSize: 18))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: selectFemaleVoice,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: (selectedVoice != null &&
                                      (selectedVoice['name']
                                              .toString()
                                              .toLowerCase()
                                              .contains('female') ||
                                          selectedVoice['name']
                                              .toString()
                                              .toLowerCase()
                                              .contains('hindifemale')))
                                  ? Colors.pink
                                  : Colors.grey,
                              width: 3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/236/236832.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: 8),
                            Text("Female", style: TextStyle(fontSize: 18))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => speakText("આનું પરીક્ષણ થઈ રહ્યું છે."),
                  child: Text("Test Speak"),
                ),
                SizedBox(height: 20),
                Text(
                  selectedVoice != null
                      ? 'Selected: ${selectedVoice['name']}'
                      : 'No voice selected',
                ),
              ],
            ),
    );
  }
}
