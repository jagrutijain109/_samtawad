import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'player_copy3_widget.dart' show PlayerCopy3Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerCopy3Model extends FlutterFlowModel<PlayerCopy3Widget> {
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

  int position = 0;

  ///  State fields for stateful widgets in this page.

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
