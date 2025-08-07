import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'audio_cont_gurukalin_satsang_copy_model.dart';
export 'audio_cont_gurukalin_satsang_copy_model.dart';

class AudioContGurukalinSatsangCopyWidget extends StatefulWidget {
  const AudioContGurukalinSatsangCopyWidget({
    super.key,
    this.documentRef,
  });

  final DocumentReference? documentRef;

  @override
  State<AudioContGurukalinSatsangCopyWidget> createState() =>
      _AudioContGurukalinSatsangCopyWidgetState();
}

class _AudioContGurukalinSatsangCopyWidgetState
    extends State<AudioContGurukalinSatsangCopyWidget> {
  late AudioContGurukalinSatsangCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioContGurukalinSatsangCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
        child: StreamBuilder<GurukalinSatsangRecord>(
          stream: GurukalinSatsangRecord.getDocument(widget!.documentRef!),
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

            final containerGurukalinSatsangRecord = snapshot.data!;

            return Container(
              height: 375.2,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                    spreadRadius: 5.0,
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xFFC25123),
                  width: 7.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 20.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              containerGurukalinSatsangRecord.imageUrl,
                              width: 231.5,
                              height: 204.9,
                              fit: BoxFit.fill,
                              alignment: Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          containerGurukalinSatsangRecord.satsangTitle,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Gotu',
                                    color: Color(0xFF080808),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ),
                      // Align(
                      //   alignment: AlignmentDirectional(0.0, -1.0),
                      //   child: Padding(
                      //     padding: EdgeInsetsDirectional.fromSTEB(
                      //         0.0, 10.0, 0.0, 0.0),
                      //     child: Text(
                      //       containerGurukalinSatsangRecord.information,
                      //       textAlign: TextAlign.center,
                      //       style: FlutterFlowTheme.of(context)
                      //           .bodyMedium
                      //           .override(
                      //             fontFamily: 'heders',
                      //             color: Color(0xFF0B0B0B),
                      //             fontSize: 15.0,
                      //             letterSpacing: 0.0,
                      //             fontWeight: FontWeight.w900,
                      //           ),
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            containerGurukalinSatsangRecord.category,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'subheders',
                                  color: Color(0xFF121212),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            containerGurukalinSatsangRecord.spakerName,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Gotu',
                              color: Color(0xFF121212),
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
