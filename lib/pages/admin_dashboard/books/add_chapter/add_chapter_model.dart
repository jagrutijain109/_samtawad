import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'add_chapter_widget.dart' show AddChapterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddChapterModel extends FlutterFlowModel<AddChapterWidget> {
  ///  Local state fields for this page.

  int? id;

  ///  State fields for stateful widgets in this page.

  // State field(s) for chapter_number widget.
  FocusNode? chapterNumberFocusNode;
  TextEditingController? chapterNumberTextController;
  String? Function(BuildContext, String?)? chapterNumberTextControllerValidator;
  // State field(s) for chapter_name widget.
  FocusNode? chapterNameFocusNode;
  TextEditingController? chapterNameTextController;
  String? Function(BuildContext, String?)? chapterNameTextControllerValidator;
  bool isDataUploading_uploadChaptersLyrics = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadChaptersLyrics = [];
  List<String> uploadedFileUrls_uploadChaptersLyrics = [];

  bool isDataUploading_uploadDataQzj = false;
  FFUploadedFile uploadedLocalFile_uploadDataQzj =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataQzj = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? chapterCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    chapterNumberFocusNode?.dispose();
    chapterNumberTextController?.dispose();

    chapterNameFocusNode?.dispose();
    chapterNameTextController?.dispose();
  }
}
