import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'add_epubbook_chapters_widget.dart' show AddEpubbookChaptersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddEpubbookChaptersModel
    extends FlutterFlowModel<AddEpubbookChaptersWidget> {
  ///  Local state fields for this page.

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for chapter_number widget.
  FocusNode? chapterNumberFocusNode;
  TextEditingController? chapterNumberTextController;
  String? Function(BuildContext, String?)? chapterNumberTextControllerValidator;
  // State field(s) for chapter_name widget.
  FocusNode? chapterNameFocusNode;
  TextEditingController? chapterNameTextController;
  String? Function(BuildContext, String?)? chapterNameTextControllerValidator;
  // State field(s) for start_page_no widget.
  FocusNode? startPageNoFocusNode;
  TextEditingController? startPageNoTextController;
  String? Function(BuildContext, String?)? startPageNoTextControllerValidator;
  // State field(s) for end_page_no widget.
  FocusNode? endPageNoFocusNode;
  TextEditingController? endPageNoTextController;
  String? Function(BuildContext, String?)? endPageNoTextControllerValidator;
  // State field(s) for EdditionalInformation widget.
  FocusNode? edditionalInformationFocusNode;
  TextEditingController? edditionalInformationTextController;
  String? Function(BuildContext, String?)?
      edditionalInformationTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChapterRecord? audioref;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    chapterNumberFocusNode?.dispose();
    chapterNumberTextController?.dispose();

    chapterNameFocusNode?.dispose();
    chapterNameTextController?.dispose();

    startPageNoFocusNode?.dispose();
    startPageNoTextController?.dispose();

    endPageNoFocusNode?.dispose();
    endPageNoTextController?.dispose();

    edditionalInformationFocusNode?.dispose();
    edditionalInformationTextController?.dispose();
  }
}
