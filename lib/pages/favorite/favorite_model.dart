import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'favorite_widget.dart' show FavoriteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class FavoriteModel extends FlutterFlowModel<FavoriteWidget> {
  ///  Local state fields for this page.

  String favoriteCategory = 'GuruJi Photo';

  List<GurijiJiImageRecord> gurujiImage = [];
  void addToGurujiImage(GurijiJiImageRecord item) => gurujiImage.add(item);
  void removeFromGurujiImage(GurijiJiImageRecord item) =>
      gurujiImage.remove(item);
  void removeAtIndexFromGurujiImage(int index) => gurujiImage.removeAt(index);
  void insertAtIndexInGurujiImage(int index, GurijiJiImageRecord item) =>
      gurujiImage.insert(index, item);
  void updateGurujiImageAtIndex(
          int index, Function(GurijiJiImageRecord) updateFn) =>
      gurujiImage[index] = updateFn(gurujiImage[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for footr component.
  late FootrModel footrModel;

  @override
  void initState(BuildContext context) {
    footrModel = createModel(context, () => FootrModel());
  }

  @override
  void dispose() {
    footrModel.dispose();
  }
}
