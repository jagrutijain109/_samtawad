import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import 'maha_mantra_page_widget.dart' show MahaMantraPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MahaMantraPageModel extends FlutterFlowModel<MahaMantraPageWidget> {
  ///  State fields for stateful widgets in this component.

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
