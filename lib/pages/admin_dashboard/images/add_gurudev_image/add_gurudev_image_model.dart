import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'add_gurudev_image_widget.dart' show AddGurudevImageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddGurudevImageModel extends FlutterFlowModel<AddGurudevImageWidget> {
  ///  Local state fields for this page.

  int? currentMaxId;

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_addGurudevImage = false;
  FFUploadedFile uploadedLocalFile_addGurudevImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_addGurudevImage = '';

  // State field(s) for tags widget.
  FocusNode? tagsFocusNode;
  TextEditingController? tagsTextController;
  String? Function(BuildContext, String?)? tagsTextControllerValidator;
  // State field(s) for edd_information widget.
  FocusNode? eddInformationFocusNode;
  TextEditingController? eddInformationTextController;
  String? Function(BuildContext, String?)?
      eddInformationTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? gurujiImageCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tagsFocusNode?.dispose();
    tagsTextController?.dispose();

    eddInformationFocusNode?.dispose();
    eddInformationTextController?.dispose();
  }
}
