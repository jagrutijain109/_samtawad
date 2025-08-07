import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'add_video_page_widget.dart' show AddVideoPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddVideoPageModel extends FlutterFlowModel<AddVideoPageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? audiourl;

  int? id;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for video_tile widget.
  FocusNode? videoTileFocusNode;
  TextEditingController? videoTileTextController;
  String? Function(BuildContext, String?)? videoTileTextControllerValidator;
  String? _videoTileTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l9u00dag' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for speaker_name widget.
  FocusNode? speakerNameFocusNode;
  TextEditingController? speakerNameTextController;
  String? Function(BuildContext, String?)? speakerNameTextControllerValidator;
  // State field(s) for tags widget.
  FocusNode? tagsFocusNode;
  TextEditingController? tagsTextController;
  String? Function(BuildContext, String?)? tagsTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for time widget.
  FocusNode? timeFocusNode;
  TextEditingController? timeTextController;
  String? Function(BuildContext, String?)? timeTextControllerValidator;
  // State field(s) for eddInformation widget.
  FocusNode? eddInformationFocusNode;
  TextEditingController? eddInformationTextController;
  String? Function(BuildContext, String?)?
      eddInformationTextControllerValidator;
  bool isDataUploading_audio = false;
  FFUploadedFile uploadedLocalFile_audio =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_audio = '';

  // Stores action output result for [Custom Action - pickAndUploadAudio] action in Button widget.
  String? downloadurl;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? count;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {
    videoTileTextControllerValidator = _videoTileTextControllerValidator;
  }

  @override
  void dispose() {
    videoTileFocusNode?.dispose();
    videoTileTextController?.dispose();

    speakerNameFocusNode?.dispose();
    speakerNameTextController?.dispose();

    tagsFocusNode?.dispose();
    tagsTextController?.dispose();

    timeFocusNode?.dispose();
    timeTextController?.dispose();

    eddInformationFocusNode?.dispose();
    eddInformationTextController?.dispose();

    expandableExpandableController.dispose();
  }
}
