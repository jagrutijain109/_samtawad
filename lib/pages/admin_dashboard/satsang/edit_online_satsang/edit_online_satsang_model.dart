import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_online_satsang_widget.dart' show EditOnlineSatsangWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditOnlineSatsangModel extends FlutterFlowModel<EditOnlineSatsangWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for satsang_name widget.
  FocusNode? satsangNameFocusNode;
  TextEditingController? satsangNameTextController;
  String? Function(BuildContext, String?)? satsangNameTextControllerValidator;
  String? _satsangNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kyk35b6w' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for satsang_contact_info widget.
  FocusNode? satsangContactInfoFocusNode;
  TextEditingController? satsangContactInfoTextController;
  String? Function(BuildContext, String?)?
      satsangContactInfoTextControllerValidator;
  // State field(s) for link_satsang widget.
  FocusNode? linkSatsangFocusNode;
  TextEditingController? linkSatsangTextController;
  String? Function(BuildContext, String?)? linkSatsangTextControllerValidator;
  // State field(s) for start_date widget.
  FocusNode? startDateFocusNode;
  TextEditingController? startDateTextController;
  String? Function(BuildContext, String?)? startDateTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for end_date widget.
  FocusNode? endDateFocusNode;
  TextEditingController? endDateTextController;
  String? Function(BuildContext, String?)? endDateTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for satsang_note widget.
  FocusNode? satsangNoteFocusNode;
  TextEditingController? satsangNoteTextController;
  String? Function(BuildContext, String?)? satsangNoteTextControllerValidator;

  @override
  void initState(BuildContext context) {
    satsangNameTextControllerValidator = _satsangNameTextControllerValidator;
  }

  @override
  void dispose() {
    satsangNameFocusNode?.dispose();
    satsangNameTextController?.dispose();

    satsangContactInfoFocusNode?.dispose();
    satsangContactInfoTextController?.dispose();

    linkSatsangFocusNode?.dispose();
    linkSatsangTextController?.dispose();

    startDateFocusNode?.dispose();
    startDateTextController?.dispose();

    endDateFocusNode?.dispose();
    endDateTextController?.dispose();

    satsangNoteFocusNode?.dispose();
    satsangNoteTextController?.dispose();
  }
}
