import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'favoritetest_model.dart';
export 'favoritetest_model.dart';

class FavoritetestWidget extends StatefulWidget {
  const FavoritetestWidget({super.key});

  static String routeName = 'Favoritetest';
  static String routePath = '/favoritetest';

  @override
  State<FavoritetestWidget> createState() => _FavoritetestWidgetState();
}

class _FavoritetestWidgetState extends State<FavoritetestWidget> {
  late FavoritetestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritetestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.favoriteCategory = 'सभी';
      safeSetState(() {});
      FFAppState().currentPage = 1;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF8F8F8),
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 30.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'bm9m9e0h' /* "प्रभु सत् आचरण और नि:चल बुद्ध... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.alegreyaSans(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Colors.black,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontStyle,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 30.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'w15qr5w1' /* आशीर्वाद ---- महात्मा मंगत राम... */,
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'subheders',
                            color: Colors.black,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 30.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'meiy06ea' /* 1903-1954 */,
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'subheders',
                            color: Colors.black,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(HomeWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.chat_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '369xyhjn' /* घर */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: SizedBox(
                        width: 270.0,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFC25123),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(
                              GuruJiKaJivanAndSadhnaWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'e4f2ebcm' /* जीवन और साधना */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: SizedBox(
                        width: 270.0,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFC25123),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(ShisyaKaKartvyaWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7kc5scyn' /* शिष्य का कर्तव्य */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: SizedBox(
                        width: 270.0,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFC25123),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(
                            VaniSatsangAndAudioBookCopyWidget.routeName,
                            queryParameters: {
                              'tabNumber': serializeParam(
                                1,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.audiotrack_rounded,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'fvpxlril' /*  वाणी ,सत्संग और ऑडियो बुक */,
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: SizedBox(
                        width: 270.0,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFC25123),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(GurudevFigureCopyWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.image,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ii8gy0zi' /* गुरुदेव की तस्वीरें और फ़ोटो */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: SizedBox(
                        width: 270.0,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFC25123),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(FavoritetestWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'r75tcpbg' /* पसंदीदा */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: SizedBox(
                        width: 270.0,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFC25123),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(UserChatWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.chat,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '5tf76f5m' /* संवाद */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: SizedBox(
                        width: 270.0,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFC25123),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(ProfilepageWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.settings_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sfk7vtoe' /* उपयोगकर्ता रूपरेखा */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: SizedBox(
                        width: 270.0,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFC25123),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          FFAppState().islogin = false;
                          safeSetState(() {});
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'आप लॉग आउट हो चुके हैं।',
                                style: TextStyle(
                                  color: Color(0xFF121212),
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0xFFF8DEB5),
                            ),
                          );

                          context.pushNamedAuth(
                              LoginPageWidget.routeName, context.mounted);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.login_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'jlc1v3ao' /* लॉगआउट */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  font: GoogleFonts.alegreyaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.4),
          child: AppBar(
            backgroundColor: Color(0xFFFFF8F1),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 6.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                23.0, 0.0, 20.0, 0.0),
                            child: Container(
                              height: 78.4,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 40.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await actions
                                                                .showDraggableBottomSheetCopy(
                                                              context,
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons.info_outline,
                                                            color: Color(
                                                                0xFF343341),
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '5axzwczy' /* समता अपार शक्ति */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Gotu',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 230.0,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF703102),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await actions
                                                              .showDraggableBottomSheet(
                                                            context,
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.info_outline,
                                                          color: Colors.black,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'pb8f6rb7' /* ॐ ब्रह्म सत्यम सर्वाधार */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Gotu',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                            ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 1.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.6,
                child: Align(
                  alignment: AlignmentDirectional(-1.74, -1.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/background.png',
                      width: 235.7,
                      height: 288.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 100.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.red,
                                    size: 32.0,
                                  ),
                                  Text("पसंदीदा",
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font:
                                              GoogleFonts.tiroDevanagariSanskrit(
                                            fontWeight: FontWeight.w900,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color:Colors.black,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                             SizedBox(height: 10,),
                              Container(
                                width: 240,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                        _model.dropDownValue ??= 'सभी',
                                      ),
                                  options: [
                                    'गुरुदेव चित्र',
                                    'आज का ज्ञान',
                                    'समतावाद ज्ञान',
                                    'आश्रम गैलरी',
                                    'वाणी',
                                    'सत्संग ',
                                    'गुरुकालीन सत्संग',
                                    'ऑडियो पुस्तक',
                                    // 'ऑडियो बुक अध्याय',
                                    'सभी',
                                  ],
                                  onChanged: (val) async {
                                    safeSetState(() => _model.dropDownValue = val);
                                    _model.favoriteCategory = _model.dropDownValue!;
                                  },
                                  width: double.infinity,
                                  height: 40,
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  hintText: 'Select..',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.black54,
                                    size: 24,
                                  ),
                                  fillColor: Colors.white,
                                  elevation: 2,
                                  borderColor: Colors.black26,
                                  borderWidth: 1,
                                  borderRadius: 12,
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                ),
                              ),
                              if(FFAppState().islogin)
                                SizedBox(height: 8,),
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if (_model.favoriteCategory == 'All')
                                  //   Align(
                                  //     alignment: AlignmentDirectional(-1.0, -1.0),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0.0, 20.0, 0.0, 20.0),
                                  //       child: Text("गुरुजी के फोटो",
                                  //         // FFLocalizations.of(context).getText(
                                  //         //   'nkaff948' /* Guruji Photo */,
                                  //         // ),
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyMedium
                                  //             .override(
                                  //               font: GoogleFonts.alegreyaSans(
                                  //                 fontWeight: FontWeight.bold,
                                  //                 fontStyle:
                                  //                     FlutterFlowTheme.of(context)
                                  //                         .bodyMedium
                                  //                         .fontStyle,
                                  //               ),
                                  //               color: Colors.black,
                                  //               fontSize: 18.0,
                                  //               letterSpacing: 0.0,
                                  //               fontWeight: FontWeight.bold,
                                  //               fontStyle:
                                  //                   FlutterFlowTheme.of(context)
                                  //                       .bodyMedium
                                  //                       .fontStyle,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),

                                  if ((_model.favoriteCategory ==
                                          'गुरुदेव चित्र'))
                                      // ||
                                      // (_model.favoriteCategory == 'All'))
                                    SizedBox(height: 8,),
                                    StreamBuilder<List<GurijiJiImageRecord>>(
                                      stream: queryGurijiJiImageRecord(
                                        queryBuilder: (gurijiJiImageRecord) =>
                                            gurijiJiImageRecord.where(
                                          'favorite_by',
                                          arrayContains: currentUserReference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<GurijiJiImageRecord>
                                            gridViewGurijiJiImageRecordList =
                                            snapshot.data!;

                                        return GridView.builder(

                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gridViewGurijiJiImageRecordList
                                                  .length,
                                          itemBuilder: (context, gridViewIndex) {
                                            final gridViewGurijiJiImageRecord =
                                                gridViewGurijiJiImageRecordList[
                                                    gridViewIndex];
                                            return Material(
                                              color: Colors.transparent,
                                              elevation: 4.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25.0),
                                              ),
                                              child: Container(
                                                //   width: 400,
                                                // height: 600,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFBF4F7),
                                                  borderRadius: BorderRadius.circular(25.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    // Image with Favorite Icon on top-right
                                                    Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                                          child: InkWell(
                                                            splashColor: Colors.transparent,
                                                            focusColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              print("Id of the image :- ${gridViewGurijiJiImageRecord.id}");
                                                              context.pushNamed(
                                                                PicturesWidget.routeName,
                                                                queryParameters: {
                                                                  'currentIndex': serializeParam(
                                                                    gridViewGurijiJiImageRecord.id,
                                                                    ParamType.int,
                                                                  ),
                                                                  'type': serializeParam('gurupic', ParamType.String),
                                                                }.withoutNulls,
                                                                extra: <String, dynamic>{
                                                                  kTransitionInfoKey: TransitionInfo(
                                                                    hasTransition: true,
                                                                    transitionType: PageTransitionType.fade,
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Image.network(
                                                              gridViewGurijiJiImageRecord.images,
                                                              width: double.infinity,
                                                              height: 165.7,
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment.center,
                                                              cacheHeight: 400,
                                                            ),
                                                          ),
                                                        ),
                                                        // Favorite Icon
                                                        Positioned(
                                                          top: 8.0,
                                                          right: 8.0,
                                                          child: ToggleIcon(
                                                            onPressed: () async {
                                                              final favoriteByElement = currentUserReference;
                                                              final isFavorite = gridViewGurijiJiImageRecord.favoriteBy.contains(favoriteByElement);

                                                              final favoriteByUpdate = isFavorite
                                                                  ? FieldValue.arrayRemove([favoriteByElement])
                                                                  : FieldValue.arrayUnion([favoriteByElement]);

                                                              await gridViewGurijiJiImageRecord.reference.update({
                                                                'favorite_by': favoriteByUpdate,
                                                              });

                                                              await showDialog(
                                                                context: context,
                                                                builder: (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(isFavorite ? 'हटाया गया' : 'जोड़ा गया'),
                                                                    content: Text(
                                                                      isFavorite
                                                                          ? 'वस्तु को पसंदीदा से हटा दिया गया है।'
                                                                          : 'वस्तु को पसंदीदा में जोड़ा गया है।',
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                        child: Text('ठीक है'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            value: gridViewGurijiJiImageRecord.favoriteBy.contains(currentUserReference),
                                                            onIcon: Icon(Icons.favorite, color: Colors.red, size: 28.0),
                                                            offIcon: Icon(Icons.favorite_border, color: Colors.white, size: 28.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Tags Text
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Text(
                                                        gridViewGurijiJiImageRecord.tags,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          // fontFamily: 'Gotu',
                                                          color: Color(0xFFC25123),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          shadows: [
                                                            Shadow(
                                                              color: Color(0xFFC25123),
                                                              offset: Offset(1.0, 1.0),
                                                              blurRadius: 1.0,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );

                                          },
                                        );
                                      },
                                    ),
                                  SizedBox(height: 8,),
                                ],
                              ),
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if (_model.favoriteCategory == 'All')
                                  //   Align(
                                  //     alignment: AlignmentDirectional(-1.0, -1.0),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0.0, 20.0, 0.0, 20.0),
                                  //       child: Text("आज का ज्ञान",
                                  //         // FFLocalizations.of(context).getText(
                                  //         //   'nkaff948' /* Guruji Photo */,
                                  //         // ),
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyMedium
                                  //             .override(
                                  //           font: GoogleFonts.alegreyaSans(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontStyle:
                                  //             FlutterFlowTheme.of(context)
                                  //                 .bodyMedium
                                  //                 .fontStyle,
                                  //           ),
                                  //           color: Colors.black,
                                  //           fontSize: 18.0,
                                  //           letterSpacing: 0.0,
                                  //           fontWeight: FontWeight.bold,
                                  //           fontStyle:
                                  //           FlutterFlowTheme.of(context)
                                  //               .bodyMedium
                                  //               .fontStyle,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  if ((_model.favoriteCategory ==
                                      'आज का ज्ञान'))
                                      // ||
                                      // (_model.favoriteCategory == 'All'))
                                    StreamBuilder<List<AajKaKnowledgeRecord>>(
                                      stream: queryAajKaKnowledgeRecord(
                                        queryBuilder: (aajKaKnowledgeRecord) =>
                                            aajKaKnowledgeRecord.where(
                                              'favorite_by',
                                              arrayContains: currentUserReference,
                                            ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AajKaKnowledgeRecord>
                                        gridViewAajKaKnowledgeRecordList =
                                        snapshot.data!;

                                        return GridView.builder(

                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                          gridViewAajKaKnowledgeRecordList
                                              .length,
                                          itemBuilder: (context, gridViewIndex) {
                                            final gridViewAajKaKnowledgeRecord =
                                            gridViewAajKaKnowledgeRecordList[
                                            gridViewIndex];
                                            return Material(
                                              color: Colors.transparent,
                                              elevation: 4.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25.0),
                                              ),
                                              child: Container(
                                                //   width: 400,
                                                // height: 600,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFBF4F7),
                                                  borderRadius: BorderRadius.circular(25.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    // Image with Favorite Icon on top-right
                                                    Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                                          child: InkWell(
                                                            splashColor: Colors.transparent,
                                                            focusColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              print("Id of the image :- ${gridViewAajKaKnowledgeRecord.id}");
                                                              context.pushNamed(
                                                                PicturesWidget.routeName,
                                                                queryParameters: {
                                                                  'currentIndex': serializeParam(
                                                                    gridViewAajKaKnowledgeRecord.id,
                                                                    ParamType.int,
                                                                  ),
                                                                  'type': serializeParam('aajkagyaan', ParamType.String),
                                                                }.withoutNulls,
                                                                extra: <String, dynamic>{
                                                                  kTransitionInfoKey: TransitionInfo(
                                                                    hasTransition: true,
                                                                    transitionType: PageTransitionType.fade,
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Image.network(
                                                              gridViewAajKaKnowledgeRecord.images,
                                                              width: double.infinity,
                                                              height: 165.7,
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment.center,
                                                              cacheHeight: 400,
                                                            ),
                                                          ),
                                                        ),
                                                        // Favorite Icon
                                                        Positioned(
                                                          top: 8.0,
                                                          right: 8.0,
                                                          child: ToggleIcon(
                                                            onPressed: () async {
                                                              final favoriteByElement = currentUserReference;
                                                              final isFavorite = gridViewAajKaKnowledgeRecord.favoriteBy.contains(favoriteByElement);

                                                              final favoriteByUpdate = isFavorite
                                                                  ? FieldValue.arrayRemove([favoriteByElement])
                                                                  : FieldValue.arrayUnion([favoriteByElement]);

                                                              await gridViewAajKaKnowledgeRecord.reference.update({
                                                                'favorite_by': favoriteByUpdate,
                                                              });

                                                              await showDialog(
                                                                context: context,
                                                                builder: (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(isFavorite ? 'हटाया गया' : 'जोड़ा गया'),
                                                                    content: Text(
                                                                      isFavorite
                                                                          ? 'वस्तु को पसंदीदा से हटा दिया गया है।'
                                                                          : 'वस्तु को पसंदीदा में जोड़ा गया है।',
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                        child: Text('ठीक है'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            value: gridViewAajKaKnowledgeRecord.favoriteBy.contains(currentUserReference),
                                                            onIcon: Icon(Icons.favorite, color: Colors.red, size: 28.0),
                                                            offIcon: Icon(Icons.favorite_border, color: Colors.white, size: 28.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Tags Text
                                                    Padding(
                                                      padding: const EdgeInsets.all(20.0),
                                                      child: Text(
                                                        gridViewAajKaKnowledgeRecord.tags,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          // fontFamily: 'Gotu',
                                                          color: Color(0xFFC25123),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          shadows: [
                                                            Shadow(
                                                              color: Color(0xFFC25123),
                                                              offset: Offset(1.0, 1.0),
                                                              blurRadius: 1.0,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );

                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 8,),
                                ],
                              ),
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if (_model.favoriteCategory == 'All')
                                  //   Align(
                                  //     alignment: AlignmentDirectional(-1.0, -1.0),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0.0, 20.0, 0.0, 20.0),
                                  //       child: Text("समतावाद ज्ञान के फोटो",
                                  //         // FFLocalizations.of(context).getText(
                                  //         //   'nkaff948' /* Guruji Photo */,
                                  //         // ),
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyMedium
                                  //             .override(
                                  //           font: GoogleFonts.alegreyaSans(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontStyle:
                                  //             FlutterFlowTheme.of(context)
                                  //                 .bodyMedium
                                  //                 .fontStyle,
                                  //           ),
                                  //           color: Colors.black,
                                  //           fontSize: 18.0,
                                  //           letterSpacing: 0.0,
                                  //           fontWeight: FontWeight.bold,
                                  //           fontStyle:
                                  //           FlutterFlowTheme.of(context)
                                  //               .bodyMedium
                                  //               .fontStyle,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  if ((_model.favoriteCategory ==
                                      'समतावाद ज्ञान'))
                                      // ||
                                      // (_model.favoriteCategory == 'All'))
                                    StreamBuilder<List<SamtawadKnowledgeRecord>>(
                                      stream: querySamtawadKnowledgeRecord(
                                        queryBuilder: (samtawadKnowledgeRecord) =>
                                            samtawadKnowledgeRecord.where(
                                              'favorite_by',
                                              arrayContains: currentUserReference,
                                            ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<SamtawadKnowledgeRecord>
                                        gridViewSamtawadKnowledgeRecordList =
                                        snapshot.data!;

                                        return GridView.builder(

                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                          gridViewSamtawadKnowledgeRecordList
                                              .length,
                                          itemBuilder: (context, gridViewIndex) {
                                            final gridViewSamtawadKnowledgeRecord =
                                            gridViewSamtawadKnowledgeRecordList[
                                            gridViewIndex];
                                            return Material(
                                              color: Colors.transparent,
                                              elevation: 4.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25.0),
                                              ),
                                              child: Container(
                                                //   width: 400,
                                                // height: 600,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFBF4F7),
                                                  borderRadius: BorderRadius.circular(25.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    // Image with Favorite Icon on top-right
                                                    Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                                          child: InkWell(
                                                            splashColor: Colors.transparent,
                                                            focusColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              print("Id of the image :- ${gridViewSamtawadKnowledgeRecord.id}");
                                                              context.pushNamed(
                                                                PicturesWidget.routeName,
                                                                queryParameters: {
                                                                  'currentIndex': serializeParam(
                                                                    gridViewSamtawadKnowledgeRecord.id,
                                                                    ParamType.int,
                                                                  ),
                                                                  'type': serializeParam('samtawadGallery', ParamType.String),
                                                                }.withoutNulls,
                                                                extra: <String, dynamic>{
                                                                  kTransitionInfoKey: TransitionInfo(
                                                                    hasTransition: true,
                                                                    transitionType: PageTransitionType.fade,
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Image.network(
                                                              gridViewSamtawadKnowledgeRecord.images,
                                                              width: double.infinity,
                                                              height: 165.7,
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment.center,
                                                              cacheHeight: 400,
                                                            ),
                                                          ),
                                                        ),
                                                        // Favorite Icon
                                                        Positioned(
                                                          top: 8.0,
                                                          right: 8.0,
                                                          child: ToggleIcon(
                                                            onPressed: () async {
                                                              final favoriteByElement = currentUserReference;
                                                              final isFavorite = gridViewSamtawadKnowledgeRecord.favoriteBy.contains(favoriteByElement);

                                                              final favoriteByUpdate = isFavorite
                                                                  ? FieldValue.arrayRemove([favoriteByElement])
                                                                  : FieldValue.arrayUnion([favoriteByElement]);

                                                              await gridViewSamtawadKnowledgeRecord.reference.update({
                                                                'favorite_by': favoriteByUpdate,
                                                              });

                                                              await showDialog(
                                                                context: context,
                                                                builder: (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(isFavorite ? 'हटाया गया' : 'जोड़ा गया'),
                                                                    content: Text(
                                                                      isFavorite
                                                                          ? 'वस्तु को पसंदीदा से हटा दिया गया है।'
                                                                          : 'वस्तु को पसंदीदा में जोड़ा गया है।',
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                        child: Text('ठीक है'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            value: gridViewSamtawadKnowledgeRecord.favoriteBy.contains(currentUserReference),
                                                            onIcon: Icon(Icons.favorite, color: Colors.red, size: 28.0),
                                                            offIcon: Icon(Icons.favorite_border, color: Colors.white, size: 28.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Tags Text
                                                    Padding(
                                                      padding: const EdgeInsets.all(20.0),
                                                      child: Text(
                                                        gridViewSamtawadKnowledgeRecord.tags,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          // fontFamily: 'Gotu',
                                                          color: Color(0xFFC25123),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          shadows: [
                                                            Shadow(
                                                              color: Color(0xFFC25123),
                                                              offset: Offset(1.0, 1.0),
                                                              blurRadius: 1.0,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );

                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 8,),
                                ],
                              ),
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if (_model.favoriteCategory == 'All')
                                  //   Align(
                                  //     alignment: AlignmentDirectional(-1.0, -1.0),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0.0, 20.0, 0.0, 20.0),
                                  //       child: Text("आश्रम की छवि",
                                  //         // FFLocalizations.of(context).getText(
                                  //         //   'nkaff948' /* Guruji Photo */,
                                  //         // ),
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyMedium
                                  //             .override(
                                  //           font: GoogleFonts.alegreyaSans(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontStyle:
                                  //             FlutterFlowTheme.of(context)
                                  //                 .bodyMedium
                                  //                 .fontStyle,
                                  //           ),
                                  //           color: Colors.black,
                                  //           fontSize: 18.0,
                                  //           letterSpacing: 0.0,
                                  //           fontWeight: FontWeight.bold,
                                  //           fontStyle:
                                  //           FlutterFlowTheme.of(context)
                                  //               .bodyMedium
                                  //               .fontStyle,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  if ((_model.favoriteCategory ==
                                      'आश्रम गैलरी'))
                                      // ||
                                      // (_model.favoriteCategory == 'All'))
                                    StreamBuilder<List<AshramGalleryRecord>>(
                                      stream: queryAshramGalleryRecord(
                                        queryBuilder: (ashramGalleryRecord) =>
                                            ashramGalleryRecord.where(
                                              'favorite_by',
                                              arrayContains: currentUserReference,
                                            ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AshramGalleryRecord>
                                        gridViewAshramGalleryRecordList =
                                        snapshot.data!;

                                        return GridView.builder(

                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                          gridViewAshramGalleryRecordList
                                              .length,
                                          itemBuilder: (context, gridViewIndex) {
                                            final gridViewAshramGalleryRecord =
                                            gridViewAshramGalleryRecordList[
                                            gridViewIndex];
                                            return Material(
                                              color: Colors.transparent,
                                              elevation: 4.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25.0),
                                              ),
                                              child: Container(
                                                //   width: 400,
                                                // height: 600,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFBF4F7),
                                                  borderRadius: BorderRadius.circular(25.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    // Image with Favorite Icon on top-right
                                                    Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                                          child: InkWell(
                                                            splashColor: Colors.transparent,
                                                            focusColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              print("Id of the image :- ${gridViewAshramGalleryRecord.id}");
                                                              context.pushNamed(
                                                                PicturesWidget.routeName,
                                                                queryParameters: {
                                                                  'currentIndex': serializeParam(
                                                                    gridViewAshramGalleryRecord.id,
                                                                    ParamType.int,
                                                                  ),
                                                                  'type': serializeParam('ashramgallery', ParamType.String),
                                                                }.withoutNulls,
                                                                extra: <String, dynamic>{
                                                                  kTransitionInfoKey: TransitionInfo(
                                                                    hasTransition: true,
                                                                    transitionType: PageTransitionType.fade,
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Image.network(
                                                              gridViewAshramGalleryRecord.image,
                                                              width: double.infinity,
                                                              height: 165.7,
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment.center,
                                                              cacheHeight: 400,
                                                            ),
                                                          ),
                                                        ),
                                                        // Favorite Icon
                                                        Positioned(
                                                          top: 8.0,
                                                          right: 8.0,
                                                          child: ToggleIcon(
                                                            onPressed: () async {
                                                              final favoriteByElement = currentUserReference;
                                                              final isFavorite = gridViewAshramGalleryRecord.favoriteBy.contains(favoriteByElement);

                                                              final favoriteByUpdate = isFavorite
                                                                  ? FieldValue.arrayRemove([favoriteByElement])
                                                                  : FieldValue.arrayUnion([favoriteByElement]);

                                                              await gridViewAshramGalleryRecord.reference.update({
                                                                'favorite_by': favoriteByUpdate,
                                                              });

                                                              await showDialog(
                                                                context: context,
                                                                builder: (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(isFavorite ? 'हटाया गया' : 'जोड़ा गया'),
                                                                    content: Text(
                                                                      isFavorite
                                                                          ? 'वस्तु को पसंदीदा से हटा दिया गया है।'
                                                                          : 'वस्तु को पसंदीदा में जोड़ा गया है।',
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                        child: Text('ठीक है'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            value: gridViewAshramGalleryRecord.favoriteBy.contains(currentUserReference),
                                                            onIcon: Icon(Icons.favorite, color: Colors.red, size: 28.0),
                                                            offIcon: Icon(Icons.favorite_border, color: Colors.white, size: 28.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Tags Text
                                                    Padding(
                                                      padding: const EdgeInsets.all(20.0),
                                                      child: Text(
                                                        gridViewAshramGalleryRecord.tags,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          // fontFamily: 'Gotu',
                                                          color: Color(0xFFC25123),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          shadows: [
                                                            Shadow(
                                                              color: Color(0xFFC25123),
                                                              offset: Offset(1.0, 1.0),
                                                              blurRadius: 1.0,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );

                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 8,),
                                ],
                              ),
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if (_model.favoriteCategory == 'All')
                                  //   Align(
                                  //     alignment: AlignmentDirectional(-1.0, -1.0),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0.0, 20.0, 0.0, 20.0),
                                  //       child: Text("ऑडियो",
                                  //
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyMedium
                                  //             .override(
                                  //               font: GoogleFonts.alegreyaSans(
                                  //                 fontWeight: FontWeight.bold,
                                  //                 fontStyle:
                                  //                     FlutterFlowTheme.of(context)
                                  //                         .bodyMedium
                                  //                         .fontStyle,
                                  //               ),
                                  //               color: Colors.black,
                                  //               fontSize: 10.0,
                                  //               letterSpacing: 0.0,
                                  //               fontWeight: FontWeight.bold,
                                  //               fontStyle:
                                  //                   FlutterFlowTheme.of(context)
                                  //                       .bodyMedium
                                  //                       .fontStyle,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  if ((_model.favoriteCategory == 'वाणी'))
                                      // ||
                                      // (_model.favoriteCategory == 'All'))
                                    StreamBuilder<List<AudioRecord>>(
                                      stream: queryAudioRecord(
                                        queryBuilder: (audioRecord) =>
                                            audioRecord.where(
                                          'favorite_by',
                                          arrayContains: currentUserReference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AudioRecord>
                                            gridViewAudioRecordList =
                                            snapshot.data!;

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gridViewAudioRecordList.length,
                                          itemBuilder: (context, gridViewIndex) {
                                            final gridViewAudioRecord =
                                                gridViewAudioRecordList[
                                                    gridViewIndex];
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 240.0,
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
                                                        spreadRadius: 10.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color: Color(0xFFC25123),
                                                      width: 7.0,
                                                    ),
                                                  ),
                                                  alignment: AlignmentDirectional(
                                                      0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap: () async {
                                                                  context
                                                                      .pushNamed(
                                                                    PlayerCopy3Widget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'id':
                                                                          serializeParam(
                                                                        gridViewAudioRecord
                                                                            .id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'audioref':
                                                                          serializeParam(
                                                                        gridViewAudioRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'currentIndex':
                                                                          serializeParam(
                                                                        gridViewAudioRecord
                                                                            .id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'type':
                                                                          serializeParam(
                                                                        'audio',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'pos':
                                                                          serializeParam(
                                                                        0,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    gridViewAudioRecord
                                                                        .image,
                                                                    width: 200.0,
                                                                    height: 180.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, -1.0),
                                                              child: ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  final favoriteByElement =
                                                                      currentUserReference;
                                                                  final favoriteByUpdate = gridViewAudioRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                              favoriteByElement)
                                                                      ? FieldValue
                                                                          .arrayRemove([
                                                                          favoriteByElement
                                                                        ])
                                                                      : FieldValue
                                                                          .arrayUnion([
                                                                          favoriteByElement
                                                                        ]);
                                                                  await gridViewAudioRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                            favoriteByUpdate,
                                                                      },
                                                                    ),
                                                                  });
                                                                  if (gridViewAudioRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                              currentUserReference) ==
                                                                      true) {
                                                                    await gridViewAudioRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite_by':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text(
                                                                              'हटाया गया'),
                                                                          content:
                                                                              Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () =>
                                                                                  Navigator.pop(alertDialogContext),
                                                                              child:
                                                                                  Text('ठीक है'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    await gridViewAudioRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite_by':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text(
                                                                              'जोड़ा गया'),
                                                                          content:
                                                                              Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () =>
                                                                                  Navigator.pop(alertDialogContext),
                                                                              child:
                                                                                  Text('ठीक है'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                value: gridViewAudioRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                        currentUserReference),
                                                                onIcon: Icon(
                                                                  Icons.favorite,
                                                                  color: Color(
                                                                      0xFFC25123),
                                                                  size: 30.0,
                                                                ),
                                                                offIcon: Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color: Color(
                                                                      0xFFC25123),
                                                                  size: 32.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                              gridViewAudioRecord
                                                                  .audioTitle,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Gotu',

                                                                color: Color(
                                                                    0xFF080808),
                                                                fontSize: 18.0,
                                                                letterSpacing: 0.0,
                                                                fontWeight:
                                                                    FontWeight.w900,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    offset: Offset(
                                                                        2.0, 2.0),
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
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 8,),
                                ],
                              ),
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if (_model.favoriteCategory == 'All')
                                  //   Align(
                                  //     alignment: AlignmentDirectional(-1.0, -1.0),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0.0, 20.0, 0.0, 20.0),
                                  //       child: Text("सत्संग",
                                  //
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyMedium
                                  //             .override(
                                  //               font: GoogleFonts.alegreyaSans(
                                  //                 fontWeight: FontWeight.bold,
                                  //                 fontStyle:
                                  //                     FlutterFlowTheme.of(context)
                                  //                         .bodyMedium
                                  //                         .fontStyle,
                                  //               ),
                                  //               color: Colors.black,
                                  //               fontSize: 18.0,
                                  //               letterSpacing: 0.0,
                                  //               fontWeight: FontWeight.bold,
                                  //               fontStyle:
                                  //                   FlutterFlowTheme.of(context)
                                  //                       .bodyMedium
                                  //                       .fontStyle,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  if ((_model.favoriteCategory == 'सत्संग'))
                                      // ||
                                      // (_model.favoriteCategory == 'All'))
                                    StreamBuilder<List<SatsangRecord>>(
                                      stream: querySatsangRecord(
                                        queryBuilder: (satsangRecord) =>
                                            satsangRecord.where(
                                          'favorite_by',
                                          arrayContains: currentUserReference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<SatsangRecord>
                                            gridViewSatsangRecordList =
                                            snapshot.data!;

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gridViewSatsangRecordList.length,
                                          itemBuilder: (context, gridViewIndex) {
                                            final gridViewSatsangRecord =
                                                gridViewSatsangRecordList[
                                                    gridViewIndex];
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 240.0,
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
                                                        spreadRadius: 10.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color: Color(0xFFC25123),
                                                      width: 7.0,
                                                    ),
                                                  ),
                                                  alignment: AlignmentDirectional(
                                                      0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap: () async {
                                                                  context
                                                                      .pushNamed(
                                                                    PlayerCopy2Widget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'id':
                                                                          serializeParam(
                                                                        gridViewSatsangRecord
                                                                            .id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'audioref':
                                                                          serializeParam(
                                                                        gridViewSatsangRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'currentIndex':
                                                                          serializeParam(
                                                                        gridViewSatsangRecord
                                                                            .id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'type':
                                                                          serializeParam(
                                                                        'satsang',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'pos':
                                                                          serializeParam(
                                                                        0,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    gridViewSatsangRecord
                                                                        .imageUrl,
                                                                    width: 200.0,
                                                                    height: 180.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, -1.0),
                                                              child: ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  final favoriteByElement =
                                                                      currentUserReference;
                                                                  final favoriteByUpdate = gridViewSatsangRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                              favoriteByElement)
                                                                      ? FieldValue
                                                                          .arrayRemove([
                                                                          favoriteByElement
                                                                        ])
                                                                      : FieldValue
                                                                          .arrayUnion([
                                                                          favoriteByElement
                                                                        ]);
                                                                  await gridViewSatsangRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                            favoriteByUpdate,
                                                                      },
                                                                    ),
                                                                  });
                                                                  if (gridViewSatsangRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                              currentUserReference) ==
                                                                      true) {
                                                                    await gridViewSatsangRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite_by':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text(
                                                                              'हटाया गया'),
                                                                          content:
                                                                              Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () =>
                                                                                  Navigator.pop(alertDialogContext),
                                                                              child:
                                                                                  Text('ठीक है'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    await gridViewSatsangRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite_by':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text(
                                                                              'जोड़ा गया'),
                                                                          content:
                                                                              Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () =>
                                                                                  Navigator.pop(alertDialogContext),
                                                                              child:
                                                                                  Text('ठीक है'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                value: gridViewSatsangRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                        currentUserReference),
                                                                onIcon: Icon(
                                                                  Icons.favorite,
                                                                  color: Color(
                                                                      0xFFC25123),
                                                                  size: 30.0,
                                                                ),
                                                                offIcon: Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color: Color(
                                                                      0xFFC25123),
                                                                  size: 32.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                              gridViewSatsangRecord
                                                                  .title,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Gotu',
                                                                color: Color(
                                                                    0xFF080808),
                                                                fontSize: 18.0,
                                                                letterSpacing: 0.0,
                                                                fontWeight:
                                                                    FontWeight.w900,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    offset: Offset(
                                                                        2.0, 2.0),
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
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 8,),
                                ],
                              ),
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if (_model.favoriteCategory == 'All')
                                  //   Align(
                                  //     alignment: AlignmentDirectional(-1.0, -1.0),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0.0, 20.0, 0.0, 20.0),
                                  //       child: Text(
                                  //         FFLocalizations.of(context).getText(
                                  //           '491l0pi0' /* गुरुकालीन सत्संग */,
                                  //         ),
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyMedium
                                  //             .override(
                                  //               font: GoogleFonts.alegreyaSans(
                                  //                 fontWeight: FontWeight.bold,
                                  //                 fontStyle:
                                  //                     FlutterFlowTheme.of(context)
                                  //                         .bodyMedium
                                  //                         .fontStyle,
                                  //               ),
                                  //               color: Colors.black,
                                  //               fontSize: 18.0,
                                  //               letterSpacing: 0.0,
                                  //               fontWeight: FontWeight.bold,
                                  //               fontStyle:
                                  //                   FlutterFlowTheme.of(context)
                                  //                       .bodyMedium
                                  //                       .fontStyle,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  if ((_model.favoriteCategory ==
                                          'गुरुकालीन सत्संग'))
                                      // ||
                                      // (_model.favoriteCategory == 'All'))
                                    StreamBuilder<List<GurukalinSatsangRecord>>(
                                      stream: queryGurukalinSatsangRecord(
                                        queryBuilder: (gurukalinSatsangRecord) =>
                                            gurukalinSatsangRecord.where(
                                          'favorite_by',
                                          arrayContains: currentUserReference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<GurukalinSatsangRecord>
                                            gridViewGurukalinSatsangRecordList =
                                            snapshot.data!;

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gridViewGurukalinSatsangRecordList
                                                  .length,
                                          itemBuilder: (context, gridViewIndex) {
                                            final gridViewGurukalinSatsangRecord =
                                                gridViewGurukalinSatsangRecordList[
                                                    gridViewIndex];
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 240.0,
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
                                                        spreadRadius: 10.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color: Color(0xFFC25123),
                                                      width: 7.0,
                                                    ),
                                                  ),
                                                  alignment: AlignmentDirectional(
                                                      0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap: () async {
                                                                  context
                                                                      .pushNamed(
                                                                    PlayerCopy2CopyWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'id':
                                                                          serializeParam(
                                                                        gridViewGurukalinSatsangRecord
                                                                            .id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'type':
                                                                          serializeParam(
                                                                        'gurukalin_satsang',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'pos':
                                                                          serializeParam(
                                                                        0,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    gridViewGurukalinSatsangRecord
                                                                        .imageUrl,
                                                                    width: 200.0,
                                                                    height: 180.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, -1.0),
                                                              child: ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  final favoriteByElement =
                                                                      currentUserReference;
                                                                  final favoriteByUpdate = gridViewGurukalinSatsangRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                              favoriteByElement)
                                                                      ? FieldValue
                                                                          .arrayRemove([
                                                                          favoriteByElement
                                                                        ])
                                                                      : FieldValue
                                                                          .arrayUnion([
                                                                          favoriteByElement
                                                                        ]);
                                                                  await gridViewGurukalinSatsangRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                            favoriteByUpdate,
                                                                      },
                                                                    ),
                                                                  });
                                                                  if (gridViewGurukalinSatsangRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                              currentUserReference) ==
                                                                      true) {
                                                                    await gridViewGurukalinSatsangRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite_by':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text(
                                                                              'हटाया गया'),
                                                                          content:
                                                                              Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () =>
                                                                                  Navigator.pop(alertDialogContext),
                                                                              child:
                                                                                  Text('ठीक है'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    await gridViewGurukalinSatsangRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite_by':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text(
                                                                              'जोड़ा गया'),
                                                                          content:
                                                                              Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () =>
                                                                                  Navigator.pop(alertDialogContext),
                                                                              child:
                                                                                  Text('ठीक है'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                value: gridViewGurukalinSatsangRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                        currentUserReference),
                                                                onIcon: Icon(
                                                                  Icons.favorite,
                                                                  color: Color(
                                                                      0xFFC25123),
                                                                  size: 30.0,
                                                                ),
                                                                offIcon: Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color: Color(
                                                                      0xFFC25123),
                                                                  size: 32.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                              gridViewGurukalinSatsangRecord
                                                                  .satsangTitle,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Gotu',
                                                                color: Color(
                                                                    0xFF080808),
                                                                fontSize: 18.0,
                                                                letterSpacing: 0.0,
                                                                fontWeight:
                                                                    FontWeight.w900,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    offset: Offset(
                                                                        2.0, 2.0),
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
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 8,),
                                ],
                              ),
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if (_model.favoriteCategory == 'All')
                                  //   Align(
                                  //     alignment: AlignmentDirectional(-1.0, -1.0),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0.0, 20.0, 0.0, 20.0),
                                  //       child: Text("ऑडियो पुस्तक",
                                  //
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyMedium
                                  //             .override(
                                  //               font: GoogleFonts.alegreyaSans(
                                  //                 fontWeight: FontWeight.bold,
                                  //                 fontStyle:
                                  //                     FlutterFlowTheme.of(context)
                                  //                         .bodyMedium
                                  //                         .fontStyle,
                                  //               ),
                                  //               color: Colors.black,
                                  //               fontSize: 18.0,
                                  //               letterSpacing: 0.0,
                                  //               fontWeight: FontWeight.bold,
                                  //               fontStyle:
                                  //                   FlutterFlowTheme.of(context)
                                  //                       .bodyMedium
                                  //                       .fontStyle,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  if ((_model.favoriteCategory == 'ऑडियो पुस्तक'))
                                      // ||
                                      // (_model.favoriteCategory == 'All'))
                                    StreamBuilder<List<AudioBookRecord>>(
                                      stream: queryAudioBookRecord(
                                        queryBuilder: (audioBookRecord) =>
                                            audioBookRecord.where(
                                          'favourite_by',
                                          arrayContains: currentUserReference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AudioBookRecord>
                                            gridViewAudioBookRecordList =
                                            snapshot.data!;

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gridViewAudioBookRecordList.length,
                                          itemBuilder: (context, gridViewIndex) {
                                            final gridViewAudioBookRecord =
                                                gridViewAudioBookRecordList[
                                                    gridViewIndex];
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 240.0,
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
                                                        spreadRadius: 10.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color: Color(0xFFC25123),
                                                      width: 7.0,
                                                    ),
                                                  ),
                                                  alignment: AlignmentDirectional(
                                                      0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap: () async {
                                                                  context
                                                                      .pushNamed(
                                                                    Book2Widget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'audioDocumnetRef':
                                                                          serializeParam(
                                                                        gridViewAudioBookRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    gridViewAudioBookRecord
                                                                        .bookImage,
                                                                    width: 200.0,
                                                                    height: 180.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, -1.0),
                                                              child: ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  final favouriteByElement =
                                                                      currentUserReference;
                                                                  final favouriteByUpdate = gridViewAudioBookRecord
                                                                          .favouriteBy
                                                                          .contains(
                                                                              favouriteByElement)
                                                                      ? FieldValue
                                                                          .arrayRemove([
                                                                          favouriteByElement
                                                                        ])
                                                                      : FieldValue
                                                                          .arrayUnion([
                                                                          favouriteByElement
                                                                        ]);
                                                                  await gridViewAudioBookRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favourite_by':
                                                                            favouriteByUpdate,
                                                                      },
                                                                    ),
                                                                  });
                                                                  if (gridViewAudioBookRecord
                                                                          .favouriteBy
                                                                          .contains(
                                                                              currentUserReference) ==
                                                                      true) {
                                                                    await gridViewAudioBookRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favourite_by':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text(
                                                                              'हटाया गया'),
                                                                          content:
                                                                              Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () =>
                                                                                  Navigator.pop(alertDialogContext),
                                                                              child:
                                                                                  Text('ठीक है'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    await gridViewAudioBookRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favourite_by':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text(
                                                                              'जोड़ा गया'),
                                                                          content:
                                                                              Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () =>
                                                                                  Navigator.pop(alertDialogContext),
                                                                              child:
                                                                                  Text('ठीक है'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                value: gridViewAudioBookRecord
                                                                    .favouriteBy
                                                                    .contains(
                                                                        currentUserReference),
                                                                onIcon: Icon(
                                                                  Icons.favorite,
                                                                  color: Color(
                                                                      0xFFC25123),
                                                                  size: 30.0,
                                                                ),
                                                                offIcon: Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color: Color(
                                                                      0xFFC25123),
                                                                  size: 32.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            gridViewAudioBookRecord
                                                                .bookName,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily: 'Gotu',
                                                              color: Color(
                                                                  0xFF080808),
                                                              fontSize: 18.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight:
                                                                  FontWeight.w900,
                                                              shadows: [
                                                                Shadow(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  offset: Offset(
                                                                      2.0, 2.0),
                                                                  blurRadius: 2.0,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 8,),
                                ],
                              ),
                                // SizedBox(height: 8,),
                              // Column(
                              //   mainAxisSize: MainAxisSize.max,
                              //   children: [
                              //     if (_model.favoriteCategory == 'All')
                              //       Align(
                              //         alignment: AlignmentDirectional(-1.0, -1.0),
                              //         child: Padding(
                              //           padding: EdgeInsetsDirectional.fromSTEB(
                              //               0.0, 20.0, 0.0, 20.0),
                              //           child: Text(
                              //             FFLocalizations.of(context).getText(
                              //               'whg2xknp' /* अध्याय */,
                              //             ),
                              //             style: FlutterFlowTheme.of(context)
                              //                 .bodyMedium
                              //                 .override(
                              //                   font: GoogleFonts.alegreyaSans(
                              //                     fontWeight: FontWeight.bold,
                              //                     fontStyle:
                              //                         FlutterFlowTheme.of(context)
                              //                             .bodyMedium
                              //                             .fontStyle,
                              //                   ),
                              //                   color: Colors.black,
                              //                   fontSize: 18.0,
                              //                   letterSpacing: 0.0,
                              //                   fontWeight: FontWeight.bold,
                              //                   fontStyle:
                              //                       FlutterFlowTheme.of(context)
                              //                           .bodyMedium
                              //                           .fontStyle,
                              //                 ),
                              //           ),
                              //         ),
                              //       ),
                              //     if ((_model.favoriteCategory ==
                              //             'ऑडियो बुक अध्याय') &&
                              //         (_model.favoriteCategory == 'All'))
                              //       StreamBuilder<List<ChaptersRecord>>(
                              //         stream: queryChaptersRecord(
                              //           queryBuilder: (chaptersRecord) =>
                              //               chaptersRecord.where(
                              //             'favourite_by',
                              //             arrayContains: currentUserReference,
                              //           ),
                              //         ),
                              //         builder: (context, snapshot) {
                              //           // Customize what your widget looks like when it's loading.
                              //           if (!snapshot.hasData) {
                              //             return Center(
                              //               child: SizedBox(
                              //                 width: 50.0,
                              //                 height: 50.0,
                              //                 child: CircularProgressIndicator(
                              //                   valueColor:
                              //                       AlwaysStoppedAnimation<Color>(
                              //                     FlutterFlowTheme.of(context)
                              //                         .primary,
                              //                   ),
                              //                 ),
                              //               ),
                              //             );
                              //           }
                              //           List<ChaptersRecord>
                              //               gridViewChaptersRecordList =
                              //               snapshot.data!;
                              //
                              //           return GridView.builder(
                              //             padding: EdgeInsets.zero,
                              //             gridDelegate:
                              //                 SliverGridDelegateWithFixedCrossAxisCount(
                              //               crossAxisCount: 2,
                              //               crossAxisSpacing: 20.0,
                              //               mainAxisSpacing: 20.0,
                              //               childAspectRatio: 0.6,
                              //             ),
                              //             primary: false,
                              //             shrinkWrap: true,
                              //             scrollDirection: Axis.vertical,
                              //             itemCount:
                              //                 gridViewChaptersRecordList.length,
                              //             itemBuilder: (context, gridViewIndex) {
                              //               final gridViewChaptersRecord =
                              //                   gridViewChaptersRecordList[
                              //                       gridViewIndex];
                              //               return Align(
                              //                 alignment:
                              //                     AlignmentDirectional(0.0, -1.0),
                              //                 child: Container(
                              //                   width: double.infinity,
                              //                   height: 237.6,
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.white,
                              //                     boxShadow: [
                              //                       BoxShadow(
                              //                         blurRadius: 4.0,
                              //                         color: Color(0x33000000),
                              //                         offset: Offset(
                              //                           0.0,
                              //                           2.0,
                              //                         ),
                              //                         spreadRadius: 10.0,
                              //                       )
                              //                     ],
                              //                     borderRadius:
                              //                         BorderRadius.circular(12.0),
                              //                     shape: BoxShape.rectangle,
                              //                     border: Border.all(
                              //                       color: Color(0xFFC25123),
                              //                       width: 7.0,
                              //                     ),
                              //                   ),
                              //                   alignment: AlignmentDirectional(
                              //                       0.0, 0.0),
                              //                   child: Stack(
                              //                     children: [
                              //                       Align(
                              //                         alignment:
                              //                             AlignmentDirectional(
                              //                                 -1.0, 0.0),
                              //                         child: Material(
                              //                           color: Colors.transparent,
                              //                           elevation: 2.0,
                              //                           shape:
                              //                               RoundedRectangleBorder(
                              //                             borderRadius:
                              //                                 BorderRadius.only(
                              //                               bottomLeft:
                              //                                   Radius.circular(
                              //                                       10.0),
                              //                               bottomRight:
                              //                                   Radius.circular(
                              //                                       10.0),
                              //                               topLeft:
                              //                                   Radius.circular(
                              //                                       10.0),
                              //                               topRight:
                              //                                   Radius.circular(
                              //                                       10.0),
                              //                             ),
                              //                           ),
                              //                           child: Container(
                              //                             decoration:
                              //                                 BoxDecoration(
                              //                               gradient:
                              //                                   LinearGradient(
                              //                                 colors: [
                              //                                   Color(0xFFF6F5F4),
                              //                                   Color(0xFFE7D0C2)
                              //                                 ],
                              //                                 stops: [0.0, 1.0],
                              //                                 begin:
                              //                                     AlignmentDirectional(
                              //                                         0.0, -1.0),
                              //                                 end:
                              //                                     AlignmentDirectional(
                              //                                         0, 1.0),
                              //                               ),
                              //                               borderRadius:
                              //                                   BorderRadius.only(
                              //                                 bottomLeft:
                              //                                     Radius.circular(
                              //                                         10.0),
                              //                                 bottomRight:
                              //                                     Radius.circular(
                              //                                         10.0),
                              //                                 topLeft:
                              //                                     Radius.circular(
                              //                                         10.0),
                              //                                 topRight:
                              //                                     Radius.circular(
                              //                                         10.0),
                              //                               ),
                              //                             ),
                              //                             child: Padding(
                              //                               padding:
                              //                                   EdgeInsetsDirectional
                              //                                       .fromSTEB(
                              //                                           10.0,
                              //                                           20.0,
                              //                                           10.0,
                              //                                           10.0),
                              //                               child: InkWell(
                              //                                 splashColor: Colors
                              //                                     .transparent,
                              //                                 focusColor: Colors
                              //                                     .transparent,
                              //                                 hoverColor: Colors
                              //                                     .transparent,
                              //                                 highlightColor:
                              //                                     Colors
                              //                                         .transparent,
                              //                                 onTap: () async {
                              //                                   context.pushNamed(
                              //                                     PlayerCopy2CopyCopyWidget
                              //                                         .routeName,
                              //                                     queryParameters:
                              //                                         {
                              //                                       'id':
                              //                                           serializeParam(
                              //                                         gridViewChaptersRecord
                              //                                             .id,
                              //                                         ParamType
                              //                                             .int,
                              //                                       ),
                              //                                       'type':
                              //                                           serializeParam(
                              //                                         'chapters',
                              //                                         ParamType
                              //                                             .String,
                              //                                       ),
                              //                                       'pos':
                              //                                           serializeParam(
                              //                                         0,
                              //                                         ParamType
                              //                                             .int,
                              //                                       ),
                              //                                     }.withoutNulls,
                              //                                   );
                              //                                 },
                              //                                 child: Column(
                              //                                   mainAxisSize:
                              //                                       MainAxisSize
                              //                                           .max,
                              //                                   mainAxisAlignment:
                              //                                       MainAxisAlignment
                              //                                           .center,
                              //                                   crossAxisAlignment:
                              //                                       CrossAxisAlignment
                              //                                           .center,
                              //                                   children: [
                              //                                     Align(
                              //                                       alignment:
                              //                                           AlignmentDirectional(
                              //                                               0.0,
                              //                                               0.0),
                              //                                       child: Text(
                              //                                         gridViewChaptersRecord
                              //                                             .chapterName,
                              //                                         style: FlutterFlowTheme.of(
                              //                                                 context)
                              //                                             .bodyMedium
                              //                                             .override(
                              //                                               // fontFamily:
                              //                                               //     'Gotu',
                              //                                               color:
                              //                                                   Color(0xFF080808),
                              //                                               fontSize:
                              //                                                   16.0,
                              //                                               letterSpacing:
                              //                                                   0.0,
                              //                                               fontWeight:
                              //                                                   FontWeight.w900,
                              //                                             ),
                              //                                       ),
                              //                                     ),
                              //                                     Align(
                              //                                       alignment:
                              //                                           AlignmentDirectional(
                              //                                               0.0,
                              //                                               0.0),
                              //                                       child:
                              //                                           Padding(
                              //                                         padding: EdgeInsetsDirectional
                              //                                             .fromSTEB(
                              //                                                 0.0,
                              //                                                 10.0,
                              //                                                 0.0,
                              //                                                 0.0),
                              //                                         child: Text(
                              //                                           gridViewChaptersRecord
                              //                                               .chapterInfo,
                              //                                           textAlign:
                              //                                               TextAlign
                              //                                                   .center,
                              //                                           style: FlutterFlowTheme.of(
                              //                                                   context)
                              //                                               .bodyMedium
                              //                                               .override(
                              //                                                 fontFamily:
                              //                                                     'heders',
                              //                                                 color:
                              //                                                     Color(0xFF0B0B0B),
                              //                                                 fontSize:
                              //                                                     15.0,
                              //                                                 letterSpacing:
                              //                                                     0.0,
                              //                                                 fontWeight:
                              //                                                     FontWeight.w900,
                              //                                               ),
                              //                                         ),
                              //                                       ),
                              //                                     ),
                              //                                   ],
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                           ),
                              //                         ),
                              //                       ),
                              //                       Align(
                              //                         alignment:
                              //                             AlignmentDirectional(
                              //                                 1.0, 0.0),
                              //                         child: Padding(
                              //                           padding:
                              //                               EdgeInsetsDirectional
                              //                                   .fromSTEB(
                              //                                       0.0,
                              //                                       10.0,
                              //                                       0.0,
                              //                                       0.0),
                              //                           child: Column(
                              //                             mainAxisSize:
                              //                                 MainAxisSize.max,
                              //                             mainAxisAlignment:
                              //                                 MainAxisAlignment
                              //                                     .start,
                              //                             children: [
                              //                               Align(
                              //                                 alignment:
                              //                                     AlignmentDirectional(
                              //                                         1.0, -1.0),
                              //                                 child: ToggleIcon(
                              //                                   onPressed:
                              //                                       () async {
                              //                                     final favouriteByElement =
                              //                                         currentUserReference;
                              //                                     final favouriteByUpdate = gridViewChaptersRecord
                              //                                             .favouriteBy
                              //                                             .contains(
                              //                                                 favouriteByElement)
                              //                                         ? FieldValue
                              //                                             .arrayRemove([
                              //                                             favouriteByElement
                              //                                           ])
                              //                                         : FieldValue
                              //                                             .arrayUnion([
                              //                                             favouriteByElement
                              //                                           ]);
                              //                                     await gridViewChaptersRecord
                              //                                         .reference
                              //                                         .update({
                              //                                       ...mapToFirestore(
                              //                                         {
                              //                                           'favourite_by':
                              //                                               favouriteByUpdate,
                              //                                         },
                              //                                       ),
                              //                                     });
                              //                                     if (gridViewChaptersRecord
                              //                                             .favouriteBy
                              //                                             .contains(
                              //                                                 currentUserReference) ==
                              //                                         true) {
                              //                                       await gridViewChaptersRecord
                              //                                           .reference
                              //                                           .update({
                              //                                         ...mapToFirestore(
                              //                                           {
                              //                                             'favourite_by':
                              //                                                 FieldValue.arrayRemove([
                              //                                               currentUserReference
                              //                                             ]),
                              //                                           },
                              //                                         ),
                              //                                       });
                              //                                       await showDialog(
                              //                                         context:
                              //                                             context,
                              //                                         builder:
                              //                                             (alertDialogContext) {
                              //                                           return AlertDialog(
                              //                                             title: Text(
                              //                                                 'हटाया गया'),
                              //                                             content:
                              //                                                 Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                              //                                             actions: [
                              //                                               TextButton(
                              //                                                 onPressed: () =>
                              //                                                     Navigator.pop(alertDialogContext),
                              //                                                 child:
                              //                                                     Text('ठीक है'),
                              //                                               ),
                              //                                             ],
                              //                                           );
                              //                                         },
                              //                                       );
                              //                                     } else {
                              //                                       await gridViewChaptersRecord
                              //                                           .reference
                              //                                           .update({
                              //                                         ...mapToFirestore(
                              //                                           {
                              //                                             'favourite_by':
                              //                                                 FieldValue.arrayUnion([
                              //                                               currentUserReference
                              //                                             ]),
                              //                                           },
                              //                                         ),
                              //                                       });
                              //                                       await showDialog(
                              //                                         context:
                              //                                             context,
                              //                                         builder:
                              //                                             (alertDialogContext) {
                              //                                           return AlertDialog(
                              //                                             title: Text(
                              //                                                 'जोड़ा गया'),
                              //                                             content:
                              //                                                 Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                              //                                             actions: [
                              //                                               TextButton(
                              //                                                 onPressed: () =>
                              //                                                     Navigator.pop(alertDialogContext),
                              //                                                 child:
                              //                                                     Text('ठीक है'),
                              //                                               ),
                              //                                             ],
                              //                                           );
                              //                                         },
                              //                                       );
                              //                                     }
                              //                                   },
                              //                                   value: gridViewChaptersRecord
                              //                                       .favouriteBy
                              //                                       .contains(
                              //                                           currentUserReference),
                              //                                   onIcon: Icon(
                              //                                     Icons
                              //                                         .favorite_outlined,
                              //                                     color: Color(
                              //                                         0xFFEA1414),
                              //                                     size: 30.0,
                              //                                   ),
                              //                                   offIcon: Icon(
                              //                                     Icons
                              //                                         .favorite_border,
                              //                                     color: Color(
                              //                                         0xFFEA1414),
                              //                                     size: 30.0,
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //               );
                              //             },
                              //           );
                              //         },
                              //       ),
                              //   ],
                              // ),
                                if(_model.favoriteCategory == 'सभी')
                                Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // if((_model.favoriteCategory == 'सभी'))
                                      Align(
                                        alignment: AlignmentDirectional(
                                            -1.0, -1.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                              0.0, 20.0, 0.0, 20.0),
                                          child: Text("ऑडियो",
                                            style: FlutterFlowTheme
                                                .of(context)
                                                .bodyMedium
                                                .override(
                                              font: GoogleFonts.alegreyaSans(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                FlutterFlowTheme
                                                    .of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4,),
                                      StreamBuilder<List<AudioRecord>>(
                                    stream: queryAudioRecord(
                                      queryBuilder: (audioRecord) =>
                                          audioRecord.where(
                                            'favorite_by',
                                            arrayContains: currentUserReference,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<AudioRecord>
                                      gridViewAudioRecordList =
                                      snapshot.data!;

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20.0,
                                          mainAxisSpacing: 20.0,
                                          childAspectRatio: 0.6,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                        gridViewAudioRecordList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewAudioRecord =
                                          gridViewAudioRecordList[
                                          gridViewIndex];
                                          return Align(
                                            alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                height: 240.0,
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
                                                      spreadRadius: 10.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: Color(0xFFC25123),
                                                    width: 7.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1.0, -1.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                              Colors
                                                                  .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  PlayerCopy3Widget
                                                                      .routeName,
                                                                  queryParameters:
                                                                  {
                                                                    'id':
                                                                    serializeParam(
                                                                      gridViewAudioRecord
                                                                          .id,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'audioref':
                                                                    serializeParam(
                                                                      gridViewAudioRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'currentIndex':
                                                                    serializeParam(
                                                                      gridViewAudioRecord
                                                                          .id,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'type':
                                                                    serializeParam(
                                                                      'audio',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'pos':
                                                                    serializeParam(
                                                                      0,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child: Image
                                                                    .network(
                                                                  gridViewAudioRecord
                                                                      .image,
                                                                  width: 200.0,
                                                                  height: 180.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  alignment:
                                                                  Alignment(
                                                                      0.0,
                                                                      0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                            child: ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final favoriteByElement =
                                                                    currentUserReference;
                                                                final favoriteByUpdate = gridViewAudioRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                    favoriteByElement)
                                                                    ? FieldValue
                                                                    .arrayRemove([
                                                                  favoriteByElement
                                                                ])
                                                                    : FieldValue
                                                                    .arrayUnion([
                                                                  favoriteByElement
                                                                ]);
                                                                await gridViewAudioRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'favorite_by':
                                                                      favoriteByUpdate,
                                                                    },
                                                                  ),
                                                                });
                                                                if (gridViewAudioRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                    currentUserReference) ==
                                                                    true) {
                                                                  await gridViewAudioRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                        FieldValue.arrayRemove([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'हटाया गया'),
                                                                        content:
                                                                        Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                            Text('ठीक है'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  await gridViewAudioRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                        FieldValue.arrayUnion([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'जोड़ा गया'),
                                                                        content:
                                                                        Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                            Text('ठीक है'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              },
                                                              value: gridViewAudioRecord
                                                                  .favoriteBy
                                                                  .contains(
                                                                  currentUserReference),
                                                              onIcon: Icon(
                                                                Icons.favorite,
                                                                color: Color(
                                                                    0xFFC25123),
                                                                size: 30.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Color(
                                                                    0xFFC25123),
                                                                size: 32.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            gridViewAudioRecord
                                                                .audioTitle,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily: 'Gotu',

                                                              color: Color(
                                                                  0xFF080808),
                                                              fontSize: 18.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight:
                                                              FontWeight.w900,
                                                              shadows: [
                                                                Shadow(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryText,
                                                                  offset: Offset(
                                                                      2.0, 2.0),
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
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                      SizedBox(height: 4,),
                                      StreamBuilder<List<SatsangRecord>>(
                                    stream: querySatsangRecord(
                                      queryBuilder: (satsangRecord) =>
                                          satsangRecord.where(
                                            'favorite_by',
                                            arrayContains: currentUserReference,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<SatsangRecord>
                                      gridViewSatsangRecordList =
                                      snapshot.data!;

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20.0,
                                          mainAxisSpacing: 20.0,
                                          childAspectRatio: 0.6,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                        gridViewSatsangRecordList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewSatsangRecord =
                                          gridViewSatsangRecordList[
                                          gridViewIndex];
                                          return Align(
                                            alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                height: 240.0,
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
                                                      spreadRadius: 10.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: Color(0xFFC25123),
                                                    width: 7.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1.0, -1.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                              Colors
                                                                  .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  PlayerCopy2Widget
                                                                      .routeName,
                                                                  queryParameters:
                                                                  {
                                                                    'id':
                                                                    serializeParam(
                                                                      gridViewSatsangRecord
                                                                          .id,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'audioref':
                                                                    serializeParam(
                                                                      gridViewSatsangRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'currentIndex':
                                                                    serializeParam(
                                                                      gridViewSatsangRecord
                                                                          .id,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'type':
                                                                    serializeParam(
                                                                      'satsang',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'pos':
                                                                    serializeParam(
                                                                      0,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child: Image
                                                                    .network(
                                                                  gridViewSatsangRecord
                                                                      .imageUrl,
                                                                  width: 200.0,
                                                                  height: 180.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  alignment:
                                                                  Alignment(
                                                                      0.0,
                                                                      0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                            child: ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final favoriteByElement =
                                                                    currentUserReference;
                                                                final favoriteByUpdate = gridViewSatsangRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                    favoriteByElement)
                                                                    ? FieldValue
                                                                    .arrayRemove([
                                                                  favoriteByElement
                                                                ])
                                                                    : FieldValue
                                                                    .arrayUnion([
                                                                  favoriteByElement
                                                                ]);
                                                                await gridViewSatsangRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'favorite_by':
                                                                      favoriteByUpdate,
                                                                    },
                                                                  ),
                                                                });
                                                                if (gridViewSatsangRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                    currentUserReference) ==
                                                                    true) {
                                                                  await gridViewSatsangRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                        FieldValue.arrayRemove([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'हटाया गया'),
                                                                        content:
                                                                        Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                            Text('ठीक है'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  await gridViewSatsangRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                        FieldValue.arrayUnion([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'जोड़ा गया'),
                                                                        content:
                                                                        Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                            Text('ठीक है'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              },
                                                              value: gridViewSatsangRecord
                                                                  .favoriteBy
                                                                  .contains(
                                                                  currentUserReference),
                                                              onIcon: Icon(
                                                                Icons.favorite,
                                                                color: Color(
                                                                    0xFFC25123),
                                                                size: 30.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Color(
                                                                    0xFFC25123),
                                                                size: 32.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            gridViewSatsangRecord
                                                                .title,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily: 'Gotu',
                                                              color: Color(
                                                                  0xFF080808),
                                                              fontSize: 18.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight:
                                                              FontWeight.w900,
                                                              shadows: [
                                                                Shadow(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryText,
                                                                  offset: Offset(
                                                                      2.0, 2.0),
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
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                      SizedBox(height: 4,),
                                      StreamBuilder<List<GurukalinSatsangRecord>>(
                                    stream: queryGurukalinSatsangRecord(
                                      queryBuilder: (gurukalinSatsangRecord) =>
                                          gurukalinSatsangRecord.where(
                                            'favorite_by',
                                            arrayContains: currentUserReference,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<GurukalinSatsangRecord>
                                      gridViewGurukalinSatsangRecordList =
                                      snapshot.data!;

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20.0,
                                          mainAxisSpacing: 20.0,
                                          childAspectRatio: 0.6,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                        gridViewGurukalinSatsangRecordList
                                            .length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewGurukalinSatsangRecord =
                                          gridViewGurukalinSatsangRecordList[
                                          gridViewIndex];
                                          return Align(
                                            alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                height: 240.0,
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
                                                      spreadRadius: 10.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: Color(0xFFC25123),
                                                    width: 7.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1.0, -1.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                              Colors
                                                                  .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  PlayerCopy2CopyWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                  {
                                                                    'id':
                                                                    serializeParam(
                                                                      gridViewGurukalinSatsangRecord
                                                                          .id,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'type':
                                                                    serializeParam(
                                                                      'gurukalin_satsang',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'pos':
                                                                    serializeParam(
                                                                      0,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child: Image
                                                                    .network(
                                                                  gridViewGurukalinSatsangRecord
                                                                      .imageUrl,
                                                                  width: 200.0,
                                                                  height: 180.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  alignment:
                                                                  Alignment(
                                                                      0.0,
                                                                      0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                            child: ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final favoriteByElement =
                                                                    currentUserReference;
                                                                final favoriteByUpdate = gridViewGurukalinSatsangRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                    favoriteByElement)
                                                                    ? FieldValue
                                                                    .arrayRemove([
                                                                  favoriteByElement
                                                                ])
                                                                    : FieldValue
                                                                    .arrayUnion([
                                                                  favoriteByElement
                                                                ]);
                                                                await gridViewGurukalinSatsangRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'favorite_by':
                                                                      favoriteByUpdate,
                                                                    },
                                                                  ),
                                                                });
                                                                if (gridViewGurukalinSatsangRecord
                                                                    .favoriteBy
                                                                    .contains(
                                                                    currentUserReference) ==
                                                                    true) {
                                                                  await gridViewGurukalinSatsangRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                        FieldValue.arrayRemove([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'हटाया गया'),
                                                                        content:
                                                                        Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                            Text('ठीक है'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  await gridViewGurukalinSatsangRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorite_by':
                                                                        FieldValue.arrayUnion([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'जोड़ा गया'),
                                                                        content:
                                                                        Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                            Text('ठीक है'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              },
                                                              value: gridViewGurukalinSatsangRecord
                                                                  .favoriteBy
                                                                  .contains(
                                                                  currentUserReference),
                                                              onIcon: Icon(
                                                                Icons.favorite,
                                                                color: Color(
                                                                    0xFFC25123),
                                                                size: 30.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Color(
                                                                    0xFFC25123),
                                                                size: 32.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            gridViewGurukalinSatsangRecord
                                                                .satsangTitle,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily: 'Gotu',
                                                              color: Color(
                                                                  0xFF080808),
                                                              fontSize: 18.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight:
                                                              FontWeight.w900,
                                                              shadows: [
                                                                Shadow(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryText,
                                                                  offset: Offset(
                                                                      2.0, 2.0),
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
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                      SizedBox(height: 10,),
                                      Align(
                                      alignment: AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 20.0),
                                        child: Text("ऑडियो बुक",

                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.alegreyaSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                      SizedBox(height:4,),
                                      StreamBuilder<List<AudioBookRecord>>(
                                    stream: queryAudioBookRecord(
                                      queryBuilder: (audioBookRecord) =>
                                          audioBookRecord.where(
                                            'favourite_by',
                                            arrayContains: currentUserReference,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<AudioBookRecord>
                                      gridViewAudioBookRecordList =
                                      snapshot.data!;

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20.0,
                                          mainAxisSpacing: 20.0,
                                          childAspectRatio: 0.6,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                        gridViewAudioBookRecordList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewAudioBookRecord =
                                          gridViewAudioBookRecordList[
                                          gridViewIndex];
                                          return Align(
                                            alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                height: 240.0,
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
                                                      spreadRadius: 10.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: Color(0xFFC25123),
                                                    width: 7.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1.0, -1.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                              Colors
                                                                  .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  Book2Widget
                                                                      .routeName,
                                                                  queryParameters:
                                                                  {
                                                                    'audioDocumnetRef':
                                                                    serializeParam(
                                                                      gridViewAudioBookRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child: Image
                                                                    .network(
                                                                  gridViewAudioBookRecord
                                                                      .bookImage,
                                                                  width: 200.0,
                                                                  height: 180.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  alignment:
                                                                  Alignment(
                                                                      0.0,
                                                                      0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                            child: ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final favouriteByElement =
                                                                    currentUserReference;
                                                                final favouriteByUpdate = gridViewAudioBookRecord
                                                                    .favouriteBy
                                                                    .contains(
                                                                    favouriteByElement)
                                                                    ? FieldValue
                                                                    .arrayRemove([
                                                                  favouriteByElement
                                                                ])
                                                                    : FieldValue
                                                                    .arrayUnion([
                                                                  favouriteByElement
                                                                ]);
                                                                await gridViewAudioBookRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'favourite_by':
                                                                      favouriteByUpdate,
                                                                    },
                                                                  ),
                                                                });
                                                                if (gridViewAudioBookRecord
                                                                    .favouriteBy
                                                                    .contains(
                                                                    currentUserReference) ==
                                                                    true) {
                                                                  await gridViewAudioBookRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favourite_by':
                                                                        FieldValue.arrayRemove([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'हटाया गया'),
                                                                        content:
                                                                        Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                            Text('ठीक है'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  await gridViewAudioBookRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favourite_by':
                                                                        FieldValue.arrayUnion([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'जोड़ा गया'),
                                                                        content:
                                                                        Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                            Text('ठीक है'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              },
                                                              value: gridViewAudioBookRecord
                                                                  .favouriteBy
                                                                  .contains(
                                                                  currentUserReference),
                                                              onIcon: Icon(
                                                                Icons.favorite,
                                                                color: Color(
                                                                    0xFFC25123),
                                                                size: 30.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Color(
                                                                    0xFFC25123),
                                                                size: 32.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                        child: Text(
                                                          gridViewAudioBookRecord
                                                              .bookName,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: 'Gotu',
                                                            color: Color(
                                                                0xFF080808),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                            FontWeight.w900,
                                                            shadows: [
                                                              Shadow(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                                offset: Offset(
                                                                    2.0, 2.0),
                                                                blurRadius: 2.0,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                      SizedBox(height: 4,),
                                      StreamBuilder<List<ChaptersRecord>>(
                                          stream: queryChaptersRecord(
                                            queryBuilder: (chaptersRecord) =>
                                                chaptersRecord.where(
                                              'favourite_by',
                                              arrayContains: currentUserReference,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<Color>(
                                                      FlutterFlowTheme.of(context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ChaptersRecord>
                                                gridViewChaptersRecordList =
                                                snapshot.data!;

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 20.0,
                                                mainAxisSpacing: 20.0,
                                                childAspectRatio: 0.6,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  gridViewChaptersRecordList.length,
                                              itemBuilder: (context, gridViewIndex) {
                                                final gridViewChaptersRecord =
                                                    gridViewChaptersRecordList[
                                                        gridViewIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(0.0, -1.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 237.6,
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
                                                          spreadRadius: 10.0,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(12.0),
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                        color: Color(0xFFC25123),
                                                        width: 7.0,
                                                      ),
                                                    ),
                                                    alignment: AlignmentDirectional(
                                                        0.0, 0.0),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Material(
                                                            color: Colors.transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.only(
                                                                bottomLeft:
                                                                    Radius.circular(
                                                                        10.0),
                                                                bottomRight:
                                                                    Radius.circular(
                                                                        10.0),
                                                                topLeft:
                                                                    Radius.circular(
                                                                        10.0),
                                                                topRight:
                                                                    Radius.circular(
                                                                        10.0),
                                                              ),
                                                            ),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(0xFFF6F5F4),
                                                                    Color(0xFFE7D0C2)
                                                                  ],
                                                                  stops: [0.0, 1.0],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0, -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0, 1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.only(
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10.0),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          10.0),
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10.0),
                                                                  topRight:
                                                                      Radius.circular(
                                                                          10.0),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            20.0,
                                                                            10.0,
                                                                            10.0),
                                                                child: InkWell(
                                                                  splashColor: Colors
                                                                      .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap: () async {
                                                                    context.pushNamed(
                                                                      PlayerCopy2CopyCopyWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'id':
                                                                            serializeParam(
                                                                          gridViewChaptersRecord
                                                                              .id,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'type':
                                                                            serializeParam(
                                                                          'chapters',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'pos':
                                                                            serializeParam(
                                                                          0,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Align(
                                                                        alignment:
                                                                            AlignmentDirectional(
                                                                                0.0,
                                                                                0.0),
                                                                        child: Text(
                                                                          gridViewChaptersRecord
                                                                              .chapterName,
                                                                          style: FlutterFlowTheme.of(
                                                                                  context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                // fontFamily:
                                                                                //     'Gotu',
                                                                                color:
                                                                                    Color(0xFF080808),
                                                                                fontSize:
                                                                                    16.0,
                                                                                letterSpacing:
                                                                                    0.0,
                                                                                fontWeight:
                                                                                    FontWeight.w900,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment:
                                                                            AlignmentDirectional(
                                                                                0.0,
                                                                                0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                                  0.0,
                                                                                  10.0,
                                                                                  0.0,
                                                                                  0.0),
                                                                          child: Text(
                                                                            gridViewChaptersRecord
                                                                                .chapterInfo,
                                                                            textAlign:
                                                                                TextAlign
                                                                                    .center,
                                                                            style: FlutterFlowTheme.of(
                                                                                    context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  fontFamily:
                                                                                      'heders',
                                                                                  color:
                                                                                      Color(0xFF0B0B0B),
                                                                                  fontSize:
                                                                                      15.0,
                                                                                  letterSpacing:
                                                                                      0.0,
                                                                                  fontWeight:
                                                                                      FontWeight.w900,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize.max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0, -1.0),
                                                                  child: ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final favouriteByElement =
                                                                          currentUserReference;
                                                                      final favouriteByUpdate = gridViewChaptersRecord
                                                                              .favouriteBy
                                                                              .contains(
                                                                                  favouriteByElement)
                                                                          ? FieldValue
                                                                              .arrayRemove([
                                                                              favouriteByElement
                                                                            ])
                                                                          : FieldValue
                                                                              .arrayUnion([
                                                                              favouriteByElement
                                                                            ]);
                                                                      await gridViewChaptersRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'favourite_by':
                                                                                favouriteByUpdate,
                                                                          },
                                                                        ),
                                                                      });
                                                                      if (gridViewChaptersRecord
                                                                              .favouriteBy
                                                                              .contains(
                                                                                  currentUserReference) ==
                                                                          true) {
                                                                        await gridViewChaptersRecord
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'favourite_by':
                                                                                  FieldValue.arrayRemove([
                                                                                currentUserReference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'हटाया गया'),
                                                                              content:
                                                                                  Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator.pop(alertDialogContext),
                                                                                  child:
                                                                                      Text('ठीक है'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        await gridViewChaptersRecord
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'favourite_by':
                                                                                  FieldValue.arrayUnion([
                                                                                currentUserReference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'जोड़ा गया'),
                                                                              content:
                                                                                  Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator.pop(alertDialogContext),
                                                                                  child:
                                                                                      Text('ठीक है'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }
                                                                    },
                                                                    value: gridViewChaptersRecord
                                                                        .favouriteBy
                                                                        .contains(
                                                                            currentUserReference),
                                                                    onIcon: Icon(
                                                                      Icons
                                                                          .favorite_outlined,
                                                                      color: Color(
                                                                          0xFFEA1414),
                                                                      size: 30.0,
                                                                    ),
                                                                    offIcon: Icon(
                                                                      Icons
                                                                          .favorite_border,
                                                                      color: Color(
                                                                          0xFFEA1414),
                                                                      size: 30.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      SizedBox(height: 10,),
                                      Align(
                                      alignment: AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 20.0),
                                        child: Text("गैलरी",

                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.alegreyaSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                      SizedBox(height: 8,),
                                      StreamBuilder<List<GurijiJiImageRecord>>(
                                        stream: queryGurijiJiImageRecord(
                                          queryBuilder: (gurijiJiImageRecord) =>
                                              gurijiJiImageRecord.where(
                                                'favorite_by',
                                                arrayContains: currentUserReference,
                                              ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: CircularProgressIndicator(
                                                  valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<GurijiJiImageRecord>
                                          gridViewGurijiJiImageRecordList =
                                          snapshot.data!;

                                          return GridView.builder(

                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 20.0,
                                              mainAxisSpacing: 20.0,
                                              childAspectRatio: 0.6,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                            gridViewGurijiJiImageRecordList
                                                .length,
                                            itemBuilder: (context, gridViewIndex) {
                                              final gridViewGurijiJiImageRecord =
                                              gridViewGurijiJiImageRecordList[
                                              gridViewIndex];
                                              return Material(
                                                color: Colors.transparent,
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25.0),
                                                ),
                                                child: Container(
                                                  //   width: 400,
                                                  // height: 600,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFBF4F7),
                                                    borderRadius: BorderRadius.circular(25.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      // Image with Favorite Icon on top-right
                                                      Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                                            child: InkWell(
                                                              splashColor: Colors.transparent,
                                                              focusColor: Colors.transparent,
                                                              hoverColor: Colors.transparent,
                                                              highlightColor: Colors.transparent,
                                                              onTap: () async {
                                                                print("Id of the image :- ${gridViewGurijiJiImageRecord.id}");
                                                                context.pushNamed(
                                                                  PicturesWidget.routeName,
                                                                  queryParameters: {
                                                                    'currentIndex': serializeParam(
                                                                      gridViewGurijiJiImageRecord.id,
                                                                      ParamType.int,
                                                                    ),
                                                                    'type': serializeParam('gurupic', ParamType.String),
                                                                  }.withoutNulls,
                                                                  extra: <String, dynamic>{
                                                                    kTransitionInfoKey: TransitionInfo(
                                                                      hasTransition: true,
                                                                      transitionType: PageTransitionType.fade,
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              child: Image.network(
                                                                gridViewGurijiJiImageRecord.images,
                                                                width: double.infinity,
                                                                height: 165.7,
                                                                fit: BoxFit.fill,
                                                                alignment: Alignment.center,
                                                                cacheHeight: 400,
                                                              ),
                                                            ),
                                                          ),
                                                          // Favorite Icon
                                                          Positioned(
                                                            top: 8.0,
                                                            right: 8.0,
                                                            child: ToggleIcon(
                                                              onPressed: () async {
                                                                final favoriteByElement = currentUserReference;
                                                                final isFavorite = gridViewGurijiJiImageRecord.favoriteBy.contains(favoriteByElement);

                                                                final favoriteByUpdate = isFavorite
                                                                    ? FieldValue.arrayRemove([favoriteByElement])
                                                                    : FieldValue.arrayUnion([favoriteByElement]);

                                                                await gridViewGurijiJiImageRecord.reference.update({
                                                                  'favorite_by': favoriteByUpdate,
                                                                });

                                                                await showDialog(
                                                                  context: context,
                                                                  builder: (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(isFavorite ? 'हटाया गया' : 'जोड़ा गया'),
                                                                      content: Text(
                                                                        isFavorite
                                                                            ? 'वस्तु को पसंदीदा से हटा दिया गया है।'
                                                                            : 'वस्तु को पसंदीदा में जोड़ा गया है।',
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                          child: Text('ठीक है'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              value: gridViewGurijiJiImageRecord.favoriteBy.contains(currentUserReference),
                                                              onIcon: Icon(Icons.favorite, color: Colors.red, size: 28.0),
                                                              offIcon: Icon(Icons.favorite_border, color: Colors.white, size: 28.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      // Tags Text
                                                      Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Text(
                                                          gridViewGurijiJiImageRecord.tags,
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            // fontFamily: 'Gotu',
                                                            color: Color(0xFFC25123),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                            shadows: [
                                                              Shadow(
                                                                color: Color(0xFFC25123),
                                                                offset: Offset(1.0, 1.0),
                                                                blurRadius: 1.0,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );

                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(height: 8),
                                      StreamBuilder<List<AajKaKnowledgeRecord>>(
                                    stream: queryAajKaKnowledgeRecord(
                                      queryBuilder: (aajKaKnowledgeRecord) =>
                                          aajKaKnowledgeRecord.where(
                                            'favorite_by',
                                            arrayContains: currentUserReference,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<AajKaKnowledgeRecord>
                                      gridViewAajKaKnowledgeRecordList =
                                      snapshot.data!;

                                      return GridView.builder(

                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20.0,
                                          mainAxisSpacing: 20.0,
                                          childAspectRatio: 0.6,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                        gridViewAajKaKnowledgeRecordList
                                            .length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewAajKaKnowledgeRecord =
                                          gridViewAajKaKnowledgeRecordList[
                                          gridViewIndex];
                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            child: Container(
                                              //   width: 400,
                                              // height: 600,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBF4F7),
                                                borderRadius: BorderRadius.circular(25.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  // Image with Favorite Icon on top-right
                                                  Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                                        child: InkWell(
                                                          splashColor: Colors.transparent,
                                                          focusColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          onTap: () async {
                                                            print("Id of the image :- ${gridViewAajKaKnowledgeRecord.id}");
                                                            context.pushNamed(
                                                              PicturesWidget.routeName,
                                                              queryParameters: {
                                                                'currentIndex': serializeParam(
                                                                  gridViewAajKaKnowledgeRecord.id,
                                                                  ParamType.int,
                                                                ),
                                                                'type': serializeParam('aajkagyaan', ParamType.String),
                                                              }.withoutNulls,
                                                              extra: <String, dynamic>{
                                                                kTransitionInfoKey: TransitionInfo(
                                                                  hasTransition: true,
                                                                  transitionType: PageTransitionType.fade,
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Image.network(
                                                            gridViewAajKaKnowledgeRecord.images,
                                                            width: double.infinity,
                                                            height: 165.7,
                                                            fit: BoxFit.fill,
                                                            alignment: Alignment.center,
                                                            cacheHeight: 400,
                                                          ),
                                                        ),
                                                      ),
                                                      // Favorite Icon
                                                      Positioned(
                                                        top: 8.0,
                                                        right: 8.0,
                                                        child: ToggleIcon(
                                                          onPressed: () async {
                                                            final favoriteByElement = currentUserReference;
                                                            final isFavorite = gridViewAajKaKnowledgeRecord.favoriteBy.contains(favoriteByElement);

                                                            final favoriteByUpdate = isFavorite
                                                                ? FieldValue.arrayRemove([favoriteByElement])
                                                                : FieldValue.arrayUnion([favoriteByElement]);

                                                            await gridViewAajKaKnowledgeRecord.reference.update({
                                                              'favorite_by': favoriteByUpdate,
                                                            });

                                                            await showDialog(
                                                              context: context,
                                                              builder: (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(isFavorite ? 'हटाया गया' : 'जोड़ा गया'),
                                                                  content: Text(
                                                                    isFavorite
                                                                        ? 'वस्तु को पसंदीदा से हटा दिया गया है।'
                                                                        : 'वस्तु को पसंदीदा में जोड़ा गया है।',
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                      child: Text('ठीक है'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          value: gridViewAajKaKnowledgeRecord.favoriteBy.contains(currentUserReference),
                                                          onIcon: Icon(Icons.favorite, color: Colors.red, size: 28.0),
                                                          offIcon: Icon(Icons.favorite_border, color: Colors.white, size: 28.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Tags Text
                                                  Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: Text(
                                                      gridViewAajKaKnowledgeRecord.tags,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        // fontFamily: 'Gotu',
                                                        color: Color(0xFFC25123),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w600,
                                                        shadows: [
                                                          Shadow(
                                                            color: Color(0xFFC25123),
                                                            offset: Offset(1.0, 1.0),
                                                            blurRadius: 1.0,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );

                                        },
                                      );
                                    },
                                  ),
                                      SizedBox(height: 8),
                                      StreamBuilder<List<SamtawadKnowledgeRecord>>(
                                    stream: querySamtawadKnowledgeRecord(
                                      queryBuilder: (samtawadKnowledgeRecord) =>
                                          samtawadKnowledgeRecord.where(
                                            'favorite_by',
                                            arrayContains: currentUserReference,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<SamtawadKnowledgeRecord>
                                      gridViewSamtawadKnowledgeRecordList =
                                      snapshot.data!;

                                      return GridView.builder(

                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20.0,
                                          mainAxisSpacing: 20.0,
                                          childAspectRatio: 0.6,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                        gridViewSamtawadKnowledgeRecordList
                                            .length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewSamtawadKnowledgeRecord =
                                          gridViewSamtawadKnowledgeRecordList[
                                          gridViewIndex];
                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            child: Container(
                                              //   width: 400,
                                              // height: 600,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBF4F7),
                                                borderRadius: BorderRadius.circular(25.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  // Image with Favorite Icon on top-right
                                                  Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                                        child: InkWell(
                                                          splashColor: Colors.transparent,
                                                          focusColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          onTap: () async {
                                                            print("Id of the image :- ${gridViewSamtawadKnowledgeRecord.id}");
                                                            context.pushNamed(
                                                              PicturesWidget.routeName,
                                                              queryParameters: {
                                                                'currentIndex': serializeParam(
                                                                  gridViewSamtawadKnowledgeRecord.id,
                                                                  ParamType.int,
                                                                ),
                                                                'type': serializeParam('samtawadGallery', ParamType.String),
                                                              }.withoutNulls,
                                                              extra: <String, dynamic>{
                                                                kTransitionInfoKey: TransitionInfo(
                                                                  hasTransition: true,
                                                                  transitionType: PageTransitionType.fade,
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Image.network(
                                                            gridViewSamtawadKnowledgeRecord.images,
                                                            width: double.infinity,
                                                            height: 165.7,
                                                            fit: BoxFit.fill,
                                                            alignment: Alignment.center,
                                                            cacheHeight: 400,
                                                          ),
                                                        ),
                                                      ),
                                                      // Favorite Icon
                                                      Positioned(
                                                        top: 8.0,
                                                        right: 8.0,
                                                        child: ToggleIcon(
                                                          onPressed: () async {
                                                            final favoriteByElement = currentUserReference;
                                                            final isFavorite = gridViewSamtawadKnowledgeRecord.favoriteBy.contains(favoriteByElement);

                                                            final favoriteByUpdate = isFavorite
                                                                ? FieldValue.arrayRemove([favoriteByElement])
                                                                : FieldValue.arrayUnion([favoriteByElement]);

                                                            await gridViewSamtawadKnowledgeRecord.reference.update({
                                                              'favorite_by': favoriteByUpdate,
                                                            });

                                                            await showDialog(
                                                              context: context,
                                                              builder: (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(isFavorite ? 'हटाया गया' : 'जोड़ा गया'),
                                                                  content: Text(
                                                                    isFavorite
                                                                        ? 'वस्तु को पसंदीदा से हटा दिया गया है।'
                                                                        : 'वस्तु को पसंदीदा में जोड़ा गया है।',
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                      child: Text('ठीक है'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          value: gridViewSamtawadKnowledgeRecord.favoriteBy.contains(currentUserReference),
                                                          onIcon: Icon(Icons.favorite, color: Colors.red, size: 28.0),
                                                          offIcon: Icon(Icons.favorite_border, color: Colors.white, size: 28.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Tags Text
                                                  Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: Text(
                                                      gridViewSamtawadKnowledgeRecord.tags,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        // fontFamily: 'Gotu',
                                                        color: Color(0xFFC25123),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w600,
                                                        shadows: [
                                                          Shadow(
                                                            color: Color(0xFFC25123),
                                                            offset: Offset(1.0, 1.0),
                                                            blurRadius: 1.0,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );

                                        },
                                      );
                                    },
                                  ),
                                ],
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
                child: wrapWithModel(
                  model: _model.footrModel,
                  updateCallback: () => safeSetState(() {}),
                  child: FootrWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
