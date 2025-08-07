import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/guru_ji_photo/guru_ji_photo_widget.dart';
import '/pages/component/guruji_photo_1/guruji_photo1_widget.dart';
import '/pages/component/guruji_photo_2/guruji_photo2_widget.dart';
import '/pages/component/guruji_photo_3/guruji_photo3_widget.dart';
import '/pages/component/guruji_photo_4/guruji_photo4_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'guru_ji_jeevan_page_widget.dart' show GuruJiJeevanPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GuruJiJeevanPageModel extends FlutterFlowModel<GuruJiJeevanPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
