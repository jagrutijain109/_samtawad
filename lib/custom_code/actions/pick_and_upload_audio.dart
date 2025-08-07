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

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

Future<String?> pickAndUploadAudio() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3', 'wav', 'm4a'],
  );

  if (result != null && result.files.single.path != null) {
    final filePath = result.files.single.path!;
    final fileName = result.files.single.name;

    final storageRef = FirebaseStorage.instance.ref().child('audios/$fileName');
    await storageRef.putFile(File(filePath));
    final downloadUrl = await storageRef.getDownloadURL();

    return downloadUrl;
  }

  return null;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
