import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_audio_book_widget.dart' show EditAudioBookWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAudioBookModel extends FlutterFlowModel<EditAudioBookWidget> {
  ///  Local state fields for this page.

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadeditAudioImage = false;
  FFUploadedFile uploadedLocalFile_uploadeditAudioImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadeditAudioImage = '';

  bool isDataUploading_uploadEditAudioBookLyrics = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadEditAudioBookLyrics = [];
  List<String> uploadedFileUrls_uploadEditAudioBookLyrics = [];

  // State field(s) for book_name widget.
  FocusNode? bookNameFocusNode;
  TextEditingController? bookNameTextController;
  String? Function(BuildContext, String?)? bookNameTextControllerValidator;
  bool isDataUploading_uploadDataKfl = false;
  FFUploadedFile uploadedLocalFile_uploadDataKfl =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataKfl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bookNameFocusNode?.dispose();
    bookNameTextController?.dispose();
  }
}
