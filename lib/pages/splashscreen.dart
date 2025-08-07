import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samtawad_team/flutter_flow/flutter_flow_util.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/internationalization.dart';
import 'apppages/home/home_widget.dart';
import 'apppages/login_page/login_page_widget.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  static String roueName = 'SplashScreen';
  static String routePath = '/splashscreen';

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   if (FFAppState().islogin) {
    //     context.pushNamed(HomeWidget.routeName);
    //   } else {
    //     context.pushNamed(HomeWidget.routeName);
    //   }
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }
  Future<void> _checkLogin() async {
    await Future.delayed(Duration(seconds: 10)); // simulate splash delay
    if(FFAppState().islogin){
      context.pushNamed(HomeWidget.routeName);
    }else{
      context.pushNamed(HomeWidget.routeName);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFDFBC2), Color(0xFFD7B4B4)],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
        ),
        child: Column(
          children: [
          Padding(
            padding:
            EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 8.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'ycpfaueb' /* समता अपार शक्ति */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Gotu',
                color: Color(0xFF703102),
                fontSize: 40.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
            Container(
              width: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFF070810),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 60.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/49svh_2.png',
                    width: 400.0,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment(0.0, 0.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'tz9uw8kq' /* प्रेमी जी आप का संगत समतावाद व... */,
                  ),
                  textAlign: TextAlign.center,
                  style:
                  FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Gotu',
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  'e7muxzu9' /* Login With Email */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                  EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tertiary,
                  textStyle:
                  FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.alegreyaSans(
                      fontWeight: FlutterFlowTheme.of(context)
                          .titleSmall
                          .fontWeight,
                      fontStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FlutterFlowTheme.of(context)
                        .titleSmall
                        .fontWeight,
                    fontStyle: FlutterFlowTheme.of(context)
                        .titleSmall
                        .fontStyle,
                  ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
            ),
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'w3kvrqpu' /* Don’t have an account?  */,
                ),
                style:
                FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.alegreyaSans(
                    fontWeight: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .fontWeight,
                    fontStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).info,
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
            Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'n546lpq8' /* Sign Up */,
                ),
                style:
                FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.alegreyaSans(
                    fontWeight: FontWeight.bold,
                    fontStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .fontStyle,
                ),
              ),
            ),
    ],
    ),
      ]
        ),
      )
    );
  }
}
