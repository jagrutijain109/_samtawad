import '/auth/firebase_auth/auth_util.dart';
import '/components/param_nidhan_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'param_nidhan_widget.dart' show ParamNidhanWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParamNidhanModel extends FlutterFlowModel<ParamNidhanWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for paramNidhan_page component.
  late ParamNidhanPageModel paramNidhanPageModel;
  // Model for footr component.
  late FootrModel footrModel;

  @override
  void initState(BuildContext context) {
    paramNidhanPageModel = createModel(context, () => ParamNidhanPageModel());
    footrModel = createModel(context, () => FootrModel());
  }

  @override
  void dispose() {
    paramNidhanPageModel.dispose();
    footrModel.dispose();
  }
}
