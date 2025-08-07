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
import '/pages/admin_dashboard/component/audio_category/audio_category_widget.dart';
import '/pages/admin_dashboard/component/audio_category_copy2/audio_category_copy2_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'add_vani_page_widget.dart' show AddVaniPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddVaniPageModel extends FlutterFlowModel<AddVaniPageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? audiourl;

  String? uploadedImageURL;

  int? maxid;

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
  // State field(s) for contact_info widget.
  FocusNode? contactInfoFocusNode;
  TextEditingController? contactInfoTextController;
  String? Function(BuildContext, String?)? contactInfoTextControllerValidator;
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
  bool isDataUploading_uploadAudioData = false;
  FFUploadedFile uploadedLocalFile_uploadAudioData =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadAudioData = '';

  bool isDataUploading_uploadVaniLyrics = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadVaniLyrics = [];
  List<String> uploadedFileUrls_uploadVaniLyrics = [];

  bool isDataUploading_uploadVaniImage = false;
  FFUploadedFile uploadedLocalFile_uploadVaniImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadVaniImage = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? id;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    tagsFocusNode?.dispose();
    tagsTextController?.dispose();

    contactInfoFocusNode?.dispose();
    contactInfoTextController?.dispose();

    dohaFocusNode?.dispose();
    dohaTextController?.dispose();

    timeFocusNode?.dispose();
    timeTextController?.dispose();

    eddInformationFocusNode?.dispose();
    eddInformationTextController?.dispose();

    expandableExpandableController.dispose();
  }
}
