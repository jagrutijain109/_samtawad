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
import '/index.dart';
import 'edit_gurukalin_satsang_widget.dart' show EditGurukalinSatsangWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditGurukalinSatsangModel
    extends FlutterFlowModel<EditGurukalinSatsangWidget> {
  ///  Local state fields for this page.

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for tags widget.
  FocusNode? tagsFocusNode;
  TextEditingController? tagsTextController;
  String? Function(BuildContext, String?)? tagsTextControllerValidator;
  // State field(s) for Contactinfo widget.
  FocusNode? contactinfoFocusNode;
  TextEditingController? contactinfoTextController;
  String? Function(BuildContext, String?)? contactinfoTextControllerValidator;
  // State field(s) for doha widget.
  FocusNode? dohaFocusNode;
  TextEditingController? dohaTextController;
  String? Function(BuildContext, String?)? dohaTextControllerValidator;
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
  // State field(s) for eddInformation widget.
  FocusNode? eddInformationFocusNode;
  TextEditingController? eddInformationTextController;
  String? Function(BuildContext, String?)?
      eddInformationTextControllerValidator;
  bool isDataUploading_uploadGurukalinAudioLyrics = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadGurukalinAudioLyrics = [];
  List<String> uploadedFileUrls_uploadGurukalinAudioLyrics = [];

  bool isDataUploading_uploadDataA7014 = false;
  FFUploadedFile uploadedLocalFile_uploadDataA7014 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataA7014 = '';

  bool isDataUploading_uploadEditGurukalinImage = false;
  FFUploadedFile uploadedLocalFile_uploadEditGurukalinImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadEditGurukalinImage = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    tagsFocusNode?.dispose();
    tagsTextController?.dispose();

    contactinfoFocusNode?.dispose();
    contactinfoTextController?.dispose();

    dohaFocusNode?.dispose();
    dohaTextController?.dispose();

    timeFocusNode?.dispose();
    timeTextController?.dispose();

    eddInformationFocusNode?.dispose();
    eddInformationTextController?.dispose();
  }
}
