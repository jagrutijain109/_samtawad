// import '/auth/firebase_auth/auth_util.dart';
// import '/components/homepage_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/pages/component/footr/footr_widget.dart';
// import '/pages/maglacharan/maglacharan_widget.dart';
// import '/pages/popupcomponent/allpopfiles/allpopfiles_widget.dart';
// import '/pages/popupcomponent/chintaman/chintaman_widget.dart';
// import '/pages/popupcomponent/mahaarti/mahaarti_widget.dart';
// import '/pages/popupcomponent/mahamantra/mahamantra_widget.dart';
// import 'dart:ui';
// import '/custom_code/actions/index.dart' as actions;
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import '/index.dart';
// import 'home_widget.dart' show HomeWidget;
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// class HomeModel extends FlutterFlowModel<HomeWidget> {
//   ///  Local state fields for this page.
//
//   bool mahamantra = false;
//
//   bool manglacharan = false;
//
//   bool chintavani = false;
//
//   bool aarti = false;
//
//   DateTime? loopStartTimeMahamantra;
//
//   bool showInfoDialog = false;
//
//   bool showInfo = true;
//
//   ///  State fields for stateful widgets in this page.
//
//   // Model for footr component.
//   late FootrModel footrModel;
//
//   @override
//   void initState(BuildContext context) {
//     footrModel = createModel(context, () => FootrModel());
//   }
//
//   @override
//   void dispose() {
//     footrModel.dispose();
//   }
// }

import '/auth/firebase_auth/auth_util.dart';
import '/components/homepage_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import '/pages/maglacharan/maglacharan_widget.dart';
import '/pages/popupcomponent/allpopfiles/allpopfiles_widget.dart';
import '/pages/popupcomponent/chintaman/chintaman_widget.dart';
import '/pages/popupcomponent/mahaarti/mahaarti_widget.dart';
import '/pages/popupcomponent/mahamantra/mahamantra_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool mahamantra = false;

  bool manglacharan = false;

  bool chintavani = false;

  bool aarti = false;

  DateTime? loopStartTimeMahamantra;

  bool showInfoDialog = false;

  String? playingSongId;

  bool showInfo = true;

  bool allsong = false;

  bool isPlaying = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - playSingleLoop] action in Container widget.
  bool? mahamantraSong;
  // Stores action output result for [Custom Action - playAudioOnce] action in Container widget.
  bool? maglacharanSong;
  // Stores action output result for [Custom Action - playAudioOnce] action in Container widget.
  bool? chintamanSong;
  // Stores action output result for [Custom Action - playAudioOnce] action in Container widget.
  bool? mahaartiSong;
  // Stores action output result for [Custom Action - playAudioOnce] action in Container widget.
  bool? allSong;
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
