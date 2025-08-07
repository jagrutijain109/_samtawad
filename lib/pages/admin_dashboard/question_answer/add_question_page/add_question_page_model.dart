import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'add_question_page_widget.dart' show AddQuestionPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddQuestionPageModel extends FlutterFlowModel<AddQuestionPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? question;

  List<String> guruvachanList = [];
  void addToGuruvachanList(String item) => guruvachanList.add(item);
  void removeFromGuruvachanList(String item) => guruvachanList.remove(item);
  void removeAtIndexFromGuruvachanList(int index) =>
      guruvachanList.removeAt(index);
  void insertAtIndexInGuruvachanList(int index, String item) =>
      guruvachanList.insert(index, item);
  void updateGuruvachanListAtIndex(int index, Function(String) updateFn) =>
      guruvachanList[index] = updateFn(guruvachanList[index]);

  String? guruvachanInput;

  List<String> descriptionList = [];
  void addToDescriptionList(String item) => descriptionList.add(item);
  void removeFromDescriptionList(String item) => descriptionList.remove(item);
  void removeAtIndexFromDescriptionList(int index) =>
      descriptionList.removeAt(index);
  void insertAtIndexInDescriptionList(int index, String item) =>
      descriptionList.insert(index, item);
  void updateDescriptionListAtIndex(int index, Function(String) updateFn) =>
      descriptionList[index] = updateFn(descriptionList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for question_number widget.
  FocusNode? questionNumberFocusNode;
  TextEditingController? questionNumberTextController;
  String? Function(BuildContext, String?)?
      questionNumberTextControllerValidator;
  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  // State field(s) for page_no widget.
  FocusNode? pageNoFocusNode;
  TextEditingController? pageNoTextController;
  String? Function(BuildContext, String?)? pageNoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionNumberFocusNode?.dispose();
    questionNumberTextController?.dispose();

    questionFocusNode?.dispose();
    questionTextController?.dispose();

    pageNoFocusNode?.dispose();
    pageNoTextController?.dispose();
  }
}
