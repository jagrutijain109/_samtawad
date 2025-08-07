import '/auth/firebase_auth/auth_util.dart';
import '/components/guru_ji_jeevan_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'guru_ji_ka_jivan_and_sadhna_widget.dart'
    show GuruJiKaJivanAndSadhnaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GuruJiKaJivanAndSadhnaModel
    extends FlutterFlowModel<GuruJiKaJivanAndSadhnaWidget> {
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
