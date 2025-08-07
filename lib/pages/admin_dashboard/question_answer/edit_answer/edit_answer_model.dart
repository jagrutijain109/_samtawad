import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_answer_widget.dart' show EditAnswerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAnswerModel extends FlutterFlowModel<EditAnswerWidget> {
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

  // State field(s) for vachan widget.
  FocusNode? vachanFocusNode;
  TextEditingController? vachanTextController;
  String? Function(BuildContext, String?)? vachanTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    vachanFocusNode?.dispose();
    vachanTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
