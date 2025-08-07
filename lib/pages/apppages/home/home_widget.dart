import '/auth/firebase_auth/auth_util.dart';
import '/components/homepage_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import '/pages/maglacharan/maglacharan_widget.dart';
import '/pages/popupcomponent/allpopfiles/allpopfiles_widget.dart';
import '/pages/popupcomponent/chintaman/chintaman_widget.dart';
import '/pages/popupcomponent/mahaarti/mahaarti_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/pages/popupcomponent/mahamantra/mahamantra_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';
import 'package:go_router/go_router.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentPage = 0;
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
                    // added
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        // onTap: () async {
                        //   Navigator.pop(context);
                        //
                        //   context.pushNamed(
                        //       GuruJiKaJivanAndSadhnaWidget.routeName);
                        // },

                        onTap: ()async{
                          Navigator.pop(context);
                            context.pushNamed(PhotoLocationWidget.routeName);
                          },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.place,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'इवेंट्स,लोकेशन',
                                // FFLocalizations.of(context).getText(
                                //   "इवेंट्स,लोकेशन",
                                // ),
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
                        // onTap: () async {
                        //   Navigator.pop(context);
                        //
                        //   context.pushNamed(
                        //       GuruJiKaJivanAndSadhnaWidget.routeName);
                        // },

                        onTap: ()async{
                          Navigator.pop(context);
                          context.pushNamed(PhotoLocationWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.place,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'इवेंट्स,लोकेशन',
                                // FFLocalizations.of(context).getText(
                                //   "इवेंट्स,लोकेशन",
                                // ),
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
                        // onTap: () async {
                        //   Navigator.pop(context);
                        //
                        //   context.pushNamed(
                        //       GuruJiKaJivanAndSadhnaWidget.routeName);
                        // },

                        onTap: ()async{
                          Navigator.pop(context);
                          // context.pushNamed(PhotoLocationWidget.routeName);
                          context.pushNamed(NotesWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.note_alt,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'नोट',
                                // FFLocalizations.of(context).getText(
                                //   "इवेंट्स,लोकेशन",
                                // ),
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

                    // added end
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
                    if(FFAppState().islogin)
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
                                    style: FlutterFlowTheme
                                        .of(context)
                                        .bodyMedium
                                        .override(
                                      font: GoogleFonts.alegreyaSans(
                                        fontWeight: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme
                                          .of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme
                                          .of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    else
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
                              LoginPageWidget.routeName);
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
                              child: Text('लॉगिन',
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
        endDrawer: AnimatedOpacity(
          opacity: 0.9,
          duration: 2000.0.ms,
          curve: Curves.easeInOut,
          child: Container(
            width: 65.0,
            child: Drawer(
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.02, -0.4),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 85.0, 0.0, 0.0),
                          child: Container(
                            width: 90.8,
                            height: 618.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 55.8,
                                        height: 616.8,
                                        decoration: BoxDecoration(
                                          color: Color(0xE6B04E06),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(25.0),
                                            bottomRight: Radius.circular(25.0),
                                            topLeft: Radius.circular(25.0),
                                            topRight: Radius.circular(25.0),
                                          ),
                                        ),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0.0, 10.0, 0.0, 20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 1.0,
                                                        0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                      Colors.transparent,
                                                      focusColor:
                                                      Colors.transparent,
                                                      hoverColor:
                                                      Colors.transparent,
                                                      highlightColor:
                                                      Colors.transparent,
                                                      // onTap: () async {
                                                      //   await actions
                                                      //       .playSingleLoop(
                                                      //     'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767713825000.mp3?alt=media&token=2a71dcba-4b54-46b2-bd43-8bac945870f3',
                                                      //   );
                                                      // },
                                                      onTap: () async {
                                                        final currentId = 'song1';

                                                        if (_model.playingSongId == currentId) {
                                                          // Stop the audio
                                                          // setState(() => _model.isPlaying = false);
                                                          setState(() {
                                                            _model.playingSongId = null;
                                                          });
                                                          await actions.stopAudio(); // replace with your stop action
                                                          // _model.isPlaying = false;
                                                        } else {
                                                          await actions.stopAudio();
                                                          // setState(() => _model.isPlaying = true);
                                                          setState(() {
                                                            _model.playingSongId = currentId;
                                                          });
                                                          // Play the audio in loop
                                                          await actions.playSingleLoop(
                                                            'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767713825000.mp3?alt=media&token=2a71dcba-4b54-46b2-bd43-8bac945870f3',
                                                          );
                                                          // _model.isPlaying = true;
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 30.0, // taller pill shape like your image
                                                        decoration: BoxDecoration(
                                                          // color: _model.isPlaying ? Color(0xFFD2691E) : Color(0xFFB87333), // two orange/brown shades
                                                          color: _model.playingSongId == 'song1' ? Color(0xFFD2691E) : Color(0xFFB87333),
                                                          borderRadius: BorderRadius.circular(24.0), // pill shape
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.black26,
                                                              blurRadius: 6,
                                                              offset: Offset(0, 3),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Center(
                                                          child: Icon(
                                                            // _model.isPlaying ? Icons.stop : Icons.play_arrow,
                                                            _model.playingSongId == 'song1' ? Icons.stop : Icons.play_arrow,
                                                            color: Colors.yellow.shade200, // light yellow icon
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                        true,
                                                        backgroundColor:
                                                        Colors.transparent,
                                                        barrierColor:
                                                        Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                  context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                  context),
                                                              child:
                                                              MahamantraWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5,
                                                      decoration: BoxDecoration(),
                                                      child: Icon(
                                                        Icons.menu_book,      // or Icons.book / Icons.menu_book_outlined
                                                        color: Colors.white,  // choose your preferred color
                                                        size: 30.0,           // adjust size as you like
                                                      ),
                                                    ),

                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 30.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: ClipRRect(
                                                    //     borderRadius:
                                                    //     BorderRadius
                                                    //         .circular(8.0),
                                                    //     child: Image.asset(
                                                    //       'assets/images/Samtawad_UIUX_(25).png',
                                                    //       width: 200.0,
                                                    //       height: 0.0,
                                                    //       fit: BoxFit.fill,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 30.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      final currentId = 'song2';
                                                      // await actions
                                                      //     .playAudioOnce(
                                                      //   'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767713825000.mp3?alt=media&token=2a71dcba-4b54-46b2-bd43-8bac945870f3',
                                                      // );
                                                      if (_model.playingSongId == currentId) {
                                                        // This song is playing → stop it
                                                        setState(() {
                                                          _model.playingSongId = null;
                                                        });
                                                        await actions.stopAudio();
                                                      } else {
                                                        // Another song might be playing → stop first
                                                        await actions.stopAudio();
                                                        // Now play this one
                                                        setState(() {
                                                          _model.playingSongId = currentId;
                                                        });
                                                        await actions.playAudioOnce(
                                                          'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767713825000.mp3?alt=media&token=2a71dcba-4b54-46b2-bd43-8bac945870f3',
                                                        );
                                                      }
                                                    },
                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 30.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: ClipRRect(
                                                    //     borderRadius:
                                                    //     BorderRadius
                                                    //         .circular(8.0),
                                                    //     child: Image.asset(
                                                    //       'assets/images/Samtawad_UIUX_(24).png',
                                                    //       width: 200.0,
                                                    //       height: 0.0,
                                                    //       fit: BoxFit.fill,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5, // taller for pill look
                                                      decoration: BoxDecoration(
                                                        color: _model.playingSongId == 'song2' ? Color(0xFFD2691E) : Color(0xFFB87333),
                                                        borderRadius: BorderRadius.circular(24.0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black26,
                                                            blurRadius: 6,
                                                            offset: Offset(0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          _model.playingSongId == 'song2' ? Icons.stop : Icons.play_arrow,
                                                          color: Colors.yellow.shade200,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                        true,
                                                        backgroundColor:
                                                        Colors.transparent,
                                                        barrierColor:
                                                        Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                  context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                  context),
                                                              child:
                                                              MaglacharanWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5,
                                                      decoration: BoxDecoration(),
                                                      child: Icon(
                                                        Icons.menu_book,      // or Icons.book / Icons.menu_book_outlined
                                                        color: Colors.white,  // choose your preferred color
                                                        size: 30.0,           // adjust size as you like
                                                      ),
                                                    ),
                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 30.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: ClipRRect(
                                                    //     borderRadius:
                                                    //     BorderRadius
                                                    //         .circular(8.0),
                                                    //     child: Image.asset(
                                                    //       'assets/images/Samtawad_UIUX_(25).png',
                                                    //       width: 200.0,
                                                    //       height: 0.0,
                                                    //       fit: BoxFit.fill,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 30.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      final currentId = 'song3';
                                                      // await actions
                                                      //     .playAudioOnce(
                                                      //   'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767584194000.mp3?alt=media&token=6a868652-cb05-4b24-84f7-5e8b06b374c7',
                                                      // );
                                                      if (_model.playingSongId == currentId) {
                                                        // This song is playing → stop it
                                                        setState(() {
                                                          _model.playingSongId = null;
                                                        });
                                                        await actions.stopAudio();
                                                      } else {
                                                        // Another song might be playing → stop first
                                                        await actions.stopAudio();
                                                        // Now play this one
                                                        setState(() {
                                                          _model.playingSongId = currentId;
                                                        });
                                                        await actions.playAudioOnce(
                                                          'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767584194000.mp3?alt=media&token=6a868652-cb05-4b24-84f7-5e8b06b374c7',
                                                        );

                                                      }
                                                    },
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5, // taller for pill look
                                                      decoration: BoxDecoration(
                                                        color: _model.playingSongId == 'song3' ? Color(0xFFD2691E) : Color(0xFFB87333),
                                                        borderRadius: BorderRadius.circular(24.0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black26,
                                                            blurRadius: 6,
                                                            offset: Offset(0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          _model.playingSongId == 'song3' ? Icons.stop : Icons.play_arrow,
                                                          color: Colors.yellow.shade200,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ),
                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 30.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: ClipRRect(
                                                    //     borderRadius:
                                                    //     BorderRadius
                                                    //         .circular(8.0),
                                                    //     child: Image.asset(
                                                    //       'assets/images/Samtawad_UIUX_(24).png',
                                                    //       width: 200.0,
                                                    //       height: 0.0,
                                                    //       fit: BoxFit.fill,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                        true,
                                                        backgroundColor:
                                                        Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                  context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                  context),
                                                              child:
                                                              ChintamanWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5,
                                                      decoration: BoxDecoration(),
                                                      child: Icon(
                                                        Icons.menu_book,      // or Icons.book / Icons.menu_book_outlined
                                                        color: Colors.white,  // choose your preferred color
                                                        size: 30.0,           // adjust size as you like
                                                      ),
                                                    ),
                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 30.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: ClipRRect(
                                                    //     borderRadius:
                                                    //     BorderRadius
                                                    //         .circular(8.0),
                                                    //     child: Image.asset(
                                                    //       'assets/images/Samtawad_UIUX_(25).png',
                                                    //       width: 200.0,
                                                    //       height: 0.0,
                                                    //       fit: BoxFit.fill,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 30.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    // onTap: () async {
                                                    //   await actions
                                                    //       .playAudioOnce(
                                                    //     'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767449982000.mp3?alt=media&token=5f9f819a-f046-437f-8550-dee5b3ee2df1',
                                                    //   );
                                                    // },
                                                    onTap: () async {
                                                      final currentId = 'song4'; // unique id for this button/song

                                                      if (_model.playingSongId == currentId) {
                                                        // This song is playing → stop it
                                                        setState(() {
                                                          _model.playingSongId = null;
                                                        });
                                                        await actions.stopAudio();
                                                      } else {
                                                        // Another song might be playing → stop first
                                                        await actions.stopAudio();
                                                        // Now play this one
                                                        setState(() {
                                                          _model.playingSongId = currentId;
                                                        });
                                                        await actions.playAudioOnce(
                                                          'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767449982000.mp3?alt=media&token=5f9f819a-f046-437f-8550-dee5b3ee2df1',
                                                        );

                                                      }
                                                    },
                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 30.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: ClipRRect(
                                                    //     borderRadius:
                                                    //     BorderRadius
                                                    //         .circular(8.0),
                                                    //     child: Image.asset(
                                                    //       'assets/images/Samtawad_UIUX_(24).png',
                                                    //       width: 200.0,
                                                    //       height: 0.0,
                                                    //       fit: BoxFit.fill,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5, // taller for pill look
                                                      decoration: BoxDecoration(
                                                        color: _model.playingSongId == 'song4' ? Color(0xFFD2691E) : Color(0xFFB87333),
                                                        borderRadius: BorderRadius.circular(24.0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black26,
                                                            blurRadius: 6,
                                                            offset: Offset(0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          _model.playingSongId == 'song4' ? Icons.stop : Icons.play_arrow,
                                                          color: Colors.yellow.shade200,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                        true,
                                                        backgroundColor:
                                                        Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                  context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                  context),
                                                              child:
                                                              MahaartiWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5,
                                                      decoration: BoxDecoration(),
                                                      child: Icon(
                                                        Icons.menu_book,      // or Icons.book / Icons.menu_book_outlined
                                                        color: Colors.white,  // choose your preferred color
                                                        size: 30.0,           // adjust size as you like
                                                      ),
                                                    ),

                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 30.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: ClipRRect(
                                                    //     borderRadius:
                                                    //     BorderRadius
                                                    //         .circular(8.0),
                                                    //     child: Image.asset(
                                                    //       'assets/images/Samtawad_UIUX_(25).png',
                                                    //       width: 200.0,
                                                    //       height: 0.0,
                                                    //       fit: BoxFit.fill,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 30.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    // onTap: () async {
                                                    //   await actions
                                                    //       .playAudioOnce(
                                                    //     'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767449982000.mp3?alt=media&token=5f9f819a-f046-437f-8550-dee5b3ee2df1',
                                                    //   );
                                                    // },
                                                    onTap: () async {
                                                      final currentId = 'song5'; // unique id for this button/song

                                                      if (_model.playingSongId == currentId) {
                                                        // This song is playing → stop it
                                                        setState(() {
                                                          _model.playingSongId = null;
                                                        });
                                                        await actions.stopAudio();
                                                      } else {
                                                        // Another song might be playing → stop first
                                                        await actions.stopAudio();
                                                        // Now play this one
                                                        setState(() {
                                                          _model.playingSongId = currentId;
                                                        });
                                                        await actions.playAudioOnce(
                                                          'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FTH16eFQ5UvejgdAsdG78FypPWll2%2Fuploads%2F1752767449982000.mp3?alt=media&token=5f9f819a-f046-437f-8550-dee5b3ee2df1',
                                                        );

                                                      }
                                                    },
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5, // taller for pill look
                                                      decoration: BoxDecoration(
                                                        color: _model.playingSongId == 'song5' ? Color(0xFFD2691E) : Color(0xFFB87333),
                                                        borderRadius: BorderRadius.circular(24.0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black26,
                                                            blurRadius: 6,
                                                            offset: Offset(0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          _model.playingSongId == 'song5' ? Icons.stop : Icons.play_arrow,
                                                          color: Colors.yellow.shade200,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ),
                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 28.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: Padding(
                                                    //     padding:
                                                    //     EdgeInsetsDirectional
                                                    //         .fromSTEB(
                                                    //         2.0,
                                                    //         0.0,
                                                    //         2.0,
                                                    //         0.0),
                                                    //     child: ClipRRect(
                                                    //       borderRadius:
                                                    //       BorderRadius
                                                    //           .circular(
                                                    //           8.0),
                                                    //       child: Image.asset(
                                                    //         'assets/images/Saved_4302025_of_Samtawad_UIUX_(2).png',
                                                    //         width: 200.0,
                                                    //         height: 0.0,
                                                    //         fit: BoxFit.fill,
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                        true,
                                                        backgroundColor:
                                                        Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                  context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                  context),
                                                              child:
                                                              AllpopfilesWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 45.0,
                                                      height: 30.5,
                                                      decoration: BoxDecoration(),
                                                      child: Icon(
                                                        Icons.menu_book,      // or Icons.book / Icons.menu_book_outlined
                                                        color: Colors.white,  // choose your preferred color
                                                        size: 30.0,           // adjust size as you like
                                                      ),
                                                    ),
                                                    // child: Container(
                                                    //   width: 45.0,
                                                    //   height: 28.5,
                                                    //   decoration:
                                                    //   BoxDecoration(),
                                                    //   child: Padding(
                                                    //     padding:
                                                    //     EdgeInsetsDirectional
                                                    //         .fromSTEB(
                                                    //         3.0,
                                                    //         0.0,
                                                    //         2.0,
                                                    //         0.0),
                                                    //     child: ClipRRect(
                                                    //       borderRadius:
                                                    //       BorderRadius
                                                    //           .circular(
                                                    //           8.0),
                                                    //       child: Image.asset(
                                                    //         'assets/images/Saved_4302025_of_Samtawad_UIUX_(3).png',
                                                    //         width: 200.0,
                                                    //         height: 0.0,
                                                    //         fit: BoxFit.fill,
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 30.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Align(
                                //   alignment: AlignmentDirectional(1.44, -0.59),
                                //   child: Container(
                                //     width: 39.0,
                                //     height: 14.0,
                                //     decoration: BoxDecoration(),
                                //     child: ClipRRect(
                                //       borderRadius: BorderRadius.circular(8.0),
                                //       child: Image.asset(
                                //         'assets/images/Samtawad_UIUX_(26).png',
                                //         width: 200.0,
                                //         height: 200.0,
                                //         fit: BoxFit.cover,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Align(
                                //   alignment: AlignmentDirectional(1.69, -0.2),
                                //   child: Padding(
                                //     padding: EdgeInsetsDirectional.fromSTEB(
                                //         0.0, 0.0, 1.0, 0.0),
                                //     child: Container(
                                //       width: 40.0,
                                //       height: 14.0,
                                //       decoration: BoxDecoration(),
                                //       child: ClipRRect(
                                //         borderRadius:
                                //         BorderRadius.circular(8.0),
                                //         child: Image.asset(
                                //           'assets/images/Samtawad_UIUX_(26).png',
                                //           width: 200.0,
                                //           height: 200.0,
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Align(
                                //   alignment: AlignmentDirectional(1.22, 0.19),
                                //   child: Container(
                                //     width: 40.0,
                                //     height: 14.0,
                                //     decoration: BoxDecoration(),
                                //     child: ClipRRect(
                                //       borderRadius: BorderRadius.circular(8.0),
                                //       child: Image.asset(
                                //         'assets/images/Samtawad_UIUX_(26).png',
                                //         width: 200.0,
                                //         height: 200.0,
                                //         fit: BoxFit.cover,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Align(
                                //   alignment: AlignmentDirectional(1.22, 0.6),
                                //   child: Container(
                                //     width: 40.0,
                                //     height: 14.0,
                                //     decoration: BoxDecoration(),
                                //     child: ClipRRect(
                                //       borderRadius: BorderRadius.circular(8.0),
                                //       child: Image.asset(
                                //         'assets/images/Samtawad_UIUX_(26).png',
                                //         width: 200.0,
                                //         height: 200.0,
                                //         fit: BoxFit.cover,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (scaffoldKey.currentState!.isDrawerOpen ||
                                  scaffoldKey.currentState!.isEndDrawerOpen) {
                                Navigator.pop(context);
                              }
                            },
                            child: Icon(
                              Icons.close_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: AlignmentDirectional(0.0, -1.0),
                      //   child: Padding(
                      //     padding: EdgeInsetsDirectional.fromSTEB(
                      //         0.0, 75.0, 0.0, 0.0),
                      //     child: InkWell(
                      //       splashColor: Colors.transparent,
                      //       focusColor: Colors.transparent,
                      //       hoverColor: Colors.transparent,
                      //       highlightColor: Colors.transparent,
                      //       onTap: () async {
                      //         await showDialog(
                      //           context: context,
                      //           builder: (alertDialogContext) {
                      //             return AlertDialog(
                      //               title: Text('जानकारी '),
                      //               content: Text(
                      //                   'गाना चलाने के लिए एक बार क्लिक करें। बंद करने के लिए फिर से क्लिक करें।'),
                      //               actions: [
                      //                 TextButton(
                      //                   onPressed: () =>
                      //                       Navigator.pop(alertDialogContext),
                      //                   child: Text('ठीक है'),
                      //                 ),
                      //               ],
                      //             );
                      //           },
                      //         );
                      //       },
                      //       child: Icon(
                      //         Icons.info_outlined,
                      //         color: FlutterFlowTheme.of(context).primaryText,
                      //         size: 30.0,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
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
                                                            'g4tvwu2o' /* समता अपार शक्ति */,
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
                                                          'rdwa4nlo' /* ॐ ब्रह्म सत्यम सर्वाधार */,
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
              // 🔹 Main content
              Container(
                width: double.infinity,
                height: double.infinity,
                child: custom_widgets.FullPageZoomWrapper(
                  width: double.infinity,
                  height: double.infinity,
                  child: () => HomepageWidget(),
                ),
              ),

              // ✅ NowPlayingBar at bottom right (above footer)
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

              // 🔸 Footer stays bottom center
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: wrapWithModel(
                  model: _model.footrModel,
                  updateCallback: () => safeSetState(() {}),
                  child: FootrWidget(),
                ),
              ),

              // ☰ Right-side drawer open icon
              Align(
                alignment: AlignmentDirectional(0.98, -0.05),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                  child: Container(
                    width: 39.1,
                    height: 33,
                    decoration: BoxDecoration(
                      // color: Color(0xFF703102),
                      color: Color(0xFFC25123),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.om,
                          color: Color(0xFFF5F5FB),
                          size: 24,
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
    );
  }
}

