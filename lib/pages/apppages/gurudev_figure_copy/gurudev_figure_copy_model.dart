import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'gurudev_figure_copy_widget.dart' show GurudevFigureCopyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class GurudevFigureCopyModel extends FlutterFlowModel<GurudevFigureCopyWidget> {
  ///  Local state fields for this page.

  bool searchGuruPicture = false;

  bool searchAajKnow = false;

  bool samtawadKnow = false;

  bool searchAashramGal = false;

  int selectedGuruIndex = 0;

  List<DocumentReference> fullGuruListRefs = [];
  void addToFullGuruListRefs(DocumentReference item) =>
      fullGuruListRefs.add(item);
  void removeFromFullGuruListRefs(DocumentReference item) =>
      fullGuruListRefs.remove(item);
  void removeAtIndexFromFullGuruListRefs(int index) =>
      fullGuruListRefs.removeAt(index);
  void insertAtIndexInFullGuruListRefs(int index, DocumentReference item) =>
      fullGuruListRefs.insert(index, item);
  void updateFullGuruListRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      fullGuruListRefs[index] = updateFn(fullGuruListRefs[index]);

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
  List<GurijiJiImageRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<AajKaKnowledgeRecord> simpleSearchResults2 = [];
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, AajKaKnowledgeRecord>?
      gridViewPagingController3;
  Query? gridViewPagingQuery3;
  List<StreamSubscription?> gridViewStreamSubscriptions3 = [];

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, AajKaKnowledgeRecord>?
      gridViewPagingController4;
  Query? gridViewPagingQuery4;
  List<StreamSubscription?> gridViewStreamSubscriptions4 = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  List<SamtawadKnowledgeRecord> simpleSearchResults3 = [];
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, SamtawadKnowledgeRecord>?
      gridViewPagingController6;
  Query? gridViewPagingQuery6;
  List<StreamSubscription?> gridViewStreamSubscriptions6 = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  List<AshramGalleryRecord> simpleSearchResults4 = [];
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
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

    gridViewStreamSubscriptions3.forEach((s) => s?.cancel());
    gridViewPagingController3?.dispose();

    gridViewStreamSubscriptions4.forEach((s) => s?.cancel());
    gridViewPagingController4?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    gridViewStreamSubscriptions6.forEach((s) => s?.cancel());
    gridViewPagingController6?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    footrModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, AajKaKnowledgeRecord>
      setGridViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController3 ??= _createGridViewController3(query, parent);
    if (gridViewPagingQuery3 != query) {
      gridViewPagingQuery3 = query;
      gridViewPagingController3?.refresh();
    }
    return gridViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, AajKaKnowledgeRecord>
      _createGridViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, AajKaKnowledgeRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryAajKaKnowledgeRecordPage(
          queryBuilder: (_) => gridViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions3,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, AajKaKnowledgeRecord>
      setGridViewController4(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController4 ??= _createGridViewController4(query, parent);
    if (gridViewPagingQuery4 != query) {
      gridViewPagingQuery4 = query;
      gridViewPagingController4?.refresh();
    }
    return gridViewPagingController4!;
  }

  PagingController<DocumentSnapshot?, AajKaKnowledgeRecord>
      _createGridViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, AajKaKnowledgeRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryAajKaKnowledgeRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions4,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, SamtawadKnowledgeRecord>
      setGridViewController6(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController6 ??= _createGridViewController6(query, parent);
    if (gridViewPagingQuery6 != query) {
      gridViewPagingQuery6 = query;
      gridViewPagingController6?.refresh();
    }
    return gridViewPagingController6!;
  }

  PagingController<DocumentSnapshot?, SamtawadKnowledgeRecord>
      _createGridViewController6(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, SamtawadKnowledgeRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => querySamtawadKnowledgeRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions6,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
