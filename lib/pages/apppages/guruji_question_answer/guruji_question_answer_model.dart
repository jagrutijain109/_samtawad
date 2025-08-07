import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import '/pages/popupcomponent/popup_component/popup_component_widget.dart';
import '/pages/popupcomponent/samta_apar_shakti/samta_apar_shakti_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'guruji_question_answer_widget.dart' show GurujiQuestionAnswerWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class GurujiQuestionAnswerModel
    extends FlutterFlowModel<GurujiQuestionAnswerWidget> {
  ///  Local state fields for this page.

  bool searchStatus = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for samta widget.
  FocusNode? samtaFocusNode;
  TextEditingController? samtaTextController;
  String? Function(BuildContext, String?)? samtaTextControllerValidator;
  List<GurujiQuestionRecord> simpleSearchResults = [];
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, GurujiQuestionRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // Model for footr component.
  late FootrModel footrModel;

  @override
  void initState(BuildContext context) {
    footrModel = createModel(context, () => FootrModel());
  }

  @override
  void dispose() {
    samtaFocusNode?.dispose();
    samtaTextController?.dispose();

    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    footrModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, GurujiQuestionRecord>
      setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, GurujiQuestionRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, GurujiQuestionRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryGurujiQuestionRecordPage(
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }
}
