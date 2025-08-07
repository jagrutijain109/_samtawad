import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/guru_ji_photo/guru_ji_photo_widget.dart';
import '/pages/component/guruji_photo_1/guruji_photo1_widget.dart';
import '/pages/component/guruji_photo_2/guruji_photo2_widget.dart';
import '/pages/component/guruji_photo_3/guruji_photo3_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'gurujipehchan_widget.dart' show GurujipehchanWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GurujipehchanModel extends FlutterFlowModel<GurujipehchanWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
