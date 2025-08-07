import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'questionandanswer_widget.dart' show QuestionandanswerWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class QuestionandanswerModel extends FlutterFlowModel<QuestionandanswerWidget> {
  ///  Local state fields for this page.

  List<dynamic> vahcnList = [];
  void addToVahcnList(dynamic item) => vahcnList.add(item);
  void removeFromVahcnList(dynamic item) => vahcnList.remove(item);
  void removeAtIndexFromVahcnList(int index) => vahcnList.removeAt(index);
  void insertAtIndexInVahcnList(int index, dynamic item) =>
      vahcnList.insert(index, item);
  void updateVahcnListAtIndex(int index, Function(dynamic) updateFn) =>
      vahcnList[index] = updateFn(vahcnList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
