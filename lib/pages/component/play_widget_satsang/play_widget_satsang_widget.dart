import '../../popupcomponent/firestlogin/firestlogin_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/song_list/song_list_widget.dart';
import '/pages/popupcomponent/lyrics_vani/lyrics_vani_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'play_widget_satsang_model.dart';
export 'play_widget_satsang_model.dart';

class PlayWidgetSatsangWidget extends StatefulWidget {
  const PlayWidgetSatsangWidget({
    super.key,
    this.audioList,
  });

  final DocumentReference? audioList;

  @override
  State<PlayWidgetSatsangWidget> createState() =>
      _PlayWidgetSatsangWidgetState();
}

class _PlayWidgetSatsangWidgetState extends State<PlayWidgetSatsangWidget> {
  late PlayWidgetSatsangModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayWidgetSatsangModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Material(
              color: Colors.transparent,
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 68.1,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: StreamBuilder<SatsangRecord>(
            stream: SatsangRecord.getDocument(widget!.audioList!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }

              final containerSatsangRecord = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SongListWidget(
                                        type: 'satsang',
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.playlist_play_outlined,
                                color: Color(0xFFC25123),
                                size: 35.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await downloadFile(
                                  filename: containerSatsangRecord.title,
                                  url: containerSatsangRecord.audiourl,
                                );
                              },
                              child: Icon(
                                Icons.file_download_rounded,
                                color: Color(0xFFC25123),
                                size: 35.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: ToggleIcon(
                              onPressed: () async {
                                if(FFAppState().islogin){
                                  final favoriteByElement = currentUserReference;
                                  final favoriteByUpdate = containerSatsangRecord
                                      .favoriteBy
                                      .contains(favoriteByElement)
                                      ? FieldValue.arrayRemove(
                                      [favoriteByElement])
                                      : FieldValue.arrayUnion(
                                      [favoriteByElement]);
                                  await containerSatsangRecord.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'favorite_by': favoriteByUpdate,
                                      },
                                    ),
                                  });
                                  if (containerSatsangRecord.favoriteBy
                                      .contains(currentUserReference) ==
                                      true) {
                                    await containerSatsangRecord.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'favorite_by': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('हटाया गया'),
                                          content: Text(
                                              'वस्तु को पसंदीदा से हटा दिया गया है।'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('ठीक है'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    await containerSatsangRecord.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'favorite_by': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('जोड़ा गया'),
                                          content: Text(
                                              'वस्तु को पसंदीदा में जोड़ा गया है।'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('ठीक है'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }else{
                                  await showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => const FirestloginWidget(),
                                  ).then((value) => safeSetState(() {}));
                                }

                              },
                              value: containerSatsangRecord.favoriteBy
                                  .contains(currentUserReference),
                              onIcon: Icon(
                                Icons.favorite,
                                color: Color(0xFFC25123),
                                size: 35.0,
                              ),
                              offIcon: Icon(
                                Icons.favorite_border,
                                color: Color(0xFFC25123),
                                size: 35.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: LyricsVaniWidget(
                                        title: containerSatsangRecord.title,
                                        lyrics: containerSatsangRecord
                                            .satsangLyrics,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.menu_book_rounded,
                                color: Color(0xFFC25123),
                                size: 35.0,
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 7.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Share.share(
                                    containerSatsangRecord.audiourl,
                                    sharePositionOrigin:
                                        getWidgetBoundingBox(context),
                                  );
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.share,
                                  color: Color(0xFFC25123),
                                  size: 35.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: Container(
                          height: 3.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFC25123),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: AlignmentDirectional(0.0, -1.0),
                    //   child: Padding(
                    //     padding: EdgeInsetsDirectional.fromSTEB(
                    //         0.0, 10.0, 0.0, 10.0),
                    //     child: Text(
                    //       containerSatsangRecord.speakerName,
                    //       style:
                    //           FlutterFlowTheme.of(context).bodyMedium.override(
                    //                 fontFamily: 'Gotu',
                    //                 color: Color(0xFF030303),
                    //                 fontSize: 16.0,
                    //                 letterSpacing: 0.0,
                    //                 fontWeight: FontWeight.w900,
                    //               ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
