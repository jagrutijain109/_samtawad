import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_inperson_satsang_widget.dart' show EditInpersonSatsangWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditInpersonSatsangModel
    extends FlutterFlowModel<EditInpersonSatsangWidget> {
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
        'cwu0sq7r' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for satsang_contact_info widget.
  FocusNode? satsangContactInfoFocusNode;
  TextEditingController? satsangContactInfoTextController;
  String? Function(BuildContext, String?)?
      satsangContactInfoTextControllerValidator;
  // State field(s) for country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for satsang_address widget.
  FocusNode? satsangAddressFocusNode;
  TextEditingController? satsangAddressTextController;
  String? Function(BuildContext, String?)?
      satsangAddressTextControllerValidator;
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
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

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

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    satsangAddressFocusNode?.dispose();
    satsangAddressTextController?.dispose();

    startDateFocusNode?.dispose();
    startDateTextController?.dispose();

    endDateFocusNode?.dispose();
    endDateTextController?.dispose();

    satsangNoteFocusNode?.dispose();
    satsangNoteTextController?.dispose();

    expandableExpandableController.dispose();
  }
}
