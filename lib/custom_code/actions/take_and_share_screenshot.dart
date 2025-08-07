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

import 'dart:typed_data';
import 'dart:io';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> takeAndShareScreenshot() async {
  final controller = ScreenshotController();

  // This captures the entire app screen (you can call this from the top-level page widget)
  final image = await controller.captureFromWidget(
    MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Text('This is your screenshot content.'),
        ),
      ),
    ),
  );

  final directory = await getTemporaryDirectory();
  final imagePath = File('${directory.path}/screenshot.png');
  await imagePath.writeAsBytes(image);

  // await Share.shareFiles([imagePath.path], text: 'Check this out!');
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
