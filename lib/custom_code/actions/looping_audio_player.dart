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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
// Import packages
import 'package:just_audio/just_audio.dart';
// Import packages
import 'package:just_audio/just_audio.dart';

import 'package:just_audio/just_audio.dart';

// Global player instance (optional: move to global scope if needed)
import 'package:just_audio/just_audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final AudioPlayer _player = AudioPlayer();

Future<void> loopingAudioPlayer(List vaniList, bool looping) async {
  int currentIndex = 0;

  Future<void> playAtIndex(int index) async {
    final url = vaniList[index].get('audio') as String;
    await _player.setUrl(url);
    await _player.play();
  }

  await playAtIndex(currentIndex);

  _player.playerStateStream.listen((state) async {
    if (state.processingState == ProcessingState.completed) {
      if (looping) {
        currentIndex = (currentIndex + 1) % vaniList.length;
        await playAtIndex(currentIndex);
      }
    }
  });
}
