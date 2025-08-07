import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/audio_info/audio_info_widget.dart';
import '/pages/component/audio_lyrics/audio_lyrics_widget.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_search/text_search.dart';
import 'vani_satsang_and_audio_book_copy_model.dart';
export 'vani_satsang_and_audio_book_copy_model.dart';

class VaniSatsangAndAudioBookCopyWidget extends StatefulWidget {
  const VaniSatsangAndAudioBookCopyWidget({
    super.key,
    bool? tabLabel,
    this.tabName,
    int? tabNumber,
  })  : this.tabLabel = tabLabel ?? true,
        this.tabNumber = tabNumber ?? 0;

  /// String
  final bool tabLabel;

  /// String
  final bool? tabName;

  final int tabNumber;

  static String routeName = 'Vani_Satsang_And_Audio_BookCopy';
  static String routePath = '/vaniSatsangAndAudioBookCopy';

  @override
  State<VaniSatsangAndAudioBookCopyWidget> createState() =>
      _VaniSatsangAndAudioBookCopyWidgetState();
}

class _VaniSatsangAndAudioBookCopyWidgetState
    extends State<VaniSatsangAndAudioBookCopyWidget>
    with TickerProviderStateMixin {
  late VaniSatsangAndAudioBookCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VaniSatsangAndAudioBookCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedCategory = 'सभी';
      _model.searchVaniStatus = false;
      _model.searchSatsangStatus = false;
      _model.searchGuruSatsangStatus = false;
      _model.searchSatsang = false;
      _model.searchGuruSatsang = false;
      _model.searchAudioBook = false;
      _model.selectedSatsangMode = 'सभी';
      safeSetState(() {});
      FFAppState().currentPage = 9;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: min(
          valueOrDefault<int>(
            widget!.tabNumber,
            0,
          ),
          3),
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
                          'ermuk51o' /* "प्रभु सत् आचरण और नि:चल बुद्ध... */,
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
                            'g7gy758g' /* -- महात्मा मंगत राम जी महाराज */,
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
                            '92tuftsl' /* 1903-1954 */,
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
                                  'e8vqniwk' /* घर */,
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
                                  'qm41efwr' /* जीवन और साधना */,
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
                                  's2xou7e5' /* शिष्य का कर्तव्य */,
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
                                  'lo92j9vj' /* वाणी ,सत्संग और ऑडियो बुक */,
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
                                  'lcvbpvrw' /* गुरुदेव की तस्वीरें और फ़ोटो */,
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
                                  '7v48do5s' /* संवाद */,
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
                                  '5341jhba' /* पसंदीदा */,
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
                                  '2zb1gmae' /* उपयोगकर्ता रूपरेखा */,
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
                                  'kg1dveyg' /* लॉगआउट */,
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
                                                            'wnarv0yq' /* समता अपार शक्ति */,
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
                                                          '5nnfvwnu' /* ॐ ब्रह्म सत्यम सर्वाधार */,
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
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Samtawad_UIUX_(21).png',
                                  width: double.infinity,
                                  height: 100.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 10.0, 18.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          's8d4h5nv' /* वाणी, सत्संग और  ऑडियो पुस्तक */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Gotu',
                                          color: Color(0xFFC25123),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Container(
                              height: 680.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: FlutterFlowButtonTabBar(
                                          useToggleButtonStyle: false,
                                          isScrollable: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                          unselectedLabelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          labelColor: Color(0xFF703102),
                                          unselectedLabelColor:
                                              Color(0xFF703102),
                                          backgroundColor: Color(0xFFDFCBBD),
                                          unselectedBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          elevation: 5.0,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          buttonMargin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 10.0, 5.0, 10.0),
                                          tabs: [
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '8y594caz' /* वाणी */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                's7zx4b6m' /* सत्संग */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '74s729b1' /* गुरुकालीन सत्संग */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'jatamg1u' /* ऑडियो पुस्तक */,
                                              ),
                                            ),
                                          ],
                                          controller: _model.tabBarController,
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
                                          controller: _model.tabBarController,
                                          children: [
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => ListView(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      // height: 78.5,
                                                      height: 50.5,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height: 40.5,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        200.0,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController1,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode1,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        await queryAudioRecordOnce()
                                                                            .then(
                                                                              (records) => _model.simpleSearchResults1 = TextSearch(
                                                                                records
                                                                                    .map(
                                                                                      (record) => TextSearchItem.fromTerms(record, [
                                                                                        record.category!,
                                                                                        record.information!,
                                                                                        record.audioTitle!,
                                                                                        record.tags!,
                                                                                        record.contactInfo!,
                                                                                        record.speakerName!,
                                                                                        record.audioTime!
                                                                                      ]),
                                                                                    )
                                                                                    .toList(),
                                                                              ).search(_model.textController1.text).map((r) => r.object).toList(),
                                                                            )
                                                                            .onError((_, __) => _model.simpleSearchResults1 =
                                                                                [])
                                                                            .whenComplete(() =>
                                                                                safeSetState(() {}));

                                                                        _model.searchVaniStatus =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});

                                                                        await SearchHistoryCollectionRecord
                                                                            .collection
                                                                            .doc()
                                                                            .set({
                                                                          ...createSearchHistoryCollectionRecordData(
                                                                            searchText:
                                                                                _model.textController1.text,
                                                                            category:
                                                                                'vani',
                                                                            userId:
                                                                                currentUserUid,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'timeStamp': FieldValue.serverTimestamp(),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
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
                                                                          'mry97067' /* Search  Audio Using  Title / Si... */,
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
                                                                            color:
                                                                                Color(0xFF020202),
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        prefixIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .search_sharp,
                                                                          color:
                                                                              Color(0xFF090909),
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.alegreyaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .textController1Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
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
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController1
                                                                            ?.clear();
                                                                      });
                                                                      _model.searchVaniStatus =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              15.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              10.0)),
                                                            ),
                                                          ),
                                                          // Padding(
                                                          //   padding:
                                                          //       EdgeInsetsDirectional
                                                          //           .fromSTEB(
                                                          //               0.0,
                                                          //               5.0,
                                                          //               0.0,
                                                          //               0.0),
                                                          //   child: Container(
                                                          //     width: double
                                                          //         .infinity,
                                                          //     height: 31.6,
                                                          //     decoration:
                                                          //         BoxDecoration(),
                                                          //     child: StreamBuilder<
                                                          //         List<
                                                          //             SearchHistoryCollectionRecord>>(
                                                          //       stream:
                                                          //           querySearchHistoryCollectionRecord(
                                                          //         queryBuilder: (searchHistoryCollectionRecord) =>
                                                          //             searchHistoryCollectionRecord
                                                          //                 .where(
                                                          //                   'category',
                                                          //                   isEqualTo:
                                                          //                       'vani',
                                                          //                 )
                                                          //                 .where(
                                                          //                   'user_id',
                                                          //                   isEqualTo:
                                                          //                       currentUserUid,
                                                          //                 )
                                                          //                 .orderBy(
                                                          //                     'timeStamp',
                                                          //                     descending: true),
                                                          //         limit: 7,
                                                          //       ),
                                                          //       builder: (context,
                                                          //           snapshot) {
                                                          //         // Customize what your widget looks like when it's loading.
                                                          //         if (!snapshot
                                                          //             .hasData) {
                                                          //           return Center(
                                                          //             child:
                                                          //                 SizedBox(
                                                          //               width:
                                                          //                   50.0,
                                                          //               height:
                                                          //                   50.0,
                                                          //               child:
                                                          //                   CircularProgressIndicator(
                                                          //                 valueColor:
                                                          //                     AlwaysStoppedAnimation<Color>(
                                                          //                   FlutterFlowTheme.of(context).primary,
                                                          //                 ),
                                                          //               ),
                                                          //             ),
                                                          //           );
                                                          //         }
                                                          //         List<SearchHistoryCollectionRecord>
                                                          //             rowSearchHistoryCollectionRecordList =
                                                          //             snapshot
                                                          //                 .data!;
                                                          //
                                                          //         return Row(
                                                          //           mainAxisSize:
                                                          //               MainAxisSize
                                                          //                   .max,
                                                          //           mainAxisAlignment:
                                                          //               MainAxisAlignment
                                                          //                   .spaceEvenly,
                                                          //           children: List.generate(
                                                          //               rowSearchHistoryCollectionRecordList
                                                          //                   .length,
                                                          //               (rowIndex) {
                                                          //             final rowSearchHistoryCollectionRecord =
                                                          //                 rowSearchHistoryCollectionRecordList[
                                                          //                     rowIndex];
                                                          //             return Text(
                                                          //               rowSearchHistoryCollectionRecord
                                                          //                   .searchText,
                                                          //               style: FlutterFlowTheme.of(context)
                                                          //                   .bodyMedium
                                                          //                   .override(
                                                          //                     font: GoogleFonts.alegreyaSans(
                                                          //                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          //                     ),
                                                          //                     color: Color(0xFFC25123),
                                                          //                     fontSize: 14.0,
                                                          //                     letterSpacing: 0.0,
                                                          //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          //                   ),
                                                          //             );
                                                          //           }),
                                                          //         );
                                                          //       },
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 5.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFC25123),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
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
                                                              _model.selectedCategory =
                                                                  'ईश्वर महिमा वाणी';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                ),
                                                              ),
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model
                                                                              .selectedCategory ==
                                                                          'ईश्वर महिमा वाणी'
                                                                      ? Color(
                                                                          0xFFF8DEB5)
                                                                      : Color(
                                                                          0xFFFBF3E7),
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '0k8symtd' /* ईश्वर महिमा वाणी */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'heders',
                                                                          color:
                                                                              Color(0xFF080808),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
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
                                                              _model.selectedCategory =
                                                                  'वैराग्य वाणी';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                ),
                                                              ),
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model
                                                                              .selectedCategory ==
                                                                          'वैराग्य वाणी'
                                                                      ? Color(
                                                                          0xFFF8DEB5)
                                                                      : Color(
                                                                          0xFFFBF3E7),
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'z2ljc3kp' /* वैराग्य वाणी */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'heders',
                                                                          color:
                                                                              Color(0xFF080808),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Align(
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
                                                                _model.selectedCategory =
                                                                    'पुरातन वाणी संग्रह';
                                                                safeSetState(
                                                                    () {});
                                                              },
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
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: _model.selectedCategory ==
                                                                            'पुरातन वाणी संग्रह'
                                                                        ? Color(
                                                                            0xFFF8DEB5)
                                                                        : Color(
                                                                            0xFFFBF3E7),
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
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              18.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              18.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              18.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              18.0),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'suqcuiob' /* पुरातन वाणी संग्रह  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'heders',
                                                                            color:
                                                                                Color(0xFF080808),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
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
                                                              _model.selectedCategory =
                                                                  'महामंत्र की वाणी';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                ),
                                                              ),
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model
                                                                              .selectedCategory ==
                                                                          'महामंत्र की वाणी'
                                                                      ? Color(
                                                                          0xFFF8DEB5)
                                                                      : Color(
                                                                          0xFFFBF3E7),
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'njog6kjz' /* महामंत्र की वाणी */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'heders',
                                                                          color:
                                                                              Color(0xFF080808),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        35.0,
                                                                        0.0,
                                                                        35.0,
                                                                        0.0),
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
                                                                _model.selectedCategory =
                                                                    'सभी';
                                                                safeSetState(
                                                                    () {});
                                                              },
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
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: _model.selectedCategory ==
                                                                            'सभी'
                                                                        ? Color(
                                                                            0xFFF8DEB5)
                                                                        : Color(
                                                                            0xFFFBF3E7),
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
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              18.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              18.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              18.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              18.0),
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'q16tuz5w' /* सभी */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'heders',
                                                                            color:
                                                                                Color(0xFF080808),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      height: 1.5,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFC25123),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                    ),
                                                  ),
                                                  if (_model.selectedCategory ==
                                                      'ईश्वर महिमा वाणी')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              AudiocategoryRecord>>(
                                                        stream:
                                                            queryAudiocategoryRecord(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<AudiocategoryRecord>
                                                              gridViewAudiocategoryRecordList =
                                                              snapshot.data!;

                                                          return GridView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 2,
                                                              crossAxisSpacing:
                                                                  10.0,
                                                              mainAxisSpacing:
                                                                  10.0,
                                                              childAspectRatio:
                                                                  1.0,
                                                            ),
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                gridViewAudiocategoryRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                gridViewIndex) {
                                                              final gridViewAudiocategoryRecord =
                                                                  gridViewAudiocategoryRecordList[
                                                                      gridViewIndex];
                                                              return Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 0.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      AudioListWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'selectcategory':
                                                                            serializeParam(
                                                                          _model
                                                                              .selectedCategory,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'speakername':
                                                                            serializeParam(
                                                                          gridViewAudiocategoryRecord
                                                                              .category,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'selectsubcategory':
                                                                            serializeParam(
                                                                          gridViewAudiocategoryRecord
                                                                              .category,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 80.0,
                                                                    height:
                                                                        80.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFFFF8F1),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          gridViewAudiocategoryRecord
                                                                              .category,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          maxLines:
                                                                              4,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.alegreyaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.black,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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

                                                  if (!_model
                                                          .searchVaniStatus &&
                                                      (_model.selectedCategory !=
                                                          'सभी'))
                                                    StreamBuilder<
                                                        List<AudioRecord>>(
                                                      stream: queryAudioRecord(
                                                        queryBuilder:
                                                            (audioRecord) =>
                                                                audioRecord
                                                                    .where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          _model
                                                                              .selectedCategory,
                                                                    )
                                                                    .orderBy(
                                                                        'id'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<AudioRecord>
                                                            listViewAudioRecordList =
                                                            snapshot.data!;

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewAudioRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewAudioRecord =
                                                                listViewAudioRecordList[
                                                                    listViewIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    listViewAudioRecord.id.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'heders',
                                                                                          color: Color(0xFF080808),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 246.2,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewAudioRecord.audioTitle,
                                                                                        maxLines: 2,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'subheders',
                                                                                              color: Color(0xFF080808),
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      useSafeArea: true,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(context).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: AudioInfoWidget(
                                                                                              lyrics: listViewAudioRecord.contactInfo,
                                                                                              title: listViewAudioRecord.audioTitle,
                                                                                              information: listViewAudioRecord.information,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.infoCircle,
                                                                                    color: Color(0xFF080808),
                                                                                    size: 35.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.3,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  // Align(
                                                                                  //   alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                  //   child: Container(
                                                                                  //     decoration: BoxDecoration(),
                                                                                  //     alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  //     child:
                                                                                  //     Align(
                                                                                  //       alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                  //       child: Text("वक्ता का नाम : ",
                                                                                  //         // FFLocalizations.of(context).getText(
                                                                                  //         //   'shud9qko' /* वक्ता  */,
                                                                                  //         // ),
                                                                                  //         textAlign: TextAlign.center,
                                                                                  //         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  //               fontFamily: 'subheders',
                                                                                  //               color: Color(0xFF080808),
                                                                                  //               fontSize: 14.0,
                                                                                  //               letterSpacing: 0.0,
                                                                                  //               fontWeight: FontWeight.bold,
                                                                                  //             ),
                                                                                  //       ),
                                                                                  //     ),
                                                                                  //   ),
                                                                                  // ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                          child: Text(
                                                                                            listViewAudioRecord.speakerName,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'subheders',
                                                                                                  color: Color(0xFF080808),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              // Align(
                                                                              //   alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              //   child: Container(
                                                                              //     decoration: BoxDecoration(),
                                                                              //     alignment: AlignmentDirectional(1.0, 0.0),
                                                                              //     child: Align(
                                                                              //       alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              //       child: Text(
                                                                              //         FFLocalizations.of(context).getText(
                                                                              //           'y15si67t' /*    */,
                                                                              //         ),
                                                                              //         textAlign: TextAlign.center,
                                                                              //         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              //               fontFamily: 'subheders',
                                                                              //               color: Color(0xFF080808),
                                                                              //               fontSize: 14.0,
                                                                              //               letterSpacing: 0.0,
                                                                              //               fontWeight: FontWeight.bold,
                                                                              //             ),
                                                                              //       ),
                                                                              //     ),
                                                                              //   ),
                                                                              // ),

                                                                              // audio open
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
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

                                                                                    _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.playCircle,
                                                                                    color: Color(0xFF080808),
                                                                                    size: 35.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                6,
                                                                            child:
                                                                                Container(
                                                                              height: 10.0,
                                                                              decoration: BoxDecoration(),
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                // child: Text(
                                                                                //   listViewAudioRecord.tags,
                                                                                //   maxLines: 3,
                                                                                //   textAlign: TextAlign.left,
                                                                                //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                //         fontFamily: 'subheders',
                                                                                //         color: Color(0xFF080808),
                                                                                //         fontSize: 14.0,
                                                                                //         letterSpacing: 0.0,
                                                                                //         fontWeight: FontWeight.bold,
                                                                                //       ),
                                                                                // ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.5,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                2.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
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
                                                  if (!_model
                                                          .searchVaniStatus &&
                                                      (_model.selectedCategory ==
                                                          'सभी'))
                                                    StreamBuilder<
                                                        List<AudioRecord>>(
                                                      stream: queryAudioRecord(
                                                        queryBuilder:
                                                            (audioRecord) =>
                                                                audioRecord
                                                                    .orderBy(
                                                                        'id'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<AudioRecord>
                                                            listViewAudioRecordList =
                                                            snapshot.data!;

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewAudioRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewAudioRecord =
                                                                listViewAudioRecordList[
                                                                    listViewIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      listViewAudioRecord.id.toString(),
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'heders',
                                                                                          color: Color(0xFF080808),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 246.2,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewAudioRecord.audioTitle,
                                                                                        maxLines: 3,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'subheders',
                                                                                              color: Color(0xFF080808),
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    useSafeArea: true,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(context).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: AudioInfoWidget(
                                                                                            lyrics: listViewAudioRecord.contactInfo,
                                                                                            title: listViewAudioRecord.audioTitle,
                                                                                            information: listViewAudioRecord.information,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.infoCircle,
                                                                                  color: Color(0xFF080808),
                                                                                  size: 35.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.3,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  // Align(
                                                                                  //   alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                  //   child: Container(
                                                                                  //     decoration: BoxDecoration(),
                                                                                  //     alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  //     child:
                                                                                  //     // Align(
                                                                                  //     //   alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                  //     //   child: Text(
                                                                                  //     //     FFLocalizations.of(context).getText(
                                                                                  //     //       'gi882v3r' /* वक्त का नाम */,
                                                                                  //     //     ),
                                                                                  //     //     textAlign: TextAlign.center,
                                                                                  //     //     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  //     //           fontFamily: 'subheders',
                                                                                  //     //           color: Color(0xFF080808),
                                                                                  //     //           fontSize: 14.0,
                                                                                  //     //           letterSpacing: 0.0,
                                                                                  //     //           fontWeight: FontWeight.bold,
                                                                                  //     //         ),
                                                                                  //     //   ),
                                                                                  //     // ),
                                                                                  //   ),
                                                                                  // ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                          child: Text(
                                                                                            listViewAudioRecord.speakerName,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'subheders',
                                                                                                  color: Color(0xFF080808),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      PlayerCopy3Widget.routeName,
                                                                                      queryParameters: {
                                                                                        'id': serializeParam(
                                                                                          listViewAudioRecord.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'audioref': serializeParam(
                                                                                          listViewAudioRecord.reference,
                                                                                          ParamType.DocumentReference,
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
                                                                                      }.withoutNulls,
                                                                                    );

                                                                                    _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.playCircle,
                                                                                    color: Color(0xFF080808),
                                                                                    size: 35.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:6,
                                                                            child: Container(
                                                                              height:
                                                                                  10.0,
                                                                              decoration:
                                                                                  BoxDecoration(),
                                                                              alignment:
                                                                                  AlignmentDirectional(-1.0, 0.0),
                                                                              child:
                                                                                  Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                // child: Text(
                                                                                //   listViewAudioRecord.tags,
                                                                                //   maxLines: 2,
                                                                                //   textAlign: TextAlign.left,
                                                                                //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                //         fontFamily: 'subheders',
                                                                                //         color: Color(0xFF080808),
                                                                                //         fontSize: 14.0,
                                                                                //         letterSpacing: 0.0,
                                                                                //         fontWeight: FontWeight.bold,
                                                                                //       ),
                                                                                // ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.5,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                2.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
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
                                                  if (_model.searchVaniStatus)
                                                    Builder(
                                                      builder: (context) {
                                                        final audioSearch = _model
                                                            .simpleSearchResults1
                                                            .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: audioSearch
                                                              .length,
                                                          itemBuilder: (context,
                                                              audioSearchIndex) {
                                                            final audioSearchItem =
                                                                audioSearch[
                                                                    audioSearchIndex];
                                                            return SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    audioSearchItem.doha,
                                                                                    '1',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'heders',
                                                                                        color: Color(0xFF080808),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 242.5,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Text(
                                                                                      audioSearchItem.audioTitle,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'subheders',
                                                                                            color: Color(0xFF080808),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        useSafeArea: true,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(context).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: AudioInfoWidget(
                                                                                                lyrics: audioSearchItem.contactInfo,
                                                                                                title: audioSearchItem.audioTitle,
                                                                                                information: audioSearchItem.information,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.infoCircle,
                                                                                      color: Color(0xFF080808),
                                                                                      size: 35.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Opacity(
                                                                    opacity:
                                                                        0.3,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFC25123),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(18.0),
                                                                              bottomRight: Radius.circular(18.0),
                                                                              topLeft: Radius.circular(18.0),
                                                                              topRight: Radius.circular(18.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                // Align(
                                                                                //   alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                //   child: Container(
                                                                                //     decoration: BoxDecoration(),
                                                                                //     alignment: AlignmentDirectional(1.0, 0.0),
                                                                                //     child:
                                                                                //     // Align(
                                                                                //     //   alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                //     //   child: Text(
                                                                                //     //     FFLocalizations.of(context).getText(
                                                                                //     //       '1r0l5ksm' /* वक्त का नाम : */,
                                                                                //     //     ),
                                                                                //     //     textAlign: TextAlign.center,
                                                                                //     //     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                //     //           fontFamily: 'subheders',
                                                                                //     //           color: Color(0xFF080808),
                                                                                //     //           fontSize: 14.0,
                                                                                //     //           letterSpacing: 0.0,
                                                                                //     //           fontWeight: FontWeight.bold,
                                                                                //     //         ),
                                                                                //     //   ),
                                                                                //     // ),
                                                                                //   ),
                                                                                // ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                        child: Text(
                                                                                          audioSearchItem.speakerName,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'subheders',
                                                                                                color: Color(0xFF080808),
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {

                                                                                  context.pushNamed(
                                                                                    PlayerCopy3Widget.routeName,
                                                                                    queryParameters: {
                                                                                      'id': serializeParam(
                                                                                        audioSearchItem.id,
                                                                                        ParamType.int,
                                                                                      ),
                                                                                      'audioref': serializeParam(
                                                                                        audioSearchItem.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                      'currentIndex': serializeParam(
                                                                                        0,
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
                                                                                    }.withoutNulls,
                                                                                  );

                                                                                  _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.playCircle,
                                                                                  color: Color(0xFF080808),
                                                                                  size: 35.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          flex:
                                                                              6,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              // child: Text(
                                                                              //   audioSearchItem.tags,
                                                                              //   textAlign: TextAlign.left,
                                                                              //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              //         fontFamily: 'subheders',
                                                                              //         color: Color(0xFF080808),
                                                                              //         fontSize: 14.0,
                                                                              //         letterSpacing: 0.0,
                                                                              //         fontWeight: FontWeight.bold,
                                                                              //       ),
                                                                              // ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Opacity(
                                                                    opacity:
                                                                        0.5,
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              2.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFC25123),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(18.0),
                                                                              bottomRight: Radius.circular(18.0),
                                                                              topLeft: Radius.circular(18.0),
                                                                              topRight: Radius.circular(18.0),
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 260.0,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => ListView(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      height: 50.5,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height: 40.5,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        200.0,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController2,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode2,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        await querySatsangRecordOnce()
                                                                            .then(
                                                                              (records) => _model.simpleSearchResults2 = TextSearch(
                                                                                records
                                                                                    .map(
                                                                                      (record) => TextSearchItem.fromTerms(record, [
                                                                                        record.title!,
                                                                                        record.speakerName!,
                                                                                        record.category!,
                                                                                        record.information!,
                                                                                        record.audioTime!,
                                                                                        record.tags!
                                                                                      ]),
                                                                                    )
                                                                                    .toList(),
                                                                              ).search(_model.textController2.text).map((r) => r.object).toList(),
                                                                            )
                                                                            .onError((_, __) => _model.simpleSearchResults2 =
                                                                                [])
                                                                            .whenComplete(() =>
                                                                                safeSetState(() {}));

                                                                        _model.searchSatsangStatus =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});

                                                                        await SearchHistoryCollectionRecord
                                                                            .collection
                                                                            .doc()
                                                                            .set({
                                                                          ...createSearchHistoryCollectionRecordData(
                                                                            searchText:
                                                                                _model.textController2.text,
                                                                            category:
                                                                                'satsangVani',
                                                                            userId:
                                                                                currentUserUid,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'timeStamp': FieldValue.serverTimestamp(),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
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
                                                                          'vcrle6i3' /* Search  Audio Using  Title / Si... */,
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
                                                                            color:
                                                                                Color(0xFF020202),
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        prefixIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .search_sharp,
                                                                          color:
                                                                              Color(0xFF090909),
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.alegreyaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .textController2Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
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
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController2
                                                                            ?.clear();
                                                                      });
                                                                      _model.searchSatsangStatus =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              15.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              10.0)),
                                                            ),
                                                          ),
                                                          // Padding(
                                                          //   padding:
                                                          //       EdgeInsetsDirectional
                                                          //           .fromSTEB(
                                                          //               0.0,
                                                          //               5.0,
                                                          //               0.0,
                                                          //               0.0),
                                                          //   child: Container(
                                                          //     width: double
                                                          //         .infinity,
                                                          //     height: 31.6,
                                                          //     decoration:
                                                          //         BoxDecoration(),
                                                          //     child: StreamBuilder<
                                                          //         List<
                                                          //             SearchHistoryCollectionRecord>>(
                                                          //       stream:
                                                          //           querySearchHistoryCollectionRecord(
                                                          //         queryBuilder: (searchHistoryCollectionRecord) =>
                                                          //             searchHistoryCollectionRecord
                                                          //                 .where(
                                                          //                   'category',
                                                          //                   isEqualTo:
                                                          //                       'satsangVani',
                                                          //                 )
                                                          //                 .where(
                                                          //                   'user_id',
                                                          //                   isEqualTo:
                                                          //                       currentUserUid,
                                                          //                 )
                                                          //                 .orderBy(
                                                          //                     'timeStamp',
                                                          //                     descending: true),
                                                          //         limit: 7,
                                                          //       ),
                                                          //       builder: (context,
                                                          //           snapshot) {
                                                          //         // Customize what your widget looks like when it's loading.
                                                          //         if (!snapshot
                                                          //             .hasData) {
                                                          //           return Center(
                                                          //             child:
                                                          //                 SizedBox(
                                                          //               width:
                                                          //                   50.0,
                                                          //               height:
                                                          //                   50.0,
                                                          //               child:
                                                          //                   CircularProgressIndicator(
                                                          //                 valueColor:
                                                          //                     AlwaysStoppedAnimation<Color>(
                                                          //                   FlutterFlowTheme.of(context).primary,
                                                          //                 ),
                                                          //               ),
                                                          //             ),
                                                          //           );
                                                          //         }
                                                          //         List<SearchHistoryCollectionRecord>
                                                          //             rowSearchHistoryCollectionRecordList =
                                                          //             snapshot
                                                          //                 .data!;
                                                          //
                                                          //         return Row(
                                                          //           mainAxisSize:
                                                          //               MainAxisSize
                                                          //                   .max,
                                                          //           mainAxisAlignment:
                                                          //               MainAxisAlignment
                                                          //                   .spaceEvenly,
                                                          //           children: List.generate(
                                                          //               rowSearchHistoryCollectionRecordList
                                                          //                   .length,
                                                          //               (rowIndex) {
                                                          //             final rowSearchHistoryCollectionRecord =
                                                          //                 rowSearchHistoryCollectionRecordList[
                                                          //                     rowIndex];
                                                          //             return Text(
                                                          //               rowSearchHistoryCollectionRecord
                                                          //                   .searchText,
                                                          //               style: FlutterFlowTheme.of(context)
                                                          //                   .bodyMedium
                                                          //                   .override(
                                                          //                     font: GoogleFonts.alegreyaSans(
                                                          //                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          //                     ),
                                                          //                     color: Color(0xFFC25123),
                                                          //                     fontSize: 14.0,
                                                          //                     letterSpacing: 0.0,
                                                          //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          //                   ),
                                                          //             );
                                                          //           }),
                                                          //         );
                                                          //       },
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
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
                                                              _model.selectedSatsangMode =
                                                                  'सत्संग';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                ),
                                                              ),
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model
                                                                              .selectedSatsangMode ==
                                                                          'सत्संग'
                                                                      ? Color(
                                                                          0xFFF8DEB5)
                                                                      : Color(
                                                                          0xFFFBF3E7),
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cdhxkell' /* सत्संग */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'heders',
                                                                          color:
                                                                              Color(0xFF080808),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
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
                                                              _model.selectedSatsangMode =
                                                                  'पुरातन सत्संग संग्रह';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                ),
                                                              ),
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model
                                                                              .selectedSatsangMode ==
                                                                          'पुरातन सत्संग संग्रह'
                                                                      ? Color(
                                                                          0xFFF8DEB5)
                                                                      : Color(
                                                                          0xFFFBF3E7),
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '5lm61ovr' /* पुरातन सत्संग संग्रह */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'heders',
                                                                          color:
                                                                              Color(0xFF080808),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
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
                                                              _model.selectedSatsangMode =
                                                                  'सभी';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                ),
                                                              ),
                                                              child: Container(
                                                                width: 200.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model
                                                                              .selectedSatsangMode ==
                                                                          'सभी'
                                                                      ? Color(
                                                                          0xFFF8DEB5)
                                                                      : Color(
                                                                          0xFFFBF3E7),
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'rlhj4yqo' /* सभी */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'heders',
                                                                          color:
                                                                              Color(0xFF080808),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
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
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFC25123),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                  if (!_model
                                                          .searchSatsangStatus &&
                                                      (_model.selectedSatsangMode !=
                                                          'सभी'))
                                                    StreamBuilder<
                                                        List<SatsangRecord>>(
                                                      stream:
                                                          querySatsangRecord(
                                                        queryBuilder:
                                                            (satsangRecord) =>
                                                                satsangRecord
                                                                    .where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          _model
                                                                              .selectedSatsangMode,
                                                                    )
                                                                    .orderBy(
                                                                        'id'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<SatsangRecord>
                                                            listViewSatsangRecordList =
                                                            snapshot.data!;

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewSatsangRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewSatsangRecord =
                                                                listViewSatsangRecordList[
                                                                    listViewIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      listViewSatsangRecord.id.toString(),
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'heders',
                                                                                          color: Color(0xFF080808),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 242.5,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Text(
                                                                                        listViewSatsangRecord.title,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'subheders',
                                                                                              color: Color(0xFF080808),
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Flexible(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      useSafeArea: true,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(context).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: AudioInfoWidget(
                                                                                              lyrics: listViewSatsangRecord.contactInfo,
                                                                                              title: listViewSatsangRecord.title, information: listViewSatsangRecord.information,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.infoCircle,
                                                                                    color: Color(0xFF080808),
                                                                                    size: 35.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.3,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    // Align(
                                                                                    //   alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                    //   child: Text("वक्ता का नाम :-",
                                                                                    //     // FFLocalizations.of(context).getText(
                                                                                    //     //   'trlpyyt0' /* वक्ता का नाम :- */,
                                                                                    //     // ),
                                                                                    //     textAlign: TextAlign.center,
                                                                                    //     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    //           fontFamily: 'subheders',
                                                                                    //           color: Color(0xFF080808),
                                                                                    //           fontSize: 14.0,
                                                                                    //           letterSpacing: 0.0,
                                                                                    //           fontWeight: FontWeight.bold,
                                                                                    //         ),
                                                                                    //   ),
                                                                                    // ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          listViewSatsangRecord.speakerName,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'subheders',
                                                                                                color: Color(0xFF080808),
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
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

                                                                                    _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.playCircle,
                                                                                    color: Color(0xFF080808),
                                                                                    size: 35.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                            // child:
                                                                            //     Text(
                                                                            //   FFLocalizations.of(context).getText(
                                                                            //     'p4fam7d3' /* टैग : */,
                                                                            //   ),
                                                                            //   textAlign: TextAlign.center,
                                                                            //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                            //         fontFamily: 'subheders',
                                                                            //         color: Color(0xFF080808),
                                                                            //         fontSize: 14.0,
                                                                            //         letterSpacing: 0.0,
                                                                            //         fontWeight: FontWeight.bold,
                                                                            //       ),
                                                                            // ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                6,
                                                                            child:
                                                                                Container(
                                                                              height: 10.0,
                                                                              decoration: BoxDecoration(),
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  // child: Text(
                                                                                  //   listViewSatsangRecord.tags,
                                                                                  //   textAlign: TextAlign.left,
                                                                                  //   maxLines: 2,
                                                                                  //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  //         fontFamily: 'subheders',
                                                                                  //         color: Color(0xFF080808),
                                                                                  //         fontSize: 15.0,
                                                                                  //         letterSpacing: 0.0,
                                                                                  //         fontWeight: FontWeight.bold,
                                                                                  //       ),
                                                                                  // ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.5,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                2.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
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
                                                  if (!_model
                                                          .searchSatsangStatus &&
                                                      (_model.selectedSatsangMode ==
                                                          'सभी'))
                                                    StreamBuilder<
                                                        List<SatsangRecord>>(
                                                      stream:
                                                          querySatsangRecord(
                                                        queryBuilder:
                                                            (satsangRecord) =>
                                                                satsangRecord
                                                                    .orderBy(
                                                                        'id'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<SatsangRecord>
                                                            listViewSatsangRecordList =
                                                            snapshot.data!;

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewSatsangRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewSatsangRecord =
                                                                listViewSatsangRecordList[
                                                                    listViewIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      listViewSatsangRecord.id.toString(),
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'heders',
                                                                                          color: Color(0xFF080808),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 242.5,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Text(
                                                                                        listViewSatsangRecord.title,
                                                                                        maxLines: 2,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'subheders',
                                                                                              color: Color(0xFF080808),
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Flexible(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      useSafeArea: true,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(context).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: AudioInfoWidget(
                                                                                              lyrics: listViewSatsangRecord.contactInfo,
                                                                                              title: listViewSatsangRecord.title,
                                                                                              information: listViewSatsangRecord.information,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.infoCircle,
                                                                                    color: Color(0xFF080808),
                                                                                    size: 35.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.3,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [

                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                    child: Text(
                                                                                      listViewSatsangRecord.speakerName,
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'subheders',
                                                                                        color: Color(0xFF080808),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),

                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
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

                                                                                    _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.playCircle,
                                                                                    color: Color(0xFF080808),
                                                                                    size: 35.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                            // child:
                                                                            //     Text(
                                                                            //   FFLocalizations.of(context).getText(
                                                                            //     'gmaq6qih' /* वक्ता का नाम :- */,
                                                                            //   ),
                                                                            //   textAlign: TextAlign.center,
                                                                            //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                            //         fontFamily: 'subheders',
                                                                            //         color: Color(0xFF080808),
                                                                            //         fontSize: 14.0,
                                                                            //         letterSpacing: 0.0,
                                                                            //         fontWeight: FontWeight.bold,
                                                                            //       ),
                                                                            // ),
                                                                          ),
                                                                          // Flexible(
                                                                          //   flex:
                                                                          //       6,
                                                                          //   child:
                                                                          //       Container(
                                                                          //     height: 10.0,
                                                                          //     decoration: BoxDecoration(),
                                                                          //     alignment: AlignmentDirectional(-1.0, 0.0),
                                                                          //     child: Align(
                                                                          //       alignment: AlignmentDirectional(-1.0, -1.0),
                                                                          //       child: Padding(
                                                                          //         padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                          //         child: Text(
                                                                          //           listViewSatsangRecord.speakerName,
                                                                          //           textAlign: TextAlign.center,
                                                                          //           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          //                 fontFamily: 'subheders',
                                                                          //                 color: Color(0xFF080808),
                                                                          //                 fontSize: 14.0,
                                                                          //                 letterSpacing: 0.0,
                                                                          //                 fontWeight: FontWeight.bold,
                                                                          //               ),
                                                                          //         ),
                                                                          //       ),
                                                                          //     ),
                                                                          //   ),
                                                                          // ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                            // child:
                                                                            //     Text(
                                                                            //   FFLocalizations.of(context).getText(
                                                                            //     'hq5qi3da' /* टैग : */,
                                                                            //   ),
                                                                            //   textAlign: TextAlign.center,
                                                                            //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                            //         fontFamily: 'subheders',
                                                                            //         color: Color(0xFF080808),
                                                                            //         fontSize: 14.0,
                                                                            //         letterSpacing: 0.0,
                                                                            //         fontWeight: FontWeight.bold,
                                                                            //       ),
                                                                            // ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                6,
                                                                            child:
                                                                                Container(
                                                                              height: 10.0,
                                                                              decoration: BoxDecoration(),
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  // child: Text(
                                                                                  //   listViewSatsangRecord.tags,
                                                                                  //   textAlign: TextAlign.left,
                                                                                  //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  //         fontFamily: 'subheders',
                                                                                  //         color: Color(0xFF080808),
                                                                                  //         fontSize: 15.0,
                                                                                  //         letterSpacing: 0.0,
                                                                                  //         fontWeight: FontWeight.bold,
                                                                                  //       ),
                                                                                  // ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.5,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                2.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
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
                                                  if (_model
                                                      .searchSatsangStatus)
                                                    Builder(
                                                      builder: (context) {
                                                        final satsangSr = _model
                                                            .simpleSearchResults2
                                                            .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              satsangSr.length,
                                                          itemBuilder: (context,
                                                              satsangSrIndex) {
                                                            final satsangSrItem =
                                                                satsangSr[
                                                                    satsangSrIndex];
                                                            return SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  satsangSrItem.id.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'heders',
                                                                                        color: Color(0xFF080808),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 242.5,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Text(
                                                                                      satsangSrItem.title,
                                                                                      maxLines: 3,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'subheders',
                                                                                            color: Color(0xFF080808),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: Container(
                                                                                height: 59.6,
                                                                                decoration: BoxDecoration(),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(1.0, -1.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              useSafeArea: true,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(context).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: AudioInfoWidget(
                                                                                                      lyrics: satsangSrItem.contactInfo,
                                                                                                      title: satsangSrItem.title,
                                                                                                      information: satsangSrItem.information,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                          child: FaIcon(
                                                                                            FontAwesomeIcons.infoCircle,
                                                                                            color: Color(0xFF080808),
                                                                                            size: 35.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Opacity(
                                                                    opacity:
                                                                        0.3,
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFC25123),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(18.0),
                                                                              bottomRight: Radius.circular(18.0),
                                                                              topLeft: Radius.circular(18.0),
                                                                              topRight: Radius.circular(18.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              // Align(
                                                                              //   alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              //   child: Text(
                                                                              //     FFLocalizations.of(context).getText(
                                                                              //       'sigbasit' /* वक्ता का नाम :- */,
                                                                              //     ),
                                                                              //     textAlign: TextAlign.center,
                                                                              //     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              //           fontFamily: 'subheders',
                                                                              //           color: Color(0xFF080808),
                                                                              //           fontSize: 14.0,
                                                                              //           letterSpacing: 0.0,
                                                                              //           fontWeight: FontWeight.bold,
                                                                              //         ),
                                                                              //   ),
                                                                              // ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    satsangSrItem.speakerName,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'subheders',
                                                                                          color: Color(0xFF080808),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                110.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  PlayerCopy2Widget.routeName,
                                                                                  queryParameters: {
                                                                                    'currentIndex': serializeParam(
                                                                                      satsangSrItem.id,
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
                                                                                      satsangSrItem.id,
                                                                                      ParamType.int,
                                                                                    ),
                                                                                    'audioref': serializeParam(
                                                                                      satsangSrItem.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );

                                                                                _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.playCircle,
                                                                                color: Color(0xFF080808),
                                                                                size: 35.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].addToStart(
                                                                              SizedBox(width: 10.0)),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          // child:
                                                                          //     Text(
                                                                          //   FFLocalizations.of(context).getText(
                                                                          //     'tz3m5i8n' /* टैग */,
                                                                          //   ),
                                                                          //   textAlign:
                                                                          //       TextAlign.center,
                                                                          //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          //         fontFamily: 'subheders',
                                                                          //         color: Color(0xFF080808),
                                                                          //         fontSize: 14.0,
                                                                          //         letterSpacing: 0.0,
                                                                          //         fontWeight: FontWeight.bold,
                                                                          //       ),
                                                                          // ),
                                                                        ),
                                                                        Flexible(
                                                                          flex:
                                                                              6,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                // child: Text(
                                                                                //   satsangSrItem.tags,
                                                                                //   textAlign: TextAlign.left,
                                                                                //   maxLines: 2,
                                                                                //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                //         fontFamily: 'subheders',
                                                                                //         color: Color(0xFF080808),
                                                                                //         fontSize: 14.0,
                                                                                //         letterSpacing: 0.0,
                                                                                //         fontWeight: FontWeight.bold,
                                                                                //       ),
                                                                                // ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].addToStart(
                                                                              SizedBox(width: 10.0)),
                                                                    ),
                                                                  ),
                                                                  Opacity(
                                                                    opacity:
                                                                        0.5,
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFC25123),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(18.0),
                                                                              bottomRight: Radius.circular(18.0),
                                                                              topLeft: Radius.circular(18.0),
                                                                              topRight: Radius.circular(18.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 260.0,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => ListView(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height: 40.5,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        200.0,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController3,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode3,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        await queryGurukalinSatsangRecordOnce()
                                                                            .then(
                                                                              (records) => _model.simpleSearchResults3 = TextSearch(
                                                                                records
                                                                                    .map(
                                                                                      (record) => TextSearchItem.fromTerms(record, [
                                                                                        record.satsangTitle!,
                                                                                        record.spakerName!,
                                                                                        record.category!,
                                                                                        record.tags!,
                                                                                        record.information!,
                                                                                        record.contactInfo!,
                                                                                        record.audioTime!,
                                                                                        record.doha!
                                                                                      ]),
                                                                                    )
                                                                                    .toList(),
                                                                              ).search(_model.textController3.text).map((r) => r.object).toList(),
                                                                            )
                                                                            .onError((_, __) => _model.simpleSearchResults3 =
                                                                                [])
                                                                            .whenComplete(() =>
                                                                                safeSetState(() {}));

                                                                        _model.searchGuruSatsangStatus =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});

                                                                        await SearchHistoryCollectionRecord
                                                                            .collection
                                                                            .doc()
                                                                            .set({
                                                                          ...createSearchHistoryCollectionRecordData(
                                                                            searchText:
                                                                                _model.textController3.text,
                                                                            category:
                                                                                'guruKarlinSatsang',
                                                                            userId:
                                                                                currentUserUid,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'timeStamp': FieldValue.serverTimestamp(),
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
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
                                                                          'zuu3b10w' /* Seach  Audio Using  Title / Si... */,
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
                                                                            color:
                                                                                Color(0xFF020202),
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
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
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        prefixIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .search_sharp,
                                                                          color:
                                                                              Color(0xFF090909),
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.alegreyaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .textController3Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
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
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController3
                                                                            ?.clear();
                                                                      });
                                                                      _model.searchGuruSatsangStatus =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              15.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              10.0)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 13.0),
                                                          // Padding(
                                                          //   padding:
                                                          //       EdgeInsetsDirectional
                                                          //           .fromSTEB(
                                                          //               0.0,
                                                          //               5.0,
                                                          //               0.0,
                                                          //               0.0),
                                                          //   child: Container(
                                                          //     width: double
                                                          //         .infinity,
                                                          //     height: 31.6,
                                                          //     decoration:
                                                          //         BoxDecoration(),
                                                          //     child: StreamBuilder<
                                                          //         List<
                                                          //             SearchHistoryCollectionRecord>>(
                                                          //       stream:
                                                          //           querySearchHistoryCollectionRecord(
                                                          //         queryBuilder: (searchHistoryCollectionRecord) =>
                                                          //             searchHistoryCollectionRecord
                                                          //                 .where(
                                                          //                   'category',
                                                          //                   isEqualTo:
                                                          //                       'guruKarlinSatsang',
                                                          //                 )
                                                          //                 .where(
                                                          //                   'user_id',
                                                          //                   isEqualTo:
                                                          //                       currentUserUid,
                                                          //                 )
                                                          //                 .orderBy(
                                                          //                     'timeStamp',
                                                          //                     descending: true),
                                                          //         limit: 7,
                                                          //       ),
                                                          //       builder: (context,
                                                          //           snapshot) {
                                                          //         // Customize what your widget looks like when it's loading.
                                                          //         if (!snapshot
                                                          //             .hasData) {
                                                          //           return Center(
                                                          //             child:
                                                          //                 SizedBox(
                                                          //               width:
                                                          //                   50.0,
                                                          //               height:
                                                          //                   50.0,
                                                          //               child:
                                                          //                   CircularProgressIndicator(
                                                          //                 valueColor:
                                                          //                     AlwaysStoppedAnimation<Color>(
                                                          //                   FlutterFlowTheme.of(context).primary,
                                                          //                 ),
                                                          //               ),
                                                          //             ),
                                                          //           );
                                                          //         }
                                                          //         List<SearchHistoryCollectionRecord>
                                                          //             rowSearchHistoryCollectionRecordList =
                                                          //             snapshot
                                                          //                 .data!;
                                                          //
                                                          //         return Row(
                                                          //           mainAxisSize:
                                                          //               MainAxisSize
                                                          //                   .max,
                                                          //           mainAxisAlignment:
                                                          //               MainAxisAlignment
                                                          //                   .spaceEvenly,
                                                          //           children: List.generate(
                                                          //               rowSearchHistoryCollectionRecordList
                                                          //                   .length,
                                                          //               (rowIndex) {
                                                          //             final rowSearchHistoryCollectionRecord =
                                                          //                 rowSearchHistoryCollectionRecordList[
                                                          //                     rowIndex];
                                                          //             return Text(
                                                          //               rowSearchHistoryCollectionRecord
                                                          //                   .searchText,
                                                          //               style: FlutterFlowTheme.of(context)
                                                          //                   .bodyMedium
                                                          //                   .override(
                                                          //                     font: GoogleFonts.alegreyaSans(
                                                          //                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          //                     ),
                                                          //                     color: Color(0xFFC25123),
                                                          //                     fontSize: 14.0,
                                                          //                     letterSpacing: 0.0,
                                                          //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          //                   ),
                                                          //             );
                                                          //           }),
                                                          //         );
                                                          //       },
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
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
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
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
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          18.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          18.0),
                                                                ),
                                                              ),
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF8DEB5),
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            18.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            18.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'eruc3yaw' /* ग्रन्थों से सत्संग */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'heders',
                                                                            color:
                                                                                Color(0xFF080808),
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
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
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFC25123),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                  if (!_model
                                                      .searchGuruSatsangStatus)
                                                    StreamBuilder<
                                                        List<
                                                            GurukalinSatsangRecord>>(
                                                      stream:
                                                          queryGurukalinSatsangRecord(
                                                        queryBuilder:
                                                            (gurukalinSatsangRecord) =>
                                                                gurukalinSatsangRecord
                                                                    .orderBy(
                                                                        'id'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<GurukalinSatsangRecord>
                                                            listViewGurukalinSatsangRecordList =
                                                            snapshot.data!;

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewGurukalinSatsangRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewGurukalinSatsangRecord =
                                                                listViewGurukalinSatsangRecordList[
                                                                    listViewIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    listViewGurukalinSatsangRecord.id.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'heders',
                                                                                          color: Color(0xFF080808),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      listViewGurukalinSatsangRecord.satsangTitle,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'subheders',
                                                                                            color: Color(0xFF080808),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Flexible(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                                                child: Container(
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                useSafeArea: true,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return GestureDetector(
                                                                                                    onTap: () {
                                                                                                      FocusScope.of(context).unfocus();
                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                    },
                                                                                                    child: Padding(
                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                      child: AudioInfoWidget(
                                                                                                        information: listViewGurukalinSatsangRecord.information,
                                                                                                        lyrics: listViewGurukalinSatsangRecord.contactInfo,
                                                                                                        title: listViewGurukalinSatsangRecord.satsangTitle,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => safeSetState(() {}));
                                                                                            },
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.infoCircle,
                                                                                              color: Color(0xFF080808),
                                                                                              size: 35.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 15.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFC25123),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Text("वक्ता का नाम :",
                                                                              // FFLocalizations.of(context).getText(
                                                                              //   'fzubh9wo' /* वक्ता  */,
                                                                              // ),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'subheders',
                                                                                    color: Color(0xFF080808),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                4,
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  height: 26.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewGurukalinSatsangRecord.spakerName,
                                                                                        'Hello'
                                                                                      ),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'subheders',
                                                                                            color: Color(0xFF080808),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
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

                                                                                _model.gurukaliSatsang = _model.gurukaliSatsang.toList().cast<GurukalinSatsangRecord>();
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.playCircle,
                                                                                color: Color(0xFF080808),
                                                                                size: 35.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].addToStart(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  // child: Text(
                                                                                  //   listViewGurukalinSatsangRecord.tags,
                                                                                  //   textAlign: TextAlign.center,
                                                                                  //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  //         fontFamily: 'subheders',
                                                                                  //         color: Color(0xFF080808),
                                                                                  //         fontSize: 14.0,
                                                                                  //         letterSpacing: 0.0,
                                                                                  //         fontWeight: FontWeight.bold,
                                                                                  //       ),
                                                                                  // ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].addToStart(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Opacity(
                                                                      opacity:
                                                                          0.7,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC25123),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(18.0),
                                                                                bottomRight: Radius.circular(18.0),
                                                                                topLeft: Radius.circular(18.0),
                                                                                topRight: Radius.circular(18.0),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                          ),
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
                                                  if (_model
                                                      .searchGuruSatsangStatus)
                                                    Builder(
                                                      builder: (context) {
                                                        final gurukalinSatsang =
                                                            _model
                                                                .simpleSearchResults3
                                                                .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              gurukalinSatsang
                                                                  .length,
                                                          itemBuilder: (context,
                                                              gurukalinSatsangIndex) {
                                                            final gurukalinSatsangItem =
                                                                gurukalinSatsang[
                                                                    gurukalinSatsangIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  gurukalinSatsangIndex.toString(),
                                                                                  '1',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'heders',
                                                                                      color: Color(0xFF080808),
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 242.5,
                                                                                    constraints: BoxConstraints(
                                                                                      maxWidth: 250.0,
                                                                                    ),
                                                                                    decoration: BoxDecoration(),
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Text(
                                                                                        gurukalinSatsangItem.satsangTitle,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'subheders',
                                                                                              color: Color(0xFF080808),
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                                                child: Container(
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
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
                                                                                                useSafeArea: true,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return GestureDetector(
                                                                                                    onTap: () {
                                                                                                      FocusScope.of(context).unfocus();
                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                    },
                                                                                                    child: Padding(
                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                      child: AudioInfoWidget(
                                                                                                        lyrics: gurukalinSatsangItem.contactInfo,
                                                                                                        title: gurukalinSatsangItem.satsangTitle,
                                                                                                        information: gurukalinSatsangItem.information,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => safeSetState(() {}));
                                                                                            },
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.infoCircle,
                                                                                              color: Color(0xFF080808),
                                                                                              size: 35.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 15.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFC25123),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          // Flexible(
                                                                          //   flex:
                                                                          //       4,
                                                                          //   child:
                                                                          //       Align(
                                                                          //     alignment: AlignmentDirectional(-1.0, 1.0),
                                                                          //     child: Container(
                                                                          //       height: 26.0,
                                                                          //       decoration: BoxDecoration(),
                                                                          //       alignment: AlignmentDirectional(1.0, 0.0),
                                                                          //       child: Align(
                                                                          //         alignment: AlignmentDirectional(-1.0, 0.0),
                                                                          //         child: Text(
                                                                          //           valueOrDefault<String>(
                                                                          //             gurukalinSatsangItem.lastListnedDateTime?.toString(),
                                                                          //             'अभी तक नहीं सुना',
                                                                          //           ),
                                                                          //           textAlign: TextAlign.center,
                                                                          //           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          //                 fontFamily: 'subheders',
                                                                          //                 color: Color(0xFF080808),
                                                                          //                 fontSize: 14.0,
                                                                          //                 letterSpacing: 0.0,
                                                                          //                 fontWeight: FontWeight.bold,
                                                                          //               ),
                                                                          //         ),
                                                                          //       ),
                                                                          //     ),
                                                                          //   ),
                                                                          // ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  PlayerCopy2CopyWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'id': serializeParam(
                                                                                      gurukalinSatsangItem.id,
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

                                                                                _model.gurukaliSatsang = _model.gurukaliSatsang.toList().cast<GurukalinSatsangRecord>();
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.playCircle,
                                                                                color: Color(0xFF080808),
                                                                                size: 25.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].addToStart(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  // child: Text(
                                                                                  //   valueOrDefault<String>(
                                                                                  //     gurukalinSatsangIndex.toString(),
                                                                                  //     'hello',
                                                                                  //   ),
                                                                                  //   textAlign: TextAlign.center,
                                                                                  //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  //         fontFamily: 'subheders',
                                                                                  //         color: Color(0xFF080808),
                                                                                  //         fontSize: 14.0,
                                                                                  //         letterSpacing: 0.0,
                                                                                  //         fontWeight: FontWeight.bold,
                                                                                  //       ),
                                                                                  // ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].addToStart(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFC25123),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(18.0),
                                                                              bottomRight: Radius.circular(18.0),
                                                                              topLeft: Radius.circular(18.0),
                                                                              topRight: Radius.circular(18.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
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
                                                  Container(
                                                    width: double.infinity,
                                                    height: 80.0,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: ListView(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  // scrollDirection:
                                                  //     Axis.vertical,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          height: 40.5,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 200.0,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController4,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode4,
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      await queryAudioBookRecordOnce()
                                                                          .then(
                                                                            (records) =>
                                                                                _model.simpleSearchResults4 = TextSearch(
                                                                              records
                                                                                  .map(
                                                                                    (record) => TextSearchItem.fromTerms(record, [
                                                                                      record.bookName!,
                                                                                      record.bookAuther!
                                                                                    ]),
                                                                                  )
                                                                                  .toList(),
                                                                            ).search(_model.textController4.text).map((r) => r.object).toList(),
                                                                          )
                                                                          .onError((_, __) => _model.simpleSearchResults4 =
                                                                              [])
                                                                          .whenComplete(() =>
                                                                              safeSetState(() {}));

                                                                      _model.searchAudioBook =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});

                                                                      await SearchHistoryCollectionRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set({
                                                                        ...createSearchHistoryCollectionRecordData(
                                                                          searchText: _model
                                                                              .textController4
                                                                              .text,
                                                                          category:
                                                                              'audioBook',
                                                                          userId:
                                                                              currentUserUid,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'timeStamp':
                                                                                FieldValue.serverTimestamp(),
                                                                          },
                                                                        ),
                                                                      });
                                                                    },
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.alegreyaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0x02080808),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '163cyr5i' /* Seach  Audio Using  Title / Si... */,
                                                                      ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.alegreyaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF090909),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFF020202),
                                                                          width:
                                                                              1.0,
                                                                        ),
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
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
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
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
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
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
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
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .search_sharp,
                                                                        color: Color(
                                                                            0xFF090909),
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.alegreyaSans(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .textController4Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .textController4
                                                                          ?.clear();
                                                                    });
                                                                    _model.searchAudioBook =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ]
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            15.0))
                                                                .addToEnd(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                          ),
                                                        ),
                                                        SizedBox(height: 16.0),
                                                        // Padding(
                                                        //   padding:
                                                        //       EdgeInsetsDirectional
                                                        //           .fromSTEB(
                                                        //               0.0,
                                                        //               5.0,
                                                        //               0.0,
                                                        //               0.0),
                                                        //   child: Container(
                                                        //     width:
                                                        //         double.infinity,
                                                        //     height: 31.6,
                                                        //     decoration:
                                                        //         BoxDecoration(),
                                                        //     child: StreamBuilder<
                                                        //         List<
                                                        //             SearchHistoryCollectionRecord>>(
                                                        //       stream:
                                                        //           querySearchHistoryCollectionRecord(
                                                        //         queryBuilder: (searchHistoryCollectionRecord) =>
                                                        //             searchHistoryCollectionRecord
                                                        //                 .where(
                                                        //                   'category',
                                                        //                   isEqualTo:
                                                        //                       'audioBook',
                                                        //                 )
                                                        //                 .where(
                                                        //                   'user_id',
                                                        //                   isEqualTo:
                                                        //                       currentUserUid,
                                                        //                 )
                                                        //                 .orderBy(
                                                        //                     'timeStamp',
                                                        //                     descending:
                                                        //                         true),
                                                        //         limit: 7,
                                                        //       ),
                                                        //       builder: (context,
                                                        //           snapshot) {
                                                        //         // Customize what your widget looks like when it's loading.
                                                        //         if (!snapshot
                                                        //             .hasData) {
                                                        //           return Center(
                                                        //             child:
                                                        //                 SizedBox(
                                                        //               width:
                                                        //                   50.0,
                                                        //               height:
                                                        //                   50.0,
                                                        //               child:
                                                        //                   CircularProgressIndicator(
                                                        //                 valueColor:
                                                        //                     AlwaysStoppedAnimation<Color>(
                                                        //                   FlutterFlowTheme.of(context)
                                                        //                       .primary,
                                                        //                 ),
                                                        //               ),
                                                        //             ),
                                                        //           );
                                                        //         }
                                                        //         List<SearchHistoryCollectionRecord>
                                                        //             rowSearchHistoryCollectionRecordList =
                                                        //             snapshot
                                                        //                 .data!;
                                                        //
                                                        //         return Row(
                                                        //           mainAxisSize:
                                                        //               MainAxisSize
                                                        //                   .max,
                                                        //           mainAxisAlignment:
                                                        //               MainAxisAlignment
                                                        //                   .spaceEvenly,
                                                        //           children: List.generate(
                                                        //               rowSearchHistoryCollectionRecordList
                                                        //                   .length,
                                                        //               (rowIndex) {
                                                        //             final rowSearchHistoryCollectionRecord =
                                                        //                 rowSearchHistoryCollectionRecordList[
                                                        //                     rowIndex];
                                                        //             return Text(
                                                        //               rowSearchHistoryCollectionRecord
                                                        //                   .searchText,
                                                        //               style: FlutterFlowTheme.of(
                                                        //                       context)
                                                        //                   .bodyMedium
                                                        //                   .override(
                                                        //                     font:
                                                        //                         GoogleFonts.alegreyaSans(
                                                        //                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        //                     ),
                                                        //                     color:
                                                        //                         Color(0xFFC25123),
                                                        //                     fontSize:
                                                        //                         14.0,
                                                        //                     letterSpacing:
                                                        //                         0.0,
                                                        //                     fontWeight:
                                                        //                         FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        //                     fontStyle:
                                                        //                         FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        //                   ),
                                                        //             );
                                                        //           }),
                                                        //         );
                                                        //       },
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFC25123),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      2.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              18.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              18.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              18.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              18.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFF8DEB5),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(18.0),
                                                                        bottomRight:
                                                                            Radius.circular(18.0),
                                                                        topLeft:
                                                                            Radius.circular(18.0),
                                                                        topRight:
                                                                            Radius.circular(18.0),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '0qmhp2k7' /* ऑडियो पुस्तकें */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'heders',
                                                                                color: Color(0xFF080808),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (!_model.searchAudioBook)
                                                      StreamBuilder<
                                                          List<
                                                              AudioBookRecord>>(
                                                        stream:
                                                            queryAudioBookRecord(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<AudioBookRecord>
                                                              listViewAudioBookRecordList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewAudioBookRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewAudioBookRecord =
                                                                  listViewAudioBookRecordList[
                                                                      listViewIndex];
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              360.0,
                                                                          height:
                                                                              300.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 320.0,
                                                                                  height: 250.0,
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
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFFC25123),
                                                                                      width: 4.0,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            flex: 2,
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Container(
                                                                                                width: 60.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        context.pushNamed(
                                                                                                          Book2Widget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'audioDocumnetRef': serializeParam(
                                                                                                              listViewAudioBookRecord.reference,
                                                                                                              ParamType.DocumentReference,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.play_circle,
                                                                                                        color: Color(0xFFC25123),
                                                                                                        size: 30.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    InkWell(
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
                                                                                                            return GestureDetector(
                                                                                                              onTap: () {
                                                                                                                FocusScope.of(context).unfocus();
                                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                                              },
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: AudioLyricsWidget(
                                                                                                                  lyrics: listViewAudioBookRecord.audioLyrics,
                                                                                                                  title: listViewAudioBookRecord.bookName,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.menu_book_outlined,
                                                                                                        color: Color(0xFFC25123),
                                                                                                        size: 30.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Builder(
                                                                                                      builder: (context) => InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await Share.share(
                                                                                                            listViewAudioBookRecord.audioBookUrl,
                                                                                                            sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                                          );
                                                                                                        },
                                                                                                        child: FaIcon(
                                                                                                          FontAwesomeIcons.share,
                                                                                                          color: Color(0xFFC25123),
                                                                                                          size: 30.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex: 6,
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: 280.0,
                                                                                                height: 180.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                      child: Image.network(
                                                                                                        valueOrDefault<String>(
                                                                                                          listViewAudioBookRecord.bookImage,
                                                                                                          'https://th.bing.com/th/id/OIP.V1c3GcNmZcg6BUtFrGT8rQHaGM?rs=1&pid=ImgDetMain',
                                                                                                        ),
                                                                                                        width: 200.0,
                                                                                                        height: 190.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                        alignment: Alignment(0.0, 0.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex: 2,
                                                                                            child: Container(
                                                                                              width: 60.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      ToggleIcon(
                                                                                                        onPressed: () async {
                                                                                                          final favouriteByElement = currentUserReference;
                                                                                                          final favouriteByUpdate = listViewAudioBookRecord.favouriteBy.contains(favouriteByElement) ? FieldValue.arrayRemove([favouriteByElement]) : FieldValue.arrayUnion([favouriteByElement]);
                                                                                                          await listViewAudioBookRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'favourite_by': favouriteByUpdate,
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          if (listViewAudioBookRecord.favouriteBy.contains(currentUserReference) == true) {
                                                                                                            await listViewAudioBookRecord.reference.update({
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'favourite_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return AlertDialog(
                                                                                                                  title: Text('Deleted'),
                                                                                                                  content: Text('The item is removed from favorite'),
                                                                                                                  actions: [
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                      child: Text('Ok'),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            );
                                                                                                          } else {
                                                                                                            await listViewAudioBookRecord.reference.update({
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'favourite_by': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return AlertDialog(
                                                                                                                  title: Text('Added'),
                                                                                                                  content: Text('The item is added to favorite'),
                                                                                                                  actions: [
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                      child: Text('Ok'),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                        value: listViewAudioBookRecord.favouriteBy.contains(currentUserReference),
                                                                                                        onIcon: Icon(
                                                                                                          Icons.favorite,
                                                                                                          color: Color(0xFFC25123),
                                                                                                          size: 32.0,
                                                                                                        ),
                                                                                                        offIcon: Icon(
                                                                                                          Icons.favorite_border,
                                                                                                          color: Color(0xFFC25123),
                                                                                                          size: 32.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () {
                                                                                                                  FocusScope.of(context).unfocus();
                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                },
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: AudioInfoWidget(
                                                                                                                    lyrics: listViewAudioBookRecord.bookInfo,
                                                                                                                    title: listViewAudioBookRecord.bookName,
                                                                                                                    information: listViewAudioBookRecord.bookInfo,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.info_sharp,
                                                                                                          color: Color(0xFFC25123),
                                                                                                          size: 30.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
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
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                2.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 150.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFF8DEB5),
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
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFC25123),
                                                                                  width: 3.0,
                                                                                ),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                listViewAudioBookRecord.bookName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.alegreyaSans(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              0.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                                    if (_model.searchAudioBook)
                                                      Builder(
                                                        builder: (context) {
                                                          final audiobook = _model
                                                              .simpleSearchResults4
                                                              .toList();

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: audiobook
                                                                .length,
                                                            itemBuilder: (context,
                                                                audiobookIndex) {
                                                              final audiobookItem =
                                                                  audiobook[
                                                                      audiobookIndex];
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              360.0,
                                                                          height:
                                                                              300.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 320.0,
                                                                                  height: 250.0,
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
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFFC25123),
                                                                                      width: 4.0,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            flex: 2,
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Container(
                                                                                                width: 60.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        context.pushNamed(
                                                                                                          Book2Widget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'audioDocumnetRef': serializeParam(
                                                                                                              audiobookItem.reference,
                                                                                                              ParamType.DocumentReference,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.play_circle,
                                                                                                        color: Color(0xFFC25123),
                                                                                                        size: 30.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return GestureDetector(
                                                                                                              onTap: () {
                                                                                                                FocusScope.of(context).unfocus();
                                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                                              },
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: AudioLyricsWidget(
                                                                                                                  lyrics: audiobookItem.audioLyrics,
                                                                                                                  title: audiobookItem.bookName,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.menu_book_outlined,
                                                                                                        color: Color(0xFFC25123),
                                                                                                        size: 30.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        await launchURL('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
                                                                                                      },
                                                                                                      child: FaIcon(
                                                                                                        FontAwesomeIcons.share,
                                                                                                        color: Color(0xFFC25123),
                                                                                                        size: 30.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex: 6,
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: 280.0,
                                                                                                height: 180.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                                    child: Image.network(
                                                                                                      valueOrDefault<String>(
                                                                                                        audiobookItem.bookImage,
                                                                                                        'https://th.bing.com/th/id/OIP.V1c3GcNmZcg6BUtFrGT8rQHaGM?rs=1&pid=ImgDetMain',
                                                                                                      ),
                                                                                                      width: 200.0,
                                                                                                      height: 190.0,
                                                                                                      fit: BoxFit.fill,
                                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex: 2,
                                                                                            child: Container(
                                                                                              width: 60.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () {
                                                                                                                  FocusScope.of(context).unfocus();
                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                },
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: AudioInfoWidget(
                                                                                                                    lyrics: audiobookItem.bookInfo,
                                                                                                                    title: audiobookItem.bookName,
                                                                                                                    information: audiobookItem.bookInfo,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.info_sharp,
                                                                                                          color: Color(0xFFC25123),
                                                                                                          size: 30.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
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
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                2.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 150.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFF8DEB5),
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
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFC25123),
                                                                                  width: 3.0,
                                                                                ),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                audiobookItem.bookName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.alegreyaSans(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              0.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                                    Container(
                                                      width: double.infinity,
                                                      height: 260.0,
                                                      decoration: BoxDecoration(),
                                                    ),
                                                  ],
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                Column(
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
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.footrModel,
                        updateCallback: () => safeSetState(() {}),
                        child: FootrWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
