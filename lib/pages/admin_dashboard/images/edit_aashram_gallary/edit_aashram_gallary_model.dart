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
import '/pages/admin_dashboard/component/aashram_category_popup/aashram_category_popup_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_aashram_gallary_widget.dart' show EditAashramGallaryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAashramGallaryModel
    extends FlutterFlowModel<EditAashramGallaryWidget> {
  ///  Local state fields for this page.

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_editAashram = false;
  FFUploadedFile uploadedLocalFile_editAashram =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_editAashram = '';

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for tags widget.
  FocusNode? tagsFocusNode;
  TextEditingController? tagsTextController;
  String? Function(BuildContext, String?)? tagsTextControllerValidator;
  // State field(s) for edd_information widget.
  FocusNode? eddInformationFocusNode;
  TextEditingController? eddInformationTextController;
  String? Function(BuildContext, String?)?
      eddInformationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tagsFocusNode?.dispose();
    tagsTextController?.dispose();

    eddInformationFocusNode?.dispose();
    eddInformationTextController?.dispose();
  }
}
