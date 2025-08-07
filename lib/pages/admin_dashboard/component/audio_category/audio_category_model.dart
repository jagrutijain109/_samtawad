import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'audio_category_widget.dart' show AudioCategoryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AudioCategoryModel extends FlutterFlowModel<AudioCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Speakername widget.
  FocusNode? speakernameFocusNode;
  TextEditingController? speakernameTextController;
  String? Function(BuildContext, String?)? speakernameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    speakernameFocusNode?.dispose();
    speakernameTextController?.dispose();
  }
}
