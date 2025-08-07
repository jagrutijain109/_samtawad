// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Gurupatrika extends StatefulWidget {
  const Gurupatrika({super.key});

  @override
  State<Gurupatrika> createState() => _GurupatrikaState();
}

class _GurupatrikaState extends State<Gurupatrika> {
  Map<String, bool> expanded = {};
  Map<String, List<DocumentSnapshot>> subtitleCache = {};
  Map<String, dynamic>? selectedData;

  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;
  bool isPaused = false;
  String lastSpokenText = "";
  double _fontSize = 18;
  double _speechRate = 0.45;

  List<String> _speechQueue = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    flutterTts.setCompletionHandler(() {
      _speakNextSegment();
    });
  }

  Future<void> _speakAll(String title, String description) async {
    _speechQueue = [title, description];
    _currentIndex = 0;
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setSpeechRate(_speechRate);
    await flutterTts.setPitch(1.0);
    flutterTts.setCompletionHandler(() {
      _speakNextSegment();
    });
    _speakNextSegment();
  }

  Future<void> _speakNextSegment() async {
    if (_currentIndex < _speechQueue.length) {
      lastSpokenText = _speechQueue[_currentIndex];
      await flutterTts.speak(lastSpokenText);
      setState(() {
        isSpeaking = true;
        isPaused = false;
      });
      _currentIndex++;
    } else {
      setState(() {
        isSpeaking = false;
        isPaused = false;
      });
    }
  }

  Future<void> stopSpeaking() async {
    await flutterTts.stop();
    setState(() {
      isSpeaking = false;
      isPaused = false;
    });
  }

  Future<void> pauseSpeaking() async {
    await flutterTts.pause();
    setState(() {
      isSpeaking = false;
      isPaused = true;
    });
  }

  Future<void> resumeSpeaking() async {
    if (isPaused && lastSpokenText.isNotEmpty) {
      await flutterTts.speak(lastSpokenText);
      setState(() {
        isSpeaking = true;
        isPaused = false;
      });
    }
  }


  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('गुरु पत्रिका', style: TextStyle(color: Colors.black)),

        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('guru_patrika')
              .orderBy('create_time', descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            final titleDocs = snapshot.data!.docs;
            return Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 150,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,),
                        Text(
                          'गुरु पत्रिका',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '— यह शब्दशः गुरु देव द्वारा लिखित पत्र से लिया गया है',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // DrawerHeader(
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //     ),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Text(
                  //         'Guru Patrika',
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       SizedBox(height: 6),
                  //       Text(
                  //         '— यह शब्दशः गुरु देव द्वारा लिखित पत्र से लिया गया है',
                  //         style: TextStyle(
                  //           color: Colors.black87,
                  //           fontSize: 14,
                  //           fontStyle: FontStyle.italic,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  ...titleDocs.map((titleDoc) {
                    final titleData = titleDoc.data() as Map<String, dynamic>;
                    final titleId = titleDoc.id;
                    final isExpanded = expanded[titleId] ?? false;

                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          backgroundColor: Color(0xFFF5F5F5),
                          collapsedBackgroundColor: Color(0xFFF5F5F5),
                          tilePadding: EdgeInsets.symmetric(horizontal: 16),
                          initiallyExpanded: isExpanded,
                          title: Text(titleData['title'] ?? '', style: TextStyle(color: Colors.black)),
                          onExpansionChanged: (expand) async {
                            setState(() => expanded[titleId] = expand);
                            if (expand && !subtitleCache.containsKey(titleId)) {
                              final subQuery = await FirebaseFirestore.instance
                                  .collection('guru_patrika')
                                  .doc(titleId)
                                  .collection('gurupatrika_subTitle')
                                  .orderBy('create_time', descending: false)
                                  .get();
                              setState(() => subtitleCache[titleId] = subQuery.docs);
                            }
                          },
                          children: subtitleCache[titleId]?.map((subDoc) {
                            final sub = subDoc.data() as Map<String, dynamic>;
                            return ListTile(
                              title: Text(sub['subTitle'] ?? '', style: TextStyle(color: Colors.black)),
                              onTap: () {
                                Navigator.pop(context);
                                stopSpeaking();
                                setState(() {
                                  selectedData = {
                                    'image': sub['images'],
                                    'description': sub['description'],
                                    'subTitle': sub['subTitle'],
                                  };
                                });
                              },
                            );
                          }).toList() ?? [ListTile(title: Text('Loading...'))],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: selectedData == null
            ? Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'जब तक तू अपने कल्याण के लिए स्वयं सोचेगा, समझेगा, मानेगा और उसी के मुताबिक चलेगा नहीं तब तक साक्षात् ब्रह्मा भी आ जाए तो तेरा कुछ भी नहीं बन सकता।\n\n'
                  'यह शरीर अपूर्ण है, इसके भोग अपूर्ण हैं, यह संसार अपूर्ण है... यह बात तू आज समझ ले। उठ जाग और अपने कल्याण के मार्ग पर बढ़ चला।\n\n— गुरुदेव मंगतराम जी',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black),
            ),
          ),
        )
            : PageView(
          children: [
            // Page 1 – Subtitle + Zoomable Image
            if (selectedData!['image'] != null)
              SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (selectedData!['subTitle'] != null)
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          // color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          selectedData!['subTitle'],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: InteractiveViewer(
                        minScale: 1.0,
                        maxScale: 5.0,
                        child: Image.network(
                          selectedData!['image'],
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Page 2 – Subtitle + Description + TTS Controls + Sliders
            SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF8DEB5)
                        ),
                        onPressed: isSpeaking
                            ? stopSpeaking
                            : () => _speakAll(
                            selectedData!['subTitle'], selectedData!['description']),
                        icon: Icon(isSpeaking ? Icons.stop : Icons.record_voice_over,color: Colors.black,),
                        label: Text(isSpeaking ? 'Stop' : 'Listen',style: TextStyle(color: Colors.black),),

                      ),
                      const SizedBox(width: 10),
                      // if (!isSpeaking && !isPaused)
                      //   ElevatedButton.icon(
                      //     onPressed: resumeSpeaking,
                      //     icon: Icon(Icons.play_arrow),
                      //     label: Text('Resume'),
                      //   ),
                      // if (isSpeaking)
                      //   ElevatedButton.icon(
                      //     onPressed: pauseSpeaking,
                      //     icon: Icon(Icons.pause),
                      //     label: Text('Pause'),
                      //   ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                  Text('Font Size: '),
                  Slider(
                    activeColor: Colors.black,
                    inactiveColor: Colors.black,
                    value: _fontSize,
                    min: 14,
                    max: 42,
                    divisions: 18,
                    onChanged: (val) => setState(() => _fontSize = val),
                  ),
    ]
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                  Text('Speech Rate :'),
                  Slider(
                    value: _speechRate,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black,
                    min: 0.2,
                    max: 1.0,
                    divisions: 8,
                    onChanged: (val) => setState(() => _speechRate = val),
                  ),
]
              ),
                  if (selectedData!['subTitle'] != null)
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        // color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        selectedData!['subTitle'],
                        style: TextStyle(color: Colors.black, fontSize: _fontSize),
                      ),
                    ),
                  Text(
                    selectedData!['description'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: Colors.black87,
                      height: 1.6, // More breathing room between lines
                      fontWeight: FontWeight.w400,
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


