import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_aashram_page_widget.dart' show EditAashramPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAashramPageModel extends FlutterFlowModel<EditAashramPageWidget> {
  ///  Local state fields for this page.

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for aashram_name widget.
  FocusNode? aashramNameFocusNode;
  TextEditingController? aashramNameTextController;
  String? Function(BuildContext, String?)? aashramNameTextControllerValidator;
  String? _aashramNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lmr2mdzy' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for Contact_info widget.
  FocusNode? contactInfoFocusNode;
  TextEditingController? contactInfoTextController;
  String? Function(BuildContext, String?)? contactInfoTextControllerValidator;
  // State field(s) for country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode1;
  TextEditingController? addressTextController1;
  String? Function(BuildContext, String?)? addressTextController1Validator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode2;
  TextEditingController? addressTextController2;
  String? Function(BuildContext, String?)? addressTextController2Validator;
  // State field(s) for aashram_location widget.
  FocusNode? aashramLocationFocusNode;
  TextEditingController? aashramLocationTextController;
  String? Function(BuildContext, String?)?
      aashramLocationTextControllerValidator;
  // State field(s) for eddInformation widget.
  FocusNode? eddInformationFocusNode;
  TextEditingController? eddInformationTextController;
  String? Function(BuildContext, String?)?
      eddInformationTextControllerValidator;
  // State field(s) for timing widget.
  FocusNode? timingFocusNode;
  TextEditingController? timingTextController;
  String? Function(BuildContext, String?)? timingTextControllerValidator;
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
  bool isDataUploading_editUploadAashramImage = false;
  FFUploadedFile uploadedLocalFile_editUploadAashramImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_editUploadAashramImage = '';

  @override
  void initState(BuildContext context) {
    aashramNameTextControllerValidator = _aashramNameTextControllerValidator;
  }

  @override
  void dispose() {
    aashramNameFocusNode?.dispose();
    aashramNameTextController?.dispose();

    contactInfoFocusNode?.dispose();
    contactInfoTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    addressFocusNode1?.dispose();
    addressTextController1?.dispose();

    addressFocusNode2?.dispose();
    addressTextController2?.dispose();

    aashramLocationFocusNode?.dispose();
    aashramLocationTextController?.dispose();

    eddInformationFocusNode?.dispose();
    eddInformationTextController?.dispose();

    timingFocusNode?.dispose();
    timingTextController?.dispose();

    startDateFocusNode?.dispose();
    startDateTextController?.dispose();

    endDateFocusNode?.dispose();
    endDateTextController?.dispose();
  }
}
