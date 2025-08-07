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
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/widgets.dart';

AudioPlayer? globalPlayer;

class AudioLifecycleHandler with WidgetsBindingObserver {
  static final _instance = AudioLifecycleHandler._internal();

  factory AudioLifecycleHandler() => _instance;

  AudioLifecycleHandler._internal();

  void init() {
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (globalPlayer != null) {
      if (state == AppLifecycleState.paused ||
          state == AppLifecycleState.inactive) {
        globalPlayer!.pause();
      } else if (state == AppLifecycleState.resumed) {
        globalPlayer!.play();
      }
    }
  }
}

Future<void> controlLoopAudio(String url, bool shouldPlay) async {
  if (!shouldPlay) {
    await globalPlayer?.stop();
    await globalPlayer?.dispose();
    globalPlayer = null;
    AudioLifecycleHandler().dispose();
    return;
  }

  // Set up the audio session for full audio focus
  final session = await AudioSession.instance;
  await session.configure(AudioSessionConfiguration.music());

  globalPlayer?.dispose();
  globalPlayer = AudioPlayer();

  // Start listening to lifecycle changes
  AudioLifecycleHandler().init();

  // Grab focus and interrupt other apps
  await session.setActive(true);

  await globalPlayer!.setUrl(url);
  await globalPlayer!.setLoopMode(LoopMode.one);
  await globalPlayer!.play();
}
