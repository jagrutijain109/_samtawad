import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/admin_dashboard/component/gurukalin_satsang_category/gurukalin_satsang_category_widget.dart';
import '/pages/admin_dashboard/component/gurukalin_satsang_category_copy2/gurukalin_satsang_category_copy2_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'add_gurukalin_satsang_widget.dart' show AddGurukalinSatsangWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddGurukalinSatsangModel
    extends FlutterFlowModel<AddGurukalinSatsangWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? audiourl;

  int? id;

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for satsang_title widget.
  FocusNode? satsangTitleFocusNode;
  TextEditingController? satsangTitleTextController;
  String? Function(BuildContext, String?)? satsangTitleTextControllerValidator;
  // State field(s) for tags widget.
  FocusNode? tagsFocusNode;
  TextEditingController? tagsTextController;
  String? Function(BuildContext, String?)? tagsTextControllerValidator;
  // State field(s) for Contact_info widget.
  FocusNode? contactInfoFocusNode;
  TextEditingController? contactInfoTextController;
  String? Function(BuildContext, String?)? contactInfoTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for time widget.
  FocusNode? timeFocusNode;
  TextEditingController? timeTextController;
  String? Function(BuildContext, String?)? timeTextControllerValidator;
  // State field(s) for Duha widget.
  FocusNode? duhaFocusNode;
  TextEditingController? duhaTextController;
  String? Function(BuildContext, String?)? duhaTextControllerValidator;
  // State field(s) for eddInformation widget.
  FocusNode? eddInformationFocusNode;
  TextEditingController? eddInformationTextController;
  String? Function(BuildContext, String?)?
      eddInformationTextControllerValidator;
  bool isDataUploading_uploadDataH17 = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataH17 = [];
  List<String> uploadedFileUrls_uploadDataH17 = [];

  bool isDataUploading_uploadDataKa212 = false;
  FFUploadedFile uploadedLocalFile_uploadDataKa212 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataKa212 = '';

  // Stores action output result for [Custom Action - pickAndUploadAudio] action in Button widget.
  String? downloadurl;
  bool isDataUploading_uploadGurukalinImage = false;
  FFUploadedFile uploadedLocalFile_uploadGurukalinImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadGurukalinImage = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? gurukalinSatsang;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    satsangTitleFocusNode?.dispose();
    satsangTitleTextController?.dispose();

    tagsFocusNode?.dispose();
    tagsTextController?.dispose();

    contactInfoFocusNode?.dispose();
    contactInfoTextController?.dispose();

    timeFocusNode?.dispose();
    timeTextController?.dispose();

    duhaFocusNode?.dispose();
    duhaTextController?.dispose();

    eddInformationFocusNode?.dispose();
    eddInformationTextController?.dispose();

    expandableExpandableController.dispose();
  }
}
