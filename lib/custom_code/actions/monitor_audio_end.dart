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
import 'dart:async';
import 'package:just_audio/just_audio.dart';

AudioPlayer? globalPlayer;

Future<bool> monitorAudioEnd(String url) async {
  globalPlayer?.dispose();
  globalPlayer = AudioPlayer();

  await globalPlayer!.setUrl(url);
  await globalPlayer!.play();

  final completer = Completer<bool>();

  globalPlayer!.playerStateStream.listen((state) {
    if (state.processingState == ProcessingState.completed &&
        !completer.isCompleted) {
      completer.complete(true);
    }
  });

  return completer.future;
}
