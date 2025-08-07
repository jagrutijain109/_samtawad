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

import 'package:flutter_tts/flutter_tts.dart';

Future<void> speakMaleVoice(String text, String language) async {
  FlutterTts flutterTts = FlutterTts();

  // Set language and male voice
  if (language == 'en') {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVoice({
      'name': 'en-in-x-end-network',
      'locale': 'en-IN',
    });
  } else if (language == 'hi') {
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setVoice({
      'name': 'hi-in-x-hie-local',
      'locale': 'hi-IN',
    });
  } else {
    // fallback: default to English male voice
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVoice({
      'name': 'en-in-x-end-network',
      'locale': 'en-IN',
    });
  }

  await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.setVolume(1.0);
  await flutterTts.speak(text);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
