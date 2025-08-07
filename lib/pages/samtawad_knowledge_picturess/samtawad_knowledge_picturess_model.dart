import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/appbar/appbar_widget.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'samtawad_knowledge_picturess_widget.dart'
    show SamtawadKnowledgePicturessWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SamtawadKnowledgePicturessModel
    extends FlutterFlowModel<SamtawadKnowledgePicturessWidget> {
  ///  Local state fields for this page.

  int intexNumber = 0;

  bool isFavorite = false;

  int maxIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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
