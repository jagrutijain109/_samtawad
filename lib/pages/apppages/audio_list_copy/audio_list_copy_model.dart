import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/audio_info/audio_info_widget.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'audio_list_copy_widget.dart' show AudioListCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AudioListCopyModel extends FlutterFlowModel<AudioListCopyWidget> {
  ///  Local state fields for this page.

  List<AudioRecord> vaniList = [];
  void addToVaniList(AudioRecord item) => vaniList.add(item);
  void removeFromVaniList(AudioRecord item) => vaniList.remove(item);
  void removeAtIndexFromVaniList(int index) => vaniList.removeAt(index);
  void insertAtIndexInVaniList(int index, AudioRecord item) =>
      vaniList.insert(index, item);
  void updateVaniListAtIndex(int index, Function(AudioRecord) updateFn) =>
      vaniList[index] = updateFn(vaniList[index]);

  bool searchVaniStatus = true;

  String? searchText;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<AudioRecord> simpleSearchResults = [];
  // Model for footr component.
  late FootrModel footrModel;

  @override
  void initState(BuildContext context) {
    footrModel = createModel(context, () => FootrModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footrModel.dispose();
  }
}
