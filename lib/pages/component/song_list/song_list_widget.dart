import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'song_list_model.dart';
export 'song_list_model.dart';

class SongListWidget extends StatefulWidget {
  const SongListWidget({
    super.key,
    String? type,
  }) : this.type = type ?? '';

  final String type;

  @override
  State<SongListWidget> createState() => _SongListWidgetState();
}

class _SongListWidgetState extends State<SongListWidget> {
  late SongListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SongListModel());

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
        if (widget!.type == 'audio')
          Container(
            width: double.infinity,
            height: 410.0,
            decoration: BoxDecoration(
              color: Color(0xFFFBF7F7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 77.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF6F2ED), Color(0xFFD4967C)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: FlutterFlowIconButton(
                            borderColor: Color(0xFFE4DDD6),
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Color(0xFFC68F77),
                            icon: Icon(
                              Icons.chevron_left,
                              color: Color(0xFF0E0E0E),
                              size: 25.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-0.8, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'w58mmy8e' /* भक्ति गीतों की सूची */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Gotu',
                                color: Color(0xFF0E0E0E),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    color: Color(0xFFD1D4E0),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: StreamBuilder<List<AudioRecord>>(
                        stream: queryAudioRecord(
                          queryBuilder: (q) => q.orderBy('id', descending: false),
                        ),
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
                          List<AudioRecord> listViewAudioRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAudioRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAudioRecord =
                                  listViewAudioRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 10.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
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
                                        colors: [
                                          Color(0xFFFCFAF8),
                                          Color(0xFFEADDC8)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              listViewAudioRecord.image,
                                              'https://picsum.photos/seed/346/600',
                                            ),
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.fill,
                                            alignment: Alignment(-1.0, -1.0),
                                          ),
                                        ),

                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    listViewAudioRecord
                                                        .audioTitle,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          // fontFamily: 'Gotu',
                                                          color:
                                                              Color(0xFF0C0C0C),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    listViewAudioRecord
                                                        .category,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'heders',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    PlayerCopy3Widget.routeName,
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        listViewAudioRecord.id,
                                                        ParamType.int,
                                                      ),
                                                      'currentIndex': serializeParam(
                                                        listViewAudioRecord.id,
                                                        ParamType.int,
                                                      ),
                                                      'type': serializeParam(
                                                        'audio',
                                                        ParamType.String,
                                                      ),
                                                      'pos': serializeParam(
                                                        0,
                                                        ParamType.int,
                                                      ),
                                                      'audioref': serializeParam(
                                                        listViewAudioRecord.reference,
                                                        ParamType.DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );


                                                  // _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                                                  safeSetState(() {});
                                                },
                                                child: FaIcon(
                                                  FontAwesomeIcons.playCircle,
                                                  color: Color(0xFFC25123),
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (widget!.type == 'satsang')
          Container(
            width: double.infinity,
            height: 410.0,
            decoration: BoxDecoration(
              color: Color(0xFFFBF7F7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 77.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF6F2ED), Color(0xFFD4967C)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: FlutterFlowIconButton(
                            borderColor: Color(0xFFE4DDD6),
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Color(0xFFC68F77),
                            icon: Icon(
                              Icons.chevron_left,
                              color: Color(0xFF0E0E0E),
                              size: 25.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-0.8, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '9ja2qdtw' /* भक्ति गीतों की सूची */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                // fontFamily: 'Gotu',
                                color: Color(0xFF0E0E0E),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    color: Color(0xFFD1D4E0),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: StreamBuilder<List<SatsangRecord>>(
                        stream: querySatsangRecord(
                          queryBuilder: (q) => q.orderBy('id', descending: false),
                        ),
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
                          List<SatsangRecord> listViewSatsangRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewSatsangRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewSatsangRecord =
                                  listViewSatsangRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 10.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
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
                                        colors: [
                                          Color(0xFFFCFAF8),
                                          Color(0xFFEADDC8)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              listViewSatsangRecord.imageUrl,
                                              'https://picsum.photos/seed/346/600',
                                            ),
                                            width: 100.0,
                                            height: 150.0,
                                            fit: BoxFit.fill,
                                            alignment: Alignment(-1.0, -1.0),
                                          ),
                                        ),
                                        // Flexible(
                                        //   child: Opacity(
                                        //     opacity: 0.7,
                                        //     child: Align(
                                        //       alignment: AlignmentDirectional(
                                        //           -1.0, -1.0),
                                        //       child: Material(
                                        //         color: Colors.transparent,
                                        //         elevation: 4.0,
                                        //         shape: RoundedRectangleBorder(
                                        //           borderRadius:
                                        //               BorderRadius.only(
                                        //             bottomLeft:
                                        //                 Radius.circular(15.0),
                                        //             bottomRight:
                                        //                 Radius.circular(15.0),
                                        //             topLeft:
                                        //                 Radius.circular(15.0),
                                        //             topRight:
                                        //                 Radius.circular(15.0),
                                        //           ),
                                        //         ),
                                        //         child: Container(
                                        //           width: 2.0,
                                        //           height: 100.0,
                                        //           decoration: BoxDecoration(
                                        //             color: Color(0xFFC25123),
                                        //             boxShadow: [
                                        //               BoxShadow(
                                        //                 blurRadius: 4.0,
                                        //                 color:
                                        //                     Color(0x33000000),
                                        //                 offset: Offset(
                                        //                   0.0,
                                        //                   2.0,
                                        //                 ),
                                        //               )
                                        //             ],
                                        //             borderRadius:
                                        //                 BorderRadius.only(
                                        //               bottomLeft:
                                        //                   Radius.circular(15.0),
                                        //               bottomRight:
                                        //                   Radius.circular(15.0),
                                        //               topLeft:
                                        //                   Radius.circular(15.0),
                                        //               topRight:
                                        //                   Radius.circular(15.0),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    listViewSatsangRecord.title,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                      // fontFamily: 'Gotu',
                                                      color: Color(0xFF0C0C0C),
                                                      letterSpacing: 0.0,
                                                      shadows: [
                                                        Shadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          offset:
                                                              Offset(2.0, 2.0),
                                                          blurRadius: 2.0,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    listViewSatsangRecord
                                                        .category,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'heders',
                                                          color:
                                                              Color(0xFF0C0C0C),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    PlayerCopy2Widget.routeName,
                                                    queryParameters: {
                                                      'currentIndex': serializeParam(
                                                        listViewSatsangRecord.id,
                                                        ParamType.int,
                                                      ),
                                                      'type': serializeParam(
                                                        'satsang',
                                                        ParamType.String,
                                                      ),
                                                      'pos': serializeParam(
                                                        0,
                                                        ParamType.int,
                                                      ),
                                                      'id': serializeParam(
                                                        listViewSatsangRecord.id,
                                                        ParamType.int,
                                                      ),
                                                      'audioref': serializeParam(
                                                        listViewSatsangRecord.reference,
                                                        ParamType.DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  // _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                                                  safeSetState(() {});
                                                },
                                                child: FaIcon(
                                                  FontAwesomeIcons.playCircle,
                                                  color: Color(0xFFC25123),
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (widget!.type == 'gurukalin_satsang')
          Container(
            width: double.infinity,
            height: 410.0,
            decoration: BoxDecoration(
              color: Color(0xFFFBF7F7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 77.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF6F2ED), Color(0xFFD4967C)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: FlutterFlowIconButton(
                            borderColor: Color(0xFFE4DDD6),
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Color(0xFFC68F77),
                            icon: Icon(
                              Icons.chevron_left,
                              color: Color(0xFF0E0E0E),
                              size: 25.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-0.8, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'np7pdezw' /* भक्ति गीतों की सूची */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Gotu',
                                color: Color(0xFF0E0E0E),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    color: Color(0xFFD1D4E0),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: StreamBuilder<List<GurukalinSatsangRecord>>(
                        stream: queryGurukalinSatsangRecord(
                          queryBuilder: (q) => q.orderBy('id', descending: true),
                        ),

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
                          List<GurukalinSatsangRecord>
                              listViewGurukalinSatsangRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewGurukalinSatsangRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewGurukalinSatsangRecord =
                                  listViewGurukalinSatsangRecordList[
                                      listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 10.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
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
                                        colors: [
                                          Color(0xFFFCFAF8),
                                          Color(0xFFEADDC8)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              listViewGurukalinSatsangRecord
                                                  .imageUrl,
                                              'https://picsum.photos/seed/346/600',
                                            ),
                                            width: 120.0,
                                            height: 200.0,
                                            fit: BoxFit.fill,
                                            alignment: Alignment(-1.0, -1.0),
                                          ),
                                        ),
                                        // Flexible(
                                        //   child: Opacity(
                                        //     opacity: 0.7,
                                        //     child: Align(
                                        //       alignment: AlignmentDirectional(
                                        //           -1.0, -1.0),
                                        //       child: Material(
                                        //         color: Colors.transparent,
                                        //         elevation: 4.0,
                                        //         shape: RoundedRectangleBorder(
                                        //           borderRadius:
                                        //               BorderRadius.only(
                                        //             bottomLeft:
                                        //                 Radius.circular(15.0),
                                        //             bottomRight:
                                        //                 Radius.circular(15.0),
                                        //             topLeft:
                                        //                 Radius.circular(15.0),
                                        //             topRight:
                                        //                 Radius.circular(15.0),
                                        //           ),
                                        //         ),
                                        //         child: Container(
                                        //           width: 2.0,
                                        //           height: 100.0,
                                        //           decoration: BoxDecoration(
                                        //             color: Color(0xFFC25123),
                                        //             boxShadow: [
                                        //               BoxShadow(
                                        //                 blurRadius: 4.0,
                                        //                 color:
                                        //                     Color(0x33000000),
                                        //                 offset: Offset(
                                        //                   0.0,
                                        //                   2.0,
                                        //                 ),
                                        //               )
                                        //             ],
                                        //             borderRadius:
                                        //                 BorderRadius.only(
                                        //               bottomLeft:
                                        //                   Radius.circular(15.0),
                                        //               bottomRight:
                                        //                   Radius.circular(15.0),
                                        //               topLeft:
                                        //                   Radius.circular(15.0),
                                        //               topRight:
                                        //                   Radius.circular(15.0),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    listViewGurukalinSatsangRecord
                                                        .satsangTitle,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          // fontFamily: 'Gotu',
                                                          color:
                                                              Color(0xFF0C0C0C),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    listViewGurukalinSatsangRecord
                                                        .category,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'heders',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    PlayerCopy2CopyWidget.routeName,
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        listViewGurukalinSatsangRecord.id,
                                                        ParamType.int,
                                                      ),
                                                      'type': serializeParam(
                                                        'gurukalin_satsang',
                                                        ParamType.String,
                                                      ),
                                                      'pos': serializeParam(
                                                        0,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  // _model.gurukaliSatsang = _model.gurukaliSatsang.toList().cast<GurukalinSatsangRecord>();
                                                  safeSetState(() {});
                                                },
                                                child: FaIcon(
                                                  FontAwesomeIcons.playCircle,
                                                  color: Color(0xFFC25123),
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
