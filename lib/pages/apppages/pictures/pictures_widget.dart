import 'package:samtawad_team/custom_code/widgets/now_playing_bar.dart' as custom_widgets;

import '../../popupcomponent/firestlogin/firestlogin_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'pictures_model.dart';
export 'pictures_model.dart';

class PicturesWidget extends StatefulWidget {
  const PicturesWidget({
    super.key,
    required this.currentIndex,
    required this.type,
  });

  final int? currentIndex;
  final String? type;

  static String routeName = 'Pictures';
  static String routePath = '/pictures';

  @override
  State<PicturesWidget> createState() => _PicturesWidgetState();
}

class _PicturesWidgetState extends State<PicturesWidget> {
  late PicturesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? currentIndexLocal;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PicturesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.intexNumber = widget!.currentIndex!;
      safeSetState(() {});
      FFAppState().currentPage = 9;
      currentIndexLocal = widget.currentIndex;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _pageController?.dispose();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                          'tnxgpdti' /* "प्रभु सत् आचरण और नि:चल बुद्ध... */,
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
                            'ycsy79tv' /* आशीर्वाद ---- महात्मा मंगत राम... */,
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
                            'nxhwbauw' /* 1903-1954 */,
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
                                  'ybplw2x6' /* घर */,
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
                                  '01xikqah' /* जीवन और साधना */,
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
                                  '3ks00fqd' /* शिष्य का कर्तव्य */,
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
                                0,
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
                                  'scebxu78' /*  वाणी ,सत्संग और ऑडियो बुक */,
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
                                  'm75q9uh3' /* गुरुदेव की तस्वीरें और फ़ोटो */,
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
                                  '3mu6ktbb' /* पसंदीदा */,
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
                                  'nslbyy1k' /* संवाद */,
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
                                  'hn7pqykw' /* उपयोगकर्ता रूपरेखा */,
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
                                  '38t0e0o9' /* लॉगआउट */,
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
                                                            'bvf5imhn' /* समता अपार शक्ति */,
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
                                                          'or6cy1f8' /* ॐ ब्रह्म सत्यम सर्वाधार */,
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
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (widget!.type == 'gurupic')
                        Expanded(             
                          child: StreamBuilder<List<GurijiJiImageRecord>>(
                            stream: queryGurijiJiImageRecord(),
                            builder: (context, snapshot) {
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
                              List<GurijiJiImageRecord> pageViewGurijiJiImageRecordList = snapshot.data!;
                              // 🔥 Find correct index using ID
                              int initialPage = pageViewGurijiJiImageRecordList.indexWhere(
                                    (image) => image.id == widget.currentIndex,
                              );
                              if (initialPage == -1) {
                                initialPage = 0;
                              }

                              final pageController = PageController(initialPage: initialPage);

                              return Container(
                                width: double.infinity,
                                height: 650.4,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                  child: PageView.builder(
                                    controller: pageController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pageViewGurijiJiImageRecordList.length,
                                    itemBuilder: (context, pageViewIndex) {
                                      final pageViewGurijiJiImageRecord = pageViewGurijiJiImageRecordList[pageViewIndex];
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 8.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(16.0),
                                                      bottomRight: Radius.circular(16.0),
                                                      topLeft: Radius.circular(16.0),
                                                      topRight: Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                        
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF5A4545),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color: Color(0x33000000),
                                                          offset: Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(16.0),
                                                        bottomRight: Radius.circular(16.0),
                                                        topLeft: Radius.circular(16.0),
                                                        topRight: Radius.circular(16.0),
                                                      ),
                                                      border: Border.all(width: 2.0),
                                                    ),
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type: PageTransitionType.fade,
                                                              child: FlutterFlowExpandedImageView(
                                                                image: Image.network(
                                                                  pageViewGurijiJiImageRecord.images,
                                                                  fit: BoxFit.contain,
                                                                  alignment: Alignment(0.0, 0.0),
                                                                  // cacheHeight: 300,
                                                                ),
                                                                allowRotation: false,
                                                                tag: pageViewGurijiJiImageRecord.images,
                                                                useHeroAnimation: true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: pageViewGurijiJiImageRecord.images,
                                                          transitionOnUserGestures: true,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                              bottomLeft: Radius.circular(16.0),
                                                              bottomRight: Radius.circular(16.0),
                                                              topLeft: Radius.circular(16.0),
                                                              topRight: Radius.circular(16.0),
                                                            ),
                                                            child: Image.network(
                                                              pageViewGurijiJiImageRecord.images,
                                                              width: double.infinity,
                                                              height: 300,
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment(0.0, 0.0),
                                                              cacheHeight: 400,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                              child: Stack(
                                                children: [
                                                  Opacity(
                                                    opacity: 0.8,
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.0, 0.76),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
                                                            height: 65.8,
                                                            decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
                                                                stops: [0.0, 1.0],
                                                                begin: AlignmentDirectional(0.0, -1.0),
                                                                end: AlignmentDirectional(0, 1.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: AlignmentDirectional(0.0, 1.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 65.8,
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF6DBB0),
                                                                      Color(
                                                                          0xFF9C7F4F)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      5.0),
                                                                  child:
                                                                  InkWell(
                                                                    splashColor:
                                                                    Colors
                                                                        .transparent,
                                                                    focusColor:
                                                                    Colors
                                                                        .transparent,
                                                                    hoverColor:
                                                                    Colors
                                                                        .transparent,
                                                                    highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await downloadFile(
                                                                        filename:
                                                                        pageViewGurijiJiImageRecord.tags,
                                                                        url: pageViewGurijiJiImageRecord
                                                                            .imageUrl,
                                                                      );
                                                                    },
                                                                    child:
                                                                    Icon(
                                                                      Icons
                                                                          .file_download_outlined,
                                                                      color: Color(
                                                                          0xFFB44617),
                                                                      size:
                                                                      28.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF3C9CF),
                                                                      Color(
                                                                          0xFFD26679)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    if(FFAppState().islogin)
                                                                    {
                                                                      final favoriteByElement =
                                                                          currentUserReference;
                                                                      final favoriteByUpdate = pageViewGurijiJiImageRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                          favoriteByElement)
                                                                          ? FieldValue
                                                                          .arrayRemove(
                                                                          [
                                                                            favoriteByElement
                                                                          ])
                                                                          : FieldValue
                                                                          .arrayUnion(
                                                                          [
                                                                            favoriteByElement
                                                                          ]);
                                                                      await pageViewGurijiJiImageRecord
                                                                          .reference
                                                                          .update(
                                                                          {
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'favorite_by':
                                                                                favoriteByUpdate,
                                                                              },
                                                                            ),
                                                                          });
                                                                      if (pageViewGurijiJiImageRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                          currentUserReference) ==
                                                                          true) {
                                                                        await pageViewGurijiJiImageRecord
                                                                            .reference
                                                                            .update(
                                                                            {
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'favorite_by': FieldValue
                                                                                      .arrayRemove(
                                                                                      [
                                                                                        currentUserReference
                                                                                      ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                        await showDialog(
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (
                                                                              alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'हटाया गया'),
                                                                              content: Text(
                                                                                  'वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator
                                                                                          .pop(
                                                                                          alertDialogContext),
                                                                                  child: Text(
                                                                                      'ठीक है'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        await pageViewGurijiJiImageRecord
                                                                            .reference
                                                                            .update(
                                                                            {
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'favorite_by': FieldValue
                                                                                      .arrayUnion(
                                                                                      [
                                                                                        currentUserReference
                                                                                      ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                        await showDialog(
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (
                                                                              alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'जोड़ा गया'),
                                                                              content: Text(
                                                                                  'वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator
                                                                                          .pop(
                                                                                          alertDialogContext),
                                                                                  child: Text(
                                                                                      'ठीक है'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }
                                                                    }
                                                                    else{
                                                                      await showModalBottomSheet(
                                                                        context: context,
                                                                        isScrollControlled: true,
                                                                        backgroundColor: Colors.transparent,
                                                                        builder: (context) => const FirestloginWidget(),
                                                                      );
                                                                    }
                                                                  },
                                        
                                                                  value: pageViewGurijiJiImageRecord
                                                                      .favoriteBy
                                                                      .contains(
                                                                      currentUserReference),
                                                                  onIcon:
                                                                  Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Color(
                                                                        0xFFBA2427),
                                                                    size:
                                                                    28.0,
                                                                  ),
                                                                  offIcon:
                                                                  Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: Color(
                                                                        0xFFBA2427),
                                                                    size:
                                                                    28.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF6DBB0),
                                                                      Color(
                                                                          0xFF9C7F4F)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child:
                                                                        InkWell(
                                                                          splashColor:
                                                                          Colors.transparent,
                                                                          focusColor:
                                                                          Colors.transparent,
                                                                          hoverColor:
                                                                          Colors.transparent,
                                                                          highlightColor:
                                                                          Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await Share
                                                                                .share(
                                                                              pageViewGurijiJiImageRecord.imageUrl,
                                                                              sharePositionOrigin:
                                                                              getWidgetBoundingBox(context),
                                                                            );
                                                                          },
                                                                          child:
                                                                          Icon(
                                                                            Icons
                                                                                .share,
                                                                            color:
                                                                            Color(0xFFB44617),
                                                                            size:
                                                                            28.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          // Download button
                                                          // Favorite button
                                                          // Share button
                                                          // (Keep your existing logic here exactly as it is)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                              child: Text(
                                                pageViewGurijiJiImageRecord.tags,
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Gotu',
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
                                            Container(
                                              width: double.infinity,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFC25123),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                child: Text(
                                                  pageViewGurijiJiImageRecord.information,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Gotu',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (widget!.type == 'ashramgallery')
                        Expanded(             
                          child: StreamBuilder<List<AshramGalleryRecord>>(
                            stream: queryAshramGalleryRecord(),
                            builder: (context, snapshot) {
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
                              List<AshramGalleryRecord> pageViewAshramGalleryRecordList = snapshot.data!;

                              // 🔥 Find correct index using ID
                              int initialPage = pageViewAshramGalleryRecordList.indexWhere(
                                    (image) => image.id == widget.currentIndex,
                              );
                              if (initialPage == -1) {
                                initialPage = 0;
                              }

                              final pageController = PageController(initialPage: initialPage);

                              return Container(
                                width: double.infinity,
                                height: 650.4,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                  child: PageView.builder(
                                    controller: pageController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pageViewAshramGalleryRecordList.length,
                                    itemBuilder: (context, pageViewIndex) {
                                      final pageViewGurijiJiImageRecord = pageViewAshramGalleryRecordList[pageViewIndex];
                                      return SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 8.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(16.0),
                                                      bottomRight: Radius.circular(16.0),
                                                      topLeft: Radius.circular(16.0),
                                                      topRight: Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF5A4545),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color: Color(0x33000000),
                                                          offset: Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(16.0),
                                                        bottomRight: Radius.circular(16.0),
                                                        topLeft: Radius.circular(16.0),
                                                        topRight: Radius.circular(16.0),
                                                      ),
                                                      border: Border.all(width: 2.0),
                                                    ),
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type: PageTransitionType.fade,
                                                              child: FlutterFlowExpandedImageView(
                                                                image: Image.network(
                                                                  pageViewGurijiJiImageRecord.image,
                                                                  fit: BoxFit.contain,
                                                                  alignment: Alignment(0.0, 0.0),
                                                                  cacheHeight: 400,
                                                                ),
                                                                allowRotation: false,
                                                                tag: pageViewGurijiJiImageRecord.image,
                                                                useHeroAnimation: true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: pageViewGurijiJiImageRecord.image,
                                                          transitionOnUserGestures: true,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                              bottomLeft: Radius.circular(16.0),
                                                              bottomRight: Radius.circular(16.0),
                                                              topLeft: Radius.circular(16.0),
                                                              topRight: Radius.circular(16.0),
                                                            ),
                                                            child: Image.network(
                                                              pageViewGurijiJiImageRecord.image,
                                                              width: double.infinity,
                                                              height: 300.8,
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment(0.0, 0.0),
                                                              cacheHeight: 400,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                              child: Stack(
                                                children: [
                                                  Opacity(
                                                    opacity: 0.8,
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.0, 0.76),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
                                                            height: 65.8,
                                                            decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
                                                                stops: [0.0, 1.0],
                                                                begin: AlignmentDirectional(0.0, -1.0),
                                                                end: AlignmentDirectional(0, 1.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: AlignmentDirectional(0.0, 1.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 65.8,
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF6DBB0),
                                                                      Color(
                                                                          0xFF9C7F4F)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      5.0),
                                                                  child:
                                                                  InkWell(
                                                                    splashColor:
                                                                    Colors
                                                                        .transparent,
                                                                    focusColor:
                                                                    Colors
                                                                        .transparent,
                                                                    hoverColor:
                                                                    Colors
                                                                        .transparent,
                                                                    highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await downloadFile(
                                                                        filename:
                                                                        pageViewGurijiJiImageRecord.tags,
                                                                        url: pageViewGurijiJiImageRecord
                                                                            .imageUrl,
                                                                      );
                                                                    },
                                                                    child:
                                                                    Icon(
                                                                      Icons
                                                                          .file_download_outlined,
                                                                      color: Color(
                                                                          0xFFB44617),
                                                                      size:
                                                                      38.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF3C9CF),
                                                                      Color(
                                                                          0xFFD26679)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                      if(FFAppState().islogin){


                                      final favoriteByElement =
                                      currentUserReference;
                                      final favoriteByUpdate = pageViewGurijiJiImageRecord
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
                                      await pageViewGurijiJiImageRecord
                                          .reference
                                          .update({
                                      ...mapToFirestore(
                                      {
                                      'favorite_by':
                                      favoriteByUpdate,
                                      },
                                      ),
                                      });
                                      if (pageViewGurijiJiImageRecord
                                          .favoriteBy
                                          .contains(currentUserReference) ==
                                      true) {
                                      await pageViewGurijiJiImageRecord
                                          .reference
                                          .update({
                                      ...mapToFirestore(
                                      {
                                      'favorite_by': FieldValue.arrayRemove([
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
                                      title: Text('हटाया गया'),
                                      content: Text('वस्तु को पसंदीदा से हटा दिया गया है।'),
                                      actions: [
                                      TextButton(
                                      onPressed: () => Navigator.pop(alertDialogContext),
                                      child: Text('ठीक है'),
                                      ),
                                      ],
                                      );
                                      },
                                      );
                                      } else {
                                      await pageViewGurijiJiImageRecord
                                          .reference
                                          .update({
                                      ...mapToFirestore(
                                      {
                                      'favorite_by': FieldValue.arrayUnion([
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
                                      title: Text('जोड़ा गया'),
                                      content: Text('वस्तु को पसंदीदा में जोड़ा गया है।'),
                                      actions: [
                                      TextButton(
                                      onPressed: () => Navigator.pop(alertDialogContext),
                                      child: Text('ठीक है'),
                                      ),
                                      ],
                                      );
                                      },
                                      );
                                      }
                                      }
                                      else{
                                        await showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) => const FirestloginWidget(),
                                        );
                                      }
                                      },
                                                                  value: pageViewGurijiJiImageRecord
                                                                      .favoriteBy
                                                                      .contains(
                                                                      currentUserReference),
                                                                  onIcon:
                                                                  Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Color(
                                                                        0xFFBA2427),
                                                                    size:
                                                                    32.0,
                                                                  ),
                                                                  offIcon:
                                                                  Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: Color(
                                                                        0xFFBA2427),
                                                                    size:
                                                                    32.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF6DBB0),
                                                                      Color(
                                                                          0xFF9C7F4F)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child:
                                                                        InkWell(
                                                                          splashColor:
                                                                          Colors.transparent,
                                                                          focusColor:
                                                                          Colors.transparent,
                                                                          hoverColor:
                                                                          Colors.transparent,
                                                                          highlightColor:
                                                                          Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await Share
                                                                                .share(
                                                                              pageViewGurijiJiImageRecord.imageUrl,
                                                                              sharePositionOrigin:
                                                                              getWidgetBoundingBox(context),
                                                                            );
                                                                          },
                                                                          child:
                                                                          Icon(
                                                                            Icons
                                                                                .share,
                                                                            color:
                                                                            Color(0xFFB44617),
                                                                            size:
                                                                            35.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          // Download button
                                                          // Favorite button
                                                          // Share button
                                                          // (Keep your existing logic here exactly as it is)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                              child: Text(
                                                pageViewGurijiJiImageRecord.tags,
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Gotu',
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
                                            Container(
                                              width: double.infinity,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFC25123),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                child: Text(
                                                  pageViewGurijiJiImageRecord.information,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Gotu',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      if (widget!.type == 'aajkagyaan')
                        Expanded(             
                          child: StreamBuilder<List<AajKaKnowledgeRecord>>(
                            stream: queryAajKaKnowledgeRecord(),
                            builder: (context, snapshot) {
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
                              List<AajKaKnowledgeRecord> pageViewAajKaKnowledgeRecordList = snapshot.data!;

                              // 🔥 Find correct index using ID
                              int initialPage = pageViewAajKaKnowledgeRecordList.indexWhere(
                                    (image) => image.id == widget.currentIndex,
                              );
                              if (initialPage == -1) {
                                initialPage = 0;
                              }

                              final pageController = PageController(initialPage: initialPage);

                              return Container(
                                width: double.infinity,
                                height: 650.4,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                  child: PageView.builder(
                                    controller: pageController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pageViewAajKaKnowledgeRecordList.length,
                                    itemBuilder: (context, pageViewIndex) {
                                      final pageViewAajKaKnowledgeRecord = pageViewAajKaKnowledgeRecordList[pageViewIndex];
                                      return SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 8.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(16.0),
                                                      bottomRight: Radius.circular(16.0),
                                                      topLeft: Radius.circular(16.0),
                                                      topRight: Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF5A4545),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color: Color(0x33000000),
                                                          offset: Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(16.0),
                                                        bottomRight: Radius.circular(16.0),
                                                        topLeft: Radius.circular(16.0),
                                                        topRight: Radius.circular(16.0),
                                                      ),
                                                      border: Border.all(width: 2.0),
                                                    ),
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type: PageTransitionType.fade,
                                                              child: FlutterFlowExpandedImageView(
                                                                image: Image.network(
                                                                  pageViewAajKaKnowledgeRecord.images,
                                                                  fit: BoxFit.contain,
                                                                  alignment: Alignment(0.0, 0.0),
                                                                  cacheHeight: 400,
                                                                ),
                                                                allowRotation: false,
                                                                tag: pageViewAajKaKnowledgeRecord.images,
                                                                useHeroAnimation: true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: pageViewAajKaKnowledgeRecord.images,
                                                          transitionOnUserGestures: true,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                              bottomLeft: Radius.circular(16.0),
                                                              bottomRight: Radius.circular(16.0),
                                                              topLeft: Radius.circular(16.0),
                                                              topRight: Radius.circular(16.0),
                                                            ),
                                                            child: Image.network(
                                                              pageViewAajKaKnowledgeRecord.images,
                                                              width: double.infinity,
                                                              height: 300.8,
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment(0.0, 0.0),
                                                              cacheHeight: 400,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                              child: Stack(
                                                children: [
                                                  Opacity(
                                                    opacity: 0.8,
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.0, 0.76),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
                                                            height: 65.8,
                                                            decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
                                                                stops: [0.0, 1.0],
                                                                begin: AlignmentDirectional(0.0, -1.0),
                                                                end: AlignmentDirectional(0, 1.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: AlignmentDirectional(0.0, 1.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 65.8,
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF6DBB0),
                                                                      Color(
                                                                          0xFF9C7F4F)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      5.0),
                                                                  child:
                                                                  InkWell(
                                                                    splashColor:
                                                                    Colors
                                                                        .transparent,
                                                                    focusColor:
                                                                    Colors
                                                                        .transparent,
                                                                    hoverColor:
                                                                    Colors
                                                                        .transparent,
                                                                    highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await downloadFile(
                                                                        filename:
                                                                        pageViewAajKaKnowledgeRecord.tags,
                                                                        url: pageViewAajKaKnowledgeRecord
                                                                            .imageUrl,
                                                                      );
                                                                    },
                                                                    child:
                                                                    Icon(
                                                                      Icons
                                                                          .file_download_outlined,
                                                                      color: Color(
                                                                          0xFFB44617),
                                                                      size:
                                                                      38.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF3C9CF),
                                                                      Color(
                                                                          0xFFD26679)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    if(FFAppState().islogin) {
                                                                      final favoriteByElement =
                                                                          currentUserReference;
                                                                      final favoriteByUpdate = pageViewAajKaKnowledgeRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                          favoriteByElement)
                                                                          ? FieldValue
                                                                          .arrayRemove(
                                                                          [
                                                                            favoriteByElement
                                                                          ])
                                                                          : FieldValue
                                                                          .arrayUnion(
                                                                          [
                                                                            favoriteByElement
                                                                          ]);
                                                                      await pageViewAajKaKnowledgeRecord
                                                                          .reference
                                                                          .update(
                                                                          {
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'favorite_by':
                                                                                favoriteByUpdate,
                                                                              },
                                                                            ),
                                                                          });
                                                                      if (pageViewAajKaKnowledgeRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                          currentUserReference) ==
                                                                          true) {
                                                                        await pageViewAajKaKnowledgeRecord
                                                                            .reference
                                                                            .update(
                                                                            {
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'favorite_by': FieldValue
                                                                                      .arrayRemove(
                                                                                      [
                                                                                        currentUserReference
                                                                                      ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                        await showDialog(
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (
                                                                              alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'हटाया गया'),
                                                                              content: Text(
                                                                                  'वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator
                                                                                          .pop(
                                                                                          alertDialogContext),
                                                                                  child: Text(
                                                                                      'ठीक है'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        await pageViewAajKaKnowledgeRecord
                                                                            .reference
                                                                            .update(
                                                                            {
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'favorite_by': FieldValue
                                                                                      .arrayUnion(
                                                                                      [
                                                                                        currentUserReference
                                                                                      ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                        await showDialog(
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (
                                                                              alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'जोड़ा गया'),
                                                                              content: Text(
                                                                                  'वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator
                                                                                          .pop(
                                                                                          alertDialogContext),
                                                                                  child: Text(
                                                                                      'ठीक है'),
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
                                                                  value: pageViewAajKaKnowledgeRecord
                                                                      .favoriteBy
                                                                      .contains(
                                                                      currentUserReference),
                                                                  onIcon:
                                                                  Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Color(
                                                                        0xFFBA2427),
                                                                    size:
                                                                    32.0,
                                                                  ),
                                                                  offIcon:
                                                                  Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: Color(
                                                                        0xFFBA2427),
                                                                    size:
                                                                    32.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF6DBB0),
                                                                      Color(
                                                                          0xFF9C7F4F)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child:
                                                                        InkWell(
                                                                          splashColor:
                                                                          Colors.transparent,
                                                                          focusColor:
                                                                          Colors.transparent,
                                                                          hoverColor:
                                                                          Colors.transparent,
                                                                          highlightColor:
                                                                          Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await Share
                                                                                .share(
                                                                              pageViewAajKaKnowledgeRecord.imageUrl,
                                                                              sharePositionOrigin:
                                                                              getWidgetBoundingBox(context),
                                                                            );
                                                                          },
                                                                          child:
                                                                          Icon(
                                                                            Icons
                                                                                .share,
                                                                            color:
                                                                            Color(0xFFB44617),
                                                                            size:
                                                                            35.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          // Download button
                                                          // Favorite button
                                                          // Share button
                                                          // (Keep your existing logic here exactly as it is)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                              child: Text(
                                                pageViewAajKaKnowledgeRecord.tags,
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Gotu',
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
                                            Container(
                                              width: double.infinity,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFC25123),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                child: Text(
                                                  pageViewAajKaKnowledgeRecord.information,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Gotu',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      if (widget!.type == 'samtawadGallery')
                        Expanded(             
                          child: StreamBuilder<List<SamtawadKnowledgeRecord>>(
                            stream: querySamtawadKnowledgeRecord(),
                            builder: (context, snapshot) {
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
                              List<SamtawadKnowledgeRecord> pageViewSamtawadKnowledgeRecordList = snapshot.data!;

                              // 🔥 Find correct index using ID
                              int initialPage = pageViewSamtawadKnowledgeRecordList.indexWhere(
                                    (image) => image.id == widget.currentIndex,
                              );
                              if (initialPage == -1) {
                                initialPage = 0;
                              }

                              final pageController = PageController(initialPage: initialPage);

                              return Container(
                                width: double.infinity,
                                height: 650.4,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                  child: PageView.builder(
                                    controller: pageController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pageViewSamtawadKnowledgeRecordList.length,
                                    itemBuilder: (context, pageViewIndex) {
                                      final pageViewSamtawadKnowledgeRecord = pageViewSamtawadKnowledgeRecordList[pageViewIndex];
                                      return SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 8.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(16.0),
                                                      bottomRight: Radius.circular(16.0),
                                                      topLeft: Radius.circular(16.0),
                                                      topRight: Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF5A4545),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color: Color(0x33000000),
                                                          offset: Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(16.0),
                                                        bottomRight: Radius.circular(16.0),
                                                        topLeft: Radius.circular(16.0),
                                                        topRight: Radius.circular(16.0),
                                                      ),
                                                      border: Border.all(width: 2.0),
                                                    ),
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type: PageTransitionType.fade,
                                                              child: FlutterFlowExpandedImageView(
                                                                image: Image.network(
                                                                  pageViewSamtawadKnowledgeRecord.images,
                                                                  fit: BoxFit.contain,
                                                                  alignment: Alignment(0.0, 0.0),
                                                                  cacheHeight: 400,
                                                                ),
                                                                allowRotation: false,
                                                                tag: pageViewSamtawadKnowledgeRecord.images,
                                                                useHeroAnimation: true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: pageViewSamtawadKnowledgeRecord.images,
                                                          transitionOnUserGestures: true,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                              bottomLeft: Radius.circular(16.0),
                                                              bottomRight: Radius.circular(16.0),
                                                              topLeft: Radius.circular(16.0),
                                                              topRight: Radius.circular(16.0),
                                                            ),
                                                            child: Image.network(
                                                              pageViewSamtawadKnowledgeRecord.images,
                                                              width: double.infinity,
                                                              height: 300.8,
                                                              fit: BoxFit.fill,
                                                              alignment: Alignment(0.0, 0.0),
                                                              cacheHeight: 400,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                              child: Stack(
                                                children: [
                                                  Opacity(
                                                    opacity: 0.8,
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.0, 0.76),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
                                                            height: 65.8,
                                                            decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                colors: [Color(0xFFF8DEB5), Color(0xFFE7ECEC)],
                                                                stops: [0.0, 1.0],
                                                                begin: AlignmentDirectional(0.0, -1.0),
                                                                end: AlignmentDirectional(0, 1.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: AlignmentDirectional(0.0, 1.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 65.8,
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF6DBB0),
                                                                      Color(
                                                                          0xFF9C7F4F)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      5.0),
                                                                  child:
                                                                  InkWell(
                                                                    splashColor:
                                                                    Colors
                                                                        .transparent,
                                                                    focusColor:
                                                                    Colors
                                                                        .transparent,
                                                                    hoverColor:
                                                                    Colors
                                                                        .transparent,
                                                                    highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await downloadFile(
                                                                        filename:
                                                                        pageViewSamtawadKnowledgeRecord.tags,
                                                                        url: pageViewSamtawadKnowledgeRecord
                                                                            .imageUrl,
                                                                      );
                                                                    },
                                                                    child:
                                                                    Icon(
                                                                      Icons
                                                                          .file_download_outlined,
                                                                      color: Color(
                                                                          0xFFB44617),
                                                                      size:
                                                                      38.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF3C9CF),
                                                                      Color(
                                                                          0xFFD26679)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    if(FFAppState().islogin) {
                                                                      final favoriteByElement =
                                                                          currentUserReference;
                                                                      final favoriteByUpdate = pageViewSamtawadKnowledgeRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                          favoriteByElement)
                                                                          ? FieldValue
                                                                          .arrayRemove(
                                                                          [
                                                                            favoriteByElement
                                                                          ])
                                                                          : FieldValue
                                                                          .arrayUnion(
                                                                          [
                                                                            favoriteByElement
                                                                          ]);
                                                                      await pageViewSamtawadKnowledgeRecord
                                                                          .reference
                                                                          .update(
                                                                          {
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'favorite_by':
                                                                                favoriteByUpdate,
                                                                              },
                                                                            ),
                                                                          });
                                                                      if (pageViewSamtawadKnowledgeRecord
                                                                          .favoriteBy
                                                                          .contains(
                                                                          currentUserReference) ==
                                                                          true) {
                                                                        await pageViewSamtawadKnowledgeRecord
                                                                            .reference
                                                                            .update(
                                                                            {
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'favorite_by': FieldValue
                                                                                      .arrayRemove(
                                                                                      [
                                                                                        currentUserReference
                                                                                      ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                        await showDialog(
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (
                                                                              alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'हटाया गया'),
                                                                              content: Text(
                                                                                  'वस्तु को पसंदीदा से हटा दिया गया है।'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator
                                                                                          .pop(
                                                                                          alertDialogContext),
                                                                                  child: Text(
                                                                                      'ठीक है'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        await pageViewSamtawadKnowledgeRecord
                                                                            .reference
                                                                            .update(
                                                                            {
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'favorite_by': FieldValue
                                                                                      .arrayUnion(
                                                                                      [
                                                                                        currentUserReference
                                                                                      ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                        await showDialog(
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (
                                                                              alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'जोड़ा गया'),
                                                                              content: Text(
                                                                                  'वस्तु को पसंदीदा में जोड़ा गया है।'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator
                                                                                          .pop(
                                                                                          alertDialogContext),
                                                                                  child: Text(
                                                                                      'ठीक है'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }
                                                                    }
                                                                    else{
                                                                      await showModalBottomSheet(
                                                                        context: context,
                                                                        isScrollControlled: true,
                                                                        backgroundColor: Colors.transparent,
                                                                        builder: (context) => const FirestloginWidget(),
                                                                      ).then((value) => safeSetState(() {}));
                                                                    };
                                                                  },
                                                                  value: pageViewSamtawadKnowledgeRecord
                                                                      .favoriteBy
                                                                      .contains(
                                                                      currentUserReference),
                                                                  onIcon:
                                                                  Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Color(
                                                                        0xFFBA2427),
                                                                    size:
                                                                    32.0,
                                                                  ),
                                                                  offIcon:
                                                                  Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: Color(
                                                                        0xFFBA2427),
                                                                    size:
                                                                    32.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      25.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      25.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      25.0),
                                                                ),
                                                              ),
                                                              child:
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                      4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                      Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFF6DBB0),
                                                                      Color(
                                                                          0xFF9C7F4F)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0,
                                                                        1.0),
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        25.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child:
                                                                        InkWell(
                                                                          splashColor:
                                                                          Colors.transparent,
                                                                          focusColor:
                                                                          Colors.transparent,
                                                                          hoverColor:
                                                                          Colors.transparent,
                                                                          highlightColor:
                                                                          Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await Share
                                                                                .share(
                                                                              pageViewSamtawadKnowledgeRecord.imageUrl,
                                                                              sharePositionOrigin:
                                                                              getWidgetBoundingBox(context),
                                                                            );
                                                                          },
                                                                          child:
                                                                          Icon(
                                                                            Icons
                                                                                .share,
                                                                            color:
                                                                            Color(0xFFB44617),
                                                                            size:
                                                                            35.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          // Download button
                                                          // Favorite button
                                                          // Share button
                                                          // (Keep your existing logic here exactly as it is)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                              child: Text(
                                                pageViewSamtawadKnowledgeRecord.tags,
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Gotu',
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
                                            Container(
                                              width: double.infinity,
                                              height: 3.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFC25123),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                child: Text(
                                                  pageViewSamtawadKnowledgeRecord.information,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Gotu',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 90.0, // Adjust to sit above bottom navigation
                right: 16.0,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: custom_widgets.NowPlayingBar(
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Opacity(
                    //   opacity: 0.9,
                    //   child: Align(
                    //     alignment: AlignmentDirectional(0.0, 1.0),
                    //     child: Container(
                    //       width: double.infinity,
                    //       height: 70.0,
                    //       child: custom_widgets.NowPlayingBar(
                    //         width: double.infinity,
                    //         height: 70.0,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    wrapWithModel(
                      model: _model.footrModel,
                      updateCallback: () => safeSetState(() {}),
                      child: FootrWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
