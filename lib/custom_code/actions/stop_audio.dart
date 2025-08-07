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

// // Automatic FlutterFlow imports
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom action code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:just_audio/just_audio.dart';
// import 'package:audio_session/audio_session.dart';

// final AudioPlayer globalPlayer = AudioPlayer();

// Future<void> stopAudio() async {
//   final session = await AudioSession.instance;
//   await session.configure(AudioSessionConfiguration.music());
//   await session.setActive(true);

//   await globalPlayer.stop();
// }

import 'package:samtawad_team/custom_code/global_audio_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

Future<void> stopAudio() async {
  final player = GlobalAudioManager.sharedPlayer;

  final session = await AudioSession.instance;
  await session.configure(AudioSessionConfiguration.music());
  await session.setActive(true);

  await player.stop();
}
