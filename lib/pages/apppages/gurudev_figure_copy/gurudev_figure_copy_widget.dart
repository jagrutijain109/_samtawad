import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'gurudev_figure_copy_model.dart';
export 'gurudev_figure_copy_model.dart';

class GurudevFigureCopyWidget extends StatefulWidget {
  const GurudevFigureCopyWidget({super.key});

  static String routeName = 'gurudev_figureCopy';
  static String routePath = '/gurudevFigureCopy';

  @override
  State<GurudevFigureCopyWidget> createState() =>
      _GurudevFigureCopyWidgetState();
}

class _GurudevFigureCopyWidgetState extends State<GurudevFigureCopyWidget>
    with TickerProviderStateMixin {
  late GurudevFigureCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GurudevFigureCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.searchGuruPicture = false;
      _model.searchAajKnow = false;
      _model.samtawadKnow = false;
      _model.searchAashramGal = false;
      safeSetState(() {});
      FFAppState().currentPage = 9;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

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
                          '634tr41l' /* "प्रभु सत् आचरण और नि:चल बुद्ध... */,
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
                            'vcju4vpi' /* -- महात्मा मंगत राम जी महाराज */,
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
                            'pbwjgomg' /* 1903-1954 */,
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
                                  'et64cpno' /* घर */,
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
                                  '0huonsj6' /* जीवन और साधना */,
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
                                  'pbgumnz9' /* शिष्य का कर्तव्य */,
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
                                  '9pnkxp8g' /*  वाणी ,सत्संग और ऑडियो बुक */,
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
                                  '7lu0dtup' /* गुरुदेव की तस्वीरें और फ़ोटो */,
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
                                  '17uen4mz' /* संवाद */,
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
                                  'yotwo5ou' /* पसंदीदा */,
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
                                  '0kreil3p' /* उपयोगकर्ता रूपरेखा */,
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
                                  'n83s62qo' /* लॉगआउट */,
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
                                                            '0pt3v9xx' /* समता अपार शक्ति */,
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
                                                          'gdlqxi3a' /* ॐ ब्रह्म सत्यम सर्वाधार */,
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
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 115.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.0),
                                    border: Border.all(
                                      color: Color(0x02875959),
                                      width: 5.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Samtawad_UIUX_(21).png',
                                              width: double.infinity,
                                              height: 120.0,
                                              fit: BoxFit.fill,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 10.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'i2xv6w79' /* गुरुदेव चित्र और समतावाद शिक्ष... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFC25123),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w900,
                                                    shadows: [
                                                      Shadow(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        offset:
                                                            Offset(2.0, 2.0),
                                                        blurRadius: 2.0,
                                                      )
                                                    ],
                                                    lineHeight: 1.5,
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
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      height: 600.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment(0.0, 0),
                                                  child:
                                                      FlutterFlowButtonTabBar(
                                                    useToggleButtonStyle: false,
                                                    isScrollable: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Gotu',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                    unselectedLabelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Gotu',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                    labelColor:
                                                        Color(0xFF703102),
                                                    unselectedLabelColor:
                                                        Color(0xFF703102),
                                                    backgroundColor:
                                                        Color(0xFFDFCBBD),
                                                    unselectedBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 0.0,
                                                    borderRadius: 10.0,
                                                    elevation: 5.0,
                                                    labelPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    buttonMargin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 10.0,
                                                                5.0, 10.0),
                                                    tabs: [
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'ovtanldi' /* गुरुदेव चित्र */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'os3bhq5j' /* आज का ज्ञान */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '0c4jy3p4' /* समतावाद ज्ञान */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'dmny2go2' /* आश्रम गैलरी */,
                                                        ),
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {},
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    children: [
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) => ListView(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          children: [
                                                            Align(
                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                child: Container(
                                                                  width: double.infinity,
                                                                  //change
                                                                  height: 40.5,
                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                  child: Row(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Container(
                                                                        //change
                                                                        width: 280.0,
                                                                        child: TextFormField(
                                                                          controller: _model.textController1,
                                                                          focusNode: _model.textFieldFocusNode1,
                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                            '_model.textController1',
                                                                            Duration(milliseconds: 500),
                                                                                () async {
                                                                              await queryGurijiJiImageRecordOnce()
                                                                                  .then(
                                                                                    (records) => _model.simpleSearchResults1 = TextSearch(
                                                                                  records
                                                                                      .map(
                                                                                        (record) => TextSearchItem.fromTerms(record, [
                                                                                      record.information!,
                                                                                      record.tags!
                                                                                    ]),
                                                                                  )
                                                                                      .toList(),
                                                                                ).search(_model.textController1.text).map((r) => r.object).toList(),
                                                                              )
                                                                                  .onError((_, __) => _model.simpleSearchResults1 = [])
                                                                                  .whenComplete(() => safeSetState(() {}));

                                                                              _model.searchGuruPicture = true;
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus: false,
                                                                          obscureText: false,
                                                                          decoration: InputDecoration(
                                                                            isDense: true,
                                                                            hintText: 'Search GuruDev Photo',
                                                                            hintStyle: TextStyle(color: Color(0xFF090909)),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Color(0xFF020202), width: 1.0),
                                                                              borderRadius: BorderRadius.circular(25.0),
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Color(0x00000000), width: 1.0),
                                                                              borderRadius: BorderRadius.circular(25.0),
                                                                            ),
                                                                            filled: true,
                                                                            prefixIcon: Icon(Icons.search_sharp, color: Color(0xFF090909), size: 22.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model.textController1Validator.asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                        child: InkWell(
                                                                          onTap: () async {
                                                                            safeSetState(() {
                                                                              _model.textController1?.clear();
                                                                            });
                                                                            _model.searchGuruPicture = false;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child: Icon(Icons.close, color: FlutterFlowTheme.of(context).primaryText, size: 24.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            // change
                                                            SizedBox(height: 10.0),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 5.0,
                                                                  0.0, 5.0),
                                                              child: Container(
                                                                height: 1.0,
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                  Color(0xFFC25123),
                                                                ),
                                                              ),
                                                            ),

                                                            // 🔥 GridView without search
                                                            if (!_model.searchGuruPicture)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                child: StreamBuilder<List<GurijiJiImageRecord>>(
                                                                  stream: queryGurijiJiImageRecord(),
                                                                  builder: (context, snapshot) {
                                                                    if (!snapshot.hasData) {
                                                                      return Center(
                                                                        child: SizedBox(
                                                                          width: 50.0,
                                                                          height: 50.0,
                                                                          child: CircularProgressIndicator(),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<GurijiJiImageRecord> gridViewGurijiJiImageRecordList = snapshot.data!;

                                                                    return GridView.builder(
                                                                      padding: EdgeInsets.zero,
                                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount: 2,
                                                                        crossAxisSpacing: 10.0,
                                                                        mainAxisSpacing: 10.0,
                                                                        childAspectRatio: 1.2,
                                                                      ),
                                                                      primary: false,
                                                                      shrinkWrap: true,
                                                                      scrollDirection: Axis.vertical,
                                                                      itemCount: gridViewGurijiJiImageRecordList.length,
                                                                      itemBuilder: (context, gridViewIndex) {
                                                                        final gridViewGurijiJiImageRecord = gridViewGurijiJiImageRecordList[gridViewIndex];
                                                                        return InkWell(
                                                                          onTap: () async {
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
                                                                          child: ClipRRect(
                                                                            borderRadius: BorderRadius.circular(25.0),
                                                                            child: Image.network(
                                                                              gridViewGurijiJiImageRecord.images,
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),

                                                            // 🔥 GridView with search
                                                            if (_model.searchGuruPicture)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                child: Builder(
                                                                  builder: (context) {
                                                                    final searchGuruJi = _model.simpleSearchResults1.toList();

                                                                    return GridView.builder(
                                                                      padding: EdgeInsets.zero,
                                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount: 2,
                                                                        crossAxisSpacing: 10.0,
                                                                        mainAxisSpacing: 10.0,
                                                                        childAspectRatio: 1.2,
                                                                      ),
                                                                      primary: false,
                                                                      shrinkWrap: true,
                                                                      scrollDirection: Axis.vertical,
                                                                      itemCount: searchGuruJi.length,
                                                                      itemBuilder: (context, searchGuruJiIndex) {
                                                                        final searchGuruJiItem = searchGuruJi[searchGuruJiIndex];
                                                                        return InkWell(
                                                                          onTap: () async {
                                                                            context.pushNamed(
                                                                              PicturesWidget.routeName,
                                                                              queryParameters: {
                                                                                'currentIndex': serializeParam(
                                                                                  searchGuruJiItem.id,
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
                                                                          child: ClipRRect(
                                                                            borderRadius: BorderRadius.circular(25.0),
                                                                            child: Image.network(
                                                                              searchGuruJiItem.images,
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),

                                                            Container(
                                                              width: double.infinity,
                                                              height: 160.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,

                                                                  //change
                                                                  height: 40.5,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController2,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode2,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textController2',
                                                                            Duration(milliseconds: 500),
                                                                            () async {
                                                                              await queryAajKaKnowledgeRecordOnce()
                                                                                  .then(
                                                                                    (records) => _model.simpleSearchResults2 = TextSearch(
                                                                                      records
                                                                                          .map(
                                                                                            (record) => TextSearchItem.fromTerms(record, [
                                                                                              record.aajKaKnowledgeId!
                                                                                            ]),
                                                                                          )
                                                                                          .toList(),
                                                                                    ).search(_model.textController2.text).map((r) => r.object).toList(),
                                                                                  )
                                                                                  .onError((_, __) => _model.simpleSearchResults2 = [])
                                                                                  .whenComplete(() => safeSetState(() {}));

                                                                              _model.searchAajKnow = true;
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.alegreyaSans(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0x02080808),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'b8p31uhc' /* Search Aaj Ka Gyaan Photo */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.alegreyaSans(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF090909),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF020202),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            prefixIcon:
                                                                                Icon(
                                                                              Icons.search_sharp,
                                                                              color: Color(0xFF090909),
                                                                              size: 22.0,
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.alegreyaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .textController2Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
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
                                                                            safeSetState(() {
                                                                              _model.textController2?.clear();
                                                                            });
                                                                            _model.searchAajKnow =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              AajKaKnowledgeRecord>>(
                                                                        stream:
                                                                            queryAajKaKnowledgeRecord(),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<AajKaKnowledgeRecord>
                                                                              dropDownAajKaKnowledgeRecordList =
                                                                              snapshot.data!;

                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownValueController1 ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownValue1 ??= FFLocalizations.of(context).getText(
                                                                                'g0df2vu3' /* All */,
                                                                              ),
                                                                            ),
                                                                            options:
                                                                                functions.getUniqueCategories(dropDownAajKaKnowledgeRecordList.map((e) => e.category).toList()),
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.dropDownValue1 = val),
                                                                            width:
                                                                                125.8,
                                                                            height:
                                                                                75.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.alegreyaSans(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF161617),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              shadows: [
                                                                                Shadow(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  offset: Offset(2.0, 2.0),
                                                                                  blurRadius: 2.0,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: Color(0xFF171818),
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                Color(0xFFDFCBBD),
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0x00151414),
                                                                            borderWidth:
                                                                                0.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                false,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (!_model
                                                                    .searchAajKnow &&
                                                                (_model.dropDownValue1 ==
                                                                    'All'))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: PagedGridView<
                                                                    DocumentSnapshot<
                                                                        Object?>?,
                                                                    AajKaKnowledgeRecord>(
                                                                  pagingController:
                                                                      _model
                                                                          .setGridViewController3(
                                                                    AajKaKnowledgeRecord
                                                                        .collection
                                                                        .where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          _model
                                                                              .dropDownValue1,
                                                                    ),
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        1.2,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  builderDelegate:
                                                                      PagedChildBuilderDelegate<
                                                                          AajKaKnowledgeRecord>(
                                                                    // Customize what your widget looks like when it's loading the first page.
                                                                    firstPageProgressIndicatorBuilder:
                                                                        (_) =>
                                                                            Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // Customize what your widget looks like when it's loading another page.
                                                                    newPageProgressIndicatorBuilder:
                                                                        (_) =>
                                                                            Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    itemBuilder:
                                                                        (context,
                                                                            _,
                                                                            gridViewIndex) {
                                                                      final gridViewAajKaKnowledgeRecord = _model
                                                                          .gridViewPagingController3!
                                                                          .itemList![gridViewIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap: () async {
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
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(25.0),
                                                                            bottomRight:
                                                                                Radius.circular(25.0),
                                                                            topLeft:
                                                                                Radius.circular(25.0),
                                                                            topRight:
                                                                                Radius.circular(25.0),
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            gridViewAajKaKnowledgeRecord.images,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            // change
                                                            SizedBox(height: 10.0),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 5.0,
                                                                  0.0, 5.0),
                                                              child: Container(
                                                                height: 1.0,
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                  Color(0xFFC25123),
                                                                ),
                                                              ),
                                                            ),

                                                            if (!_model
                                                                    .searchAajKnow &&
                                                                (_model.dropDownValue1 !=
                                                                    'All'))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: PagedGridView<
                                                                    DocumentSnapshot<
                                                                        Object?>?,
                                                                    AajKaKnowledgeRecord>(
                                                                  pagingController:
                                                                      _model
                                                                          .setGridViewController4(
                                                                    AajKaKnowledgeRecord
                                                                        .collection,
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        1.2,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  builderDelegate:
                                                                      PagedChildBuilderDelegate<
                                                                          AajKaKnowledgeRecord>(
                                                                    // Customize what your widget looks like when it's loading the first page.
                                                                    firstPageProgressIndicatorBuilder:
                                                                        (_) =>
                                                                            Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // Customize what your widget looks like when it's loading another page.
                                                                    newPageProgressIndicatorBuilder:
                                                                        (_) =>
                                                                            Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    itemBuilder:
                                                                        (context,
                                                                            _,
                                                                            gridViewIndex) {
                                                                      final gridViewAajKaKnowledgeRecord = _model
                                                                          .gridViewPagingController4!
                                                                          .itemList![gridViewIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap: () async {
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
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(25.0),
                                                                            bottomRight:
                                                                                Radius.circular(25.0),
                                                                            topLeft:
                                                                                Radius.circular(25.0),
                                                                            topRight:
                                                                                Radius.circular(25.0),
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            gridViewAajKaKnowledgeRecord.images,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            if (_model
                                                                .searchAajKnow)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final aajKnowledge = _model
                                                                        .simpleSearchResults2
                                                                        .toList();

                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            10.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          aajKnowledge
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              aajKnowledgeIndex) {
                                                                        final aajKnowledgeItem =
                                                                            aajKnowledge[aajKnowledgeIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap: () async {
                                                                            context.pushNamed(
                                                                              PicturesWidget.routeName,
                                                                              queryParameters: {
                                                                                'currentIndex': serializeParam(
                                                                                  aajKnowledgeItem.id,
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
                                                                          child:
                                                                              Hero(
                                                                            tag:
                                                                                aajKnowledgeItem.images,
                                                                            transitionOnUserGestures:
                                                                                true,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                              child: Image.network(
                                                                                aajKnowledgeItem.images,
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                fit: BoxFit.fill,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 160.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  // change
                                                                  height: 40.5,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController3,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode3,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textController3',
                                                                            Duration(milliseconds: 500),
                                                                            () async {
                                                                              await querySamtawadKnowledgeRecordOnce()
                                                                                  .then(
                                                                                    (records) => _model.simpleSearchResults3 = TextSearch(
                                                                                      records
                                                                                          .map(
                                                                                            (record) => TextSearchItem.fromTerms(record, [
                                                                                              record.information!,
                                                                                              record.tags!
                                                                                            ]),
                                                                                          )
                                                                                          .toList(),
                                                                                    ).search(_model.textController3.text).map((r) => r.object).toList(),
                                                                                  )
                                                                                  .onError((_, __) => _model.simpleSearchResults3 = [])
                                                                                  .whenComplete(() => safeSetState(() {}));

                                                                              _model.samtawadKnow = true;
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.alegreyaSans(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0x02080808),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'vv4v5i4p' /* Search.. */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.alegreyaSans(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF090909),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF020202),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(25.0),
                                                                                bottomRight: Radius.circular(25.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            prefixIcon:
                                                                                Icon(
                                                                              Icons.search_sharp,
                                                                              color: Color(0xFF090909),
                                                                              size: 22.0,
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.alegreyaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .textController3Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
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
                                                                            safeSetState(() {
                                                                              _model.textController3?.clear();
                                                                            });
                                                                            _model.samtawadKnow =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              SamtawadKnowledgeRecord>>(
                                                                        stream:
                                                                            querySamtawadKnowledgeRecord(),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<SamtawadKnowledgeRecord>
                                                                              dropDownSamtawadKnowledgeRecordList =
                                                                              snapshot.data!;

                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownValueController2 ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownValue2 ??= FFLocalizations.of(context).getText(
                                                                                'z5jaex13' /* All */,
                                                                              ),
                                                                            ),
                                                                            options:
                                                                                functions.getUniqueCategories(dropDownSamtawadKnowledgeRecordList.map((e) => e.category).toList()),
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.dropDownValue2 = val),
                                                                            width:
                                                                                125.8,
                                                                            height:
                                                                                75.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.alegreyaSans(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              shadows: [
                                                                                Shadow(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  offset: Offset(2.0, 2.0),
                                                                                  blurRadius: 2.0,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: Color(0xFF171818),
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                Color(0xFFDFCBBD),
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0x00151414),
                                                                            borderWidth:
                                                                                0.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                false,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            // change
                                                            SizedBox(height: 10.0),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 5.0,
                                                                  0.0, 5.0),
                                                              child: Container(
                                                                height: 1.0,
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                  Color(0xFFC25123),
                                                                ),
                                                              ),
                                                            ),

                                                            if (!_model
                                                                    .samtawadKnow &&
                                                                (_model.dropDownValue2 ==
                                                                    'All'))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: PagedGridView<
                                                                    DocumentSnapshot<
                                                                        Object?>?,
                                                                    SamtawadKnowledgeRecord>(
                                                                  pagingController:
                                                                      _model
                                                                          .setGridViewController6(
                                                                    SamtawadKnowledgeRecord
                                                                        .collection,
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        1.2,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  builderDelegate:
                                                                      PagedChildBuilderDelegate<
                                                                          SamtawadKnowledgeRecord>(
                                                                    // Customize what your widget looks like when it's loading the first page.
                                                                    firstPageProgressIndicatorBuilder:
                                                                        (_) =>
                                                                            Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // Customize what your widget looks like when it's loading another page.
                                                                    newPageProgressIndicatorBuilder:
                                                                        (_) =>
                                                                            Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    itemBuilder:
                                                                        (context,
                                                                            _,
                                                                            gridViewIndex) {
                                                                      final gridViewSamtawadKnowledgeRecord = _model
                                                                          .gridViewPagingController6!
                                                                          .itemList![gridViewIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap: () async {
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
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(25.0),
                                                                            bottomRight:
                                                                                Radius.circular(25.0),
                                                                            topLeft:
                                                                                Radius.circular(25.0),
                                                                            topRight:
                                                                                Radius.circular(25.0),
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            gridViewSamtawadKnowledgeRecord.images,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            if (!_model
                                                                    .samtawadKnow &&
                                                                (_model.dropDownValue2 !=
                                                                    'All'))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        SamtawadKnowledgeRecord>>(
                                                                  stream:
                                                                      querySamtawadKnowledgeRecord(
                                                                    queryBuilder:
                                                                        (samtawadKnowledgeRecord) =>
                                                                            samtawadKnowledgeRecord.where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          _model
                                                                              .dropDownValue2,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<SamtawadKnowledgeRecord>
                                                                        gridViewSamtawadKnowledgeRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            10.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          gridViewSamtawadKnowledgeRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              gridViewIndex) {
                                                                        final gridViewSamtawadKnowledgeRecord =
                                                                            gridViewSamtawadKnowledgeRecordList[gridViewIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap: () async {
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
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              gridViewSamtawadKnowledgeRecord.images,
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            if (_model
                                                                .samtawadKnow)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final ssamtawadKnowledge = _model
                                                                        .simpleSearchResults3
                                                                        .toList();

                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            10.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          ssamtawadKnowledge
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              ssamtawadKnowledgeIndex) {
                                                                        final ssamtawadKnowledgeItem =
                                                                            ssamtawadKnowledge[ssamtawadKnowledgeIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap: () async {
                                                                            context.pushNamed(
                                                                              PicturesWidget.routeName,
                                                                              queryParameters: {
                                                                                'currentIndex': serializeParam(
                                                                                  ssamtawadKnowledgeItem.id,
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
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              ssamtawadKnowledgeItem.images,
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 160.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                // change
                                                                height: 40.5,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          150.0,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController4,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode4,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.textController4',
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                          () async {
                                                                            await queryAshramGalleryRecordOnce()
                                                                                .then(
                                                                                  (records) => _model.simpleSearchResults4 = TextSearch(
                                                                                    records
                                                                                        .map(
                                                                                          (record) => TextSearchItem.fromTerms(record, [
                                                                                            record.information!,
                                                                                            record.tags!,
                                                                                            record.aashraGallaryId!
                                                                                          ]),
                                                                                        )
                                                                                        .toList(),
                                                                                  ).search(_model.textController4.text).map((r) => r.object).toList(),
                                                                                )
                                                                                .onError((_, __) => _model.simpleSearchResults4 = [])
                                                                                .whenComplete(() => safeSetState(() {}));

                                                                            _model.searchAashramGal =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.alegreyaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0x02080808),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'lfkdrua5' /* Search.. */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.alegreyaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF090909),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0xFF020202),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          prefixIcon:
                                                                              Icon(
                                                                            Icons.search_sharp,
                                                                            color:
                                                                                Color(0xFF090909),
                                                                            size:
                                                                                22.0,
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.alegreyaSans(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .textController4Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
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
                                                                          safeSetState(
                                                                              () {
                                                                            _model.textController4?.clear();
                                                                          });
                                                                          _model.searchAashramGal =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            AshramGalleryRecord>>(
                                                                      stream:
                                                                          queryAshramGalleryRecord(),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<AshramGalleryRecord>
                                                                            dropDownAshramGalleryRecordList =
                                                                            snapshot.data!;

                                                                        return FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.dropDownValueController3 ??=
                                                                              FormFieldController<String>(
                                                                            _model.dropDownValue3 ??=
                                                                                FFLocalizations.of(context).getText(
                                                                              't1i8jdwa' /* All */,
                                                                            ),
                                                                          ),
                                                                          options: functions.getUniqueCategories(dropDownAshramGalleryRecordList
                                                                              .map((e) => e.category)
                                                                              .toList()),
                                                                          onChanged: (val) =>
                                                                              safeSetState(() => _model.dropDownValue3 = val),
                                                                          width:
                                                                              125.8,
                                                                          height:
                                                                              75.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                            font:
                                                                                GoogleFonts.alegreyaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            shadows: [
                                                                              Shadow(
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                offset: Offset(2.0, 2.0),
                                                                                blurRadius: 2.0,
                                                                              )
                                                                            ],
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                Color(0xFF171818),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              Color(0xFFDFCBBD),
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              Color(0x00151414),
                                                                          borderWidth:
                                                                              0.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isOverButton:
                                                                              false,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            // change
                                                            SizedBox(height: 10.0),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 5.0,
                                                                  0.0, 5.0),
                                                              child: Container(
                                                                height: 1.0,
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                  Color(0xFFC25123),
                                                                ),
                                                              ),
                                                            ),
                                                            if (!_model
                                                                    .searchAashramGal &&
                                                                (_model.dropDownValue3 !=
                                                                    'All'))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        AshramGalleryRecord>>(
                                                                  stream:
                                                                      queryAshramGalleryRecord(
                                                                    queryBuilder:
                                                                        (ashramGalleryRecord) =>
                                                                            ashramGalleryRecord.where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          _model
                                                                              .dropDownValue3,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<AshramGalleryRecord>
                                                                        gridViewAshramGalleryRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            10.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          gridViewAshramGalleryRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              gridViewIndex) {
                                                                        final gridViewAshramGalleryRecord =
                                                                            gridViewAshramGalleryRecordList[gridViewIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap: () async {
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
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              gridViewAshramGalleryRecord.image,
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            if (!_model
                                                                    .searchAashramGal &&
                                                                (_model.dropDownValue3 ==
                                                                    'All'))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        AshramGalleryRecord>>(
                                                                  stream:
                                                                      queryAshramGalleryRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<AshramGalleryRecord>
                                                                        gridViewAshramGalleryRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            10.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          gridViewAshramGalleryRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              gridViewIndex) {
                                                                        final gridViewAshramGalleryRecord =
                                                                            gridViewAshramGalleryRecordList[gridViewIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap: () async {
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
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              gridViewAshramGalleryRecord.image,
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            if (_model
                                                                .searchAashramGal)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final ashramGallery = _model
                                                                        .simpleSearchResults4
                                                                        .toList();

                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            10.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          ashramGallery
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              ashramGalleryIndex) {
                                                                        final ashramGalleryItem =
                                                                            ashramGallery[ashramGalleryIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap: () async {
                                                                            context.pushNamed(
                                                                              PicturesWidget.routeName,
                                                                              queryParameters: {
                                                                                'currentIndex': serializeParam(
                                                                                  ashramGalleryItem.id,
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
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(25.0),
                                                                              bottomRight: Radius.circular(25.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              ashramGalleryItem.image,
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 160.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
