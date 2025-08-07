import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/appbar/appbar_widget.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import 'mainpage_widget.dart' show MainpageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainpageModel extends FlutterFlowModel<MainpageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appbar component.
  late AppbarModel appbarModel;
  // Model for footr component.
  late FootrModel footrModel;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    footrModel = createModel(context, () => FootrModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    footrModel.dispose();
  }
}
