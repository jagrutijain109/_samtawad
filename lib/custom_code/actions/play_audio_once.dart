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

import 'package:just_audio/just_audio.dart';
import 'package:samtawad_team/custom_code/global_audio_manager.dart';

// Future<void> playAudioOnce(String url) async {
//   final player = GlobalAudioManager.sharedPlayer;
//
//   if (player.playing) {
//     await player.stop(); // Stop current playback
//   } else {
//     await player.setLoopMode(LoopMode.off); // Play once
//     await player.setUrl(url); // Load the audio
//     await player.play(); // Start playback
//   }
// }

Future<bool> playAudioOnce(String url) async {
  final player = GlobalAudioManager.sharedPlayer;

  if (player.playing) {
    await player.stop(); // Stop current playback
    return false; // Audio stopped
  } else {
    await player.setLoopMode(LoopMode.off); // Play once
    await player.setUrl(url); // Load the audio
    await player.play(); // Start playback
    return true; // Audio started playing
  }
}
