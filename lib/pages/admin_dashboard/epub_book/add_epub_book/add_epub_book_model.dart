import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'add_epub_book_widget.dart' show AddEpubBookWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class AddEpubBookModel extends FlutterFlowModel<AddEpubBookWidget> {
  ///  Local state fields for this page.

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadEpubBookImage = false;
  FFUploadedFile uploadedLocalFile_uploadEpubBookImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadEpubBookImage = '';

  bool isDataUploading_uploadImage = false;
  FFUploadedFile uploadedLocalFile_uploadImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadImage = '';

  // State field(s) for book_name widget.
  FocusNode? bookNameFocusNode;
  TextEditingController? bookNameTextController;
  String? Function(BuildContext, String?)? bookNameTextControllerValidator;
  // State field(s) for auther_name widget.
  FocusNode? autherNameFocusNode;
  TextEditingController? autherNameTextController;
  String? Function(BuildContext, String?)? autherNameTextControllerValidator;
  bool isDataUploading_uploadEpubUrl1 = false;
  FFUploadedFile uploadedLocalFile_uploadEpubUrl1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadEpubUrl1 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EpubBookRecord? audioref;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bookNameFocusNode?.dispose();
    bookNameTextController?.dispose();

    autherNameFocusNode?.dispose();
    autherNameTextController?.dispose();
  }
}
