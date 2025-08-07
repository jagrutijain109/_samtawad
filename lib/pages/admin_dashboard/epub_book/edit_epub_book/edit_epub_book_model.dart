import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_epub_book_widget.dart' show EditEpubBookWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditEpubBookModel extends FlutterFlowModel<EditEpubBookWidget> {
  ///  Local state fields for this page.

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadEpubEditImage = false;
  FFUploadedFile uploadedLocalFile_uploadEpubEditImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadEpubEditImage = '';

  // State field(s) for book_name widget.
  FocusNode? bookNameFocusNode;
  TextEditingController? bookNameTextController;
  String? Function(BuildContext, String?)? bookNameTextControllerValidator;
  // State field(s) for auther_name widget.
  FocusNode? autherNameFocusNode;
  TextEditingController? autherNameTextController;
  String? Function(BuildContext, String?)? autherNameTextControllerValidator;
  // State field(s) for epub_url widget.
  FocusNode? epubUrlFocusNode;
  TextEditingController? epubUrlTextController;
  String? Function(BuildContext, String?)? epubUrlTextControllerValidator;
  bool isDataUploading_uploadEpubUrl2 = false;
  FFUploadedFile uploadedLocalFile_uploadEpubUrl2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadEpubUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bookNameFocusNode?.dispose();
    bookNameTextController?.dispose();

    autherNameFocusNode?.dispose();
    autherNameTextController?.dispose();

    epubUrlFocusNode?.dispose();
    epubUrlTextController?.dispose();
  }
}
