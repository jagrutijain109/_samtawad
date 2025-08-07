// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

Future<void> showDraggableBottomSheet(BuildContext context) async {
  try {
    showModalBottomSheet(
      context: Navigator.of(context, rootNavigator: true).context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black54),
          ),
          margin: const EdgeInsets.only(top: 60), // top margin to leave drag space
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // auto-fit content height
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'शब्दावली और भावार्थ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 16),
                _buildRow('अक्षर / शब्द', 'अर्थ'),
                SizedBox(height: 8),
                _buildRow('ॐ', 'आदि नाद, मूल शक्ति, अनाहत ध्वनि'),
                _buildRow('ब्रह्म', 'सम्पूर्ण चेतना, परमात्मा, अनन्त'),
                _buildRow('सत्यम्', 'परम सत्य, अखंड, अभिनाशी'),
                _buildRow('निराकार', 'निराकार, बिना रूप के, परे से परे'),
                _buildRow('अजनमा', 'जिसे कभी जन्म नहीं हुआ, जो सृष्टि से पहले था'),
                _buildRow('अद्वैत', 'जो दो नहीं है, केवल एक है, जो'),
                SizedBox(height: 16),
                _buildRow('मूरत', 'साकार सत्ता, जो अनुभव में आ सके'),
                _buildRow('परमेश्वर', 'परम ईश्वर को'),
                _buildRow('नमस्तः', 'मैं नमन करता हूँ, पूर्ण समर्पण'),
                SizedBox(height: 16),
                Text(
                  'पूर्ण भावार्थ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 8),
                Text(
                  '“मैं उस परम तत्व को नमन करता हूँ, जो अनादि है, अजनमा है, निराकार होते हुए भी साकार अनुभव होता है, जो एक अद्वैत सत्ता है, तत्वज्ञान बताता है, संसार बंधनों का कल्याण करने वाला मुक्ति मार्ग चेतना है — वही परमेश्वर है।”',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );

  } catch (e, stacktrace) {
    print("Error while opening bottom sheet: $e");
    print(stacktrace);
  }
}

Widget _buildRow(String word, String meaning) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 80,
            child: Text(word, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
            Expanded(child: Text(meaning,style: TextStyle(color: Colors.black),)),
      ],
    ),
  );
}
