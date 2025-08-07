import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'add_answer_widget.dart' show AddAnswerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAnswerModel extends FlutterFlowModel<AddAnswerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for question_number widget.
  FocusNode? questionNumberFocusNode;
  TextEditingController? questionNumberTextController;
  String? Function(BuildContext, String?)?
      questionNumberTextControllerValidator;
  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionNumberFocusNode?.dispose();
    questionNumberTextController?.dispose();

    questionFocusNode?.dispose();
    questionTextController?.dispose();
  }
}
