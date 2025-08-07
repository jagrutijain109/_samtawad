import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'samta_prakash_widget.dart' show SamtaPrakashWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SamtaPrakashModel extends FlutterFlowModel<SamtaPrakashWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for footr component.
  late FootrModel footrModel;

  @override
  void initState(BuildContext context) {
    footrModel = createModel(context, () => FootrModel());
  }

  @override
  void dispose() {
    footrModel.dispose();
  }
}
