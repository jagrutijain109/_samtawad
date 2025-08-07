import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'add_aashram_page_widget.dart' show AddAashramPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAashramPageModel extends FlutterFlowModel<AddAashramPageWidget> {
  ///  Local state fields for this page.

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for aashram_name widget.
  FocusNode? aashramNameFocusNode;
  TextEditingController? aashramNameTextController;
  String? Function(BuildContext, String?)? aashramNameTextControllerValidator;
  String? _aashramNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2y6t1v2r' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for Contact_info widget.
  FocusNode? contactInfoFocusNode;
  TextEditingController? contactInfoTextController;
  String? Function(BuildContext, String?)? contactInfoTextControllerValidator;
  // State field(s) for State widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // Stores action output result for [Custom Action - convertAddressToLatLng] action in address widget.
  LatLng? address;
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
  DateTime? datePicked1;
  DateTime? datePicked2;
  bool isDataUploading_uploadAashramImage = false;
  FFUploadedFile uploadedLocalFile_uploadAashramImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadAashramImage = '';

  // Stores action output result for [Custom Action - convertAddressToLatLng] action in Button widget.
  LatLng? location;

  @override
  void initState(BuildContext context) {
    aashramNameTextControllerValidator = _aashramNameTextControllerValidator;
  }

  @override
  void dispose() {
    expandableExpandableController.dispose();
    aashramNameFocusNode?.dispose();
    aashramNameTextController?.dispose();

    contactInfoFocusNode?.dispose();
    contactInfoTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    aashramLocationFocusNode?.dispose();
    aashramLocationTextController?.dispose();

    eddInformationFocusNode?.dispose();
    eddInformationTextController?.dispose();

    timingFocusNode?.dispose();
    timingTextController?.dispose();
  }
}
