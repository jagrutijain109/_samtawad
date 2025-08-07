import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/audio_info/audio_info_widget.dart';
import '/pages/component/audio_lyrics/audio_lyrics_widget.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'vani_satsang_and_audio_book_copy_widget.dart'
    show VaniSatsangAndAudioBookCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_search/text_search.dart';

class VaniSatsangAndAudioBookCopyModel
    extends FlutterFlowModel<VaniSatsangAndAudioBookCopyWidget> {
  ///  Local state fields for this page.

  String sortField = 'date';

  String selectedValue = 'All';

  /// To Store List Of Vanis
  List<AudioRecord> vaniList = [];
  void addToVaniList(AudioRecord item) => vaniList.add(item);
  void removeFromVaniList(AudioRecord item) => vaniList.remove(item);
  void removeAtIndexFromVaniList(int index) => vaniList.removeAt(index);
  void insertAtIndexInVaniList(int index, AudioRecord item) =>
      vaniList.insert(index, item);
  void updateVaniListAtIndex(int index, Function(AudioRecord) updateFn) =>
      vaniList[index] = updateFn(vaniList[index]);

  /// To store List Of Satsang
  List<SatsangRecord> satsangList = [];
  void addToSatsangList(SatsangRecord item) => satsangList.add(item);
  void removeFromSatsangList(SatsangRecord item) => satsangList.remove(item);
  void removeAtIndexFromSatsangList(int index) => satsangList.removeAt(index);
  void insertAtIndexInSatsangList(int index, SatsangRecord item) =>
      satsangList.insert(index, item);
  void updateSatsangListAtIndex(int index, Function(SatsangRecord) updateFn) =>
      satsangList[index] = updateFn(satsangList[index]);

  /// To Store the list of gurukalinSatsang
  List<GurukalinSatsangRecord> gurukaliSatsang = [];
  void addToGurukaliSatsang(GurukalinSatsangRecord item) =>
      gurukaliSatsang.add(item);
  void removeFromGurukaliSatsang(GurukalinSatsangRecord item) =>
      gurukaliSatsang.remove(item);
  void removeAtIndexFromGurukaliSatsang(int index) =>
      gurukaliSatsang.removeAt(index);
  void insertAtIndexInGurukaliSatsang(int index, GurukalinSatsangRecord item) =>
      gurukaliSatsang.insert(index, item);
  void updateGurukaliSatsangAtIndex(
          int index, Function(GurukalinSatsangRecord) updateFn) =>
      gurukaliSatsang[index] = updateFn(gurukaliSatsang[index]);

  /// Use To Store AudioBooks
  List<AudioBookRecord> listAudioBook = [];
  void addToListAudioBook(AudioBookRecord item) => listAudioBook.add(item);
  void removeFromListAudioBook(AudioBookRecord item) =>
      listAudioBook.remove(item);
  void removeAtIndexFromListAudioBook(int index) =>
      listAudioBook.removeAt(index);
  void insertAtIndexInListAudioBook(int index, AudioBookRecord item) =>
      listAudioBook.insert(index, item);
  void updateListAudioBookAtIndex(
          int index, Function(AudioBookRecord) updateFn) =>
      listAudioBook[index] = updateFn(listAudioBook[index]);

  /// To Find current song
  List<dynamic> currentsongList = [];
  void addToCurrentsongList(dynamic item) => currentsongList.add(item);
  void removeFromCurrentsongList(dynamic item) => currentsongList.remove(item);
  void removeAtIndexFromCurrentsongList(int index) =>
      currentsongList.removeAt(index);
  void insertAtIndexInCurrentsongList(int index, dynamic item) =>
      currentsongList.insert(index, item);
  void updateCurrentsongListAtIndex(int index, Function(dynamic) updateFn) =>
      currentsongList[index] = updateFn(currentsongList[index]);

  /// To select The Category
  String selectedCategory = 'सभी';

  bool searchVaniStatus = false;

  bool searchSatsangStatus = false;

  bool searchGuruSatsangStatus = false;

  bool audioBook = false;

  bool searchSatsang = false;

  bool searchGuruSatsang = false;

  bool searchAudioBook = false;

  String selectedSatsangMode = 'सत्संग';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<AudioRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<SatsangRecord> simpleSearchResults2 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  List<GurukalinSatsangRecord> simpleSearchResults3 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  List<AudioBookRecord> simpleSearchResults4 = [];
  // Model for footr component.
  late FootrModel footrModel;

  @override
  void initState(BuildContext context) {
    footrModel = createModel(context, () => FootrModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    footrModel.dispose();
  }
}
