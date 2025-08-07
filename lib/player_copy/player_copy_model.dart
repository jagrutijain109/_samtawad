import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/appbar/appbar_widget.dart';
import '/pages/component/audio_info/audio_info_widget.dart';
import '/pages/component/footr/footr_widget.dart';
import '/pages/component/song_list/song_list_widget.dart';
import '/pages/popupcomponent/lyrics_vani/lyrics_vani_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'player_copy_widget.dart' show PlayerCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PlayerCopyModel extends FlutterFlowModel<PlayerCopyWidget> {
  ///  Local state fields for this page.
  /// To Play/Pause of song
  bool isPlaying = false;

  /// to find current time
  ///
  double currentTime = 0.0;

  /// to show total duration
  double totalDuration = 0.0;

  /// Current Audio Variable
  String currentAudio = '';

  /// To Show The currentIndex of song
  int currentIndex = 0;

  /// To Find Max Index of the song list
  int maxIndex = 1;

  /// For Playing all songs
  bool looping = false;

  int maxPlayableIndex = 0;

  String? songList;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController3;

  int get pageViewCurrentIndex3 => pageViewController3 != null &&
          pageViewController3!.hasClients &&
          pageViewController3!.page != null
      ? pageViewController3!.page!.round()
      : 0;
  // Model for appbar component.
  late AppbarModel appbarModel;
  // Model for footr component.
  late FootrModel footrModel;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    footrModel = createModel(context, () => FootrModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    footrModel.dispose();
  }

  /// Action blocks.
  Future audio(
    BuildContext context, {
    String? url,
  }) async {
    await actions.monitorAudioEnd(
      '',
    );
  }
}
