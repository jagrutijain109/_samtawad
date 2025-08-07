import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'footr_model.dart';
export 'footr_model.dart';

class FootrWidget extends StatefulWidget {
  const FootrWidget({super.key});

  @override
  State<FootrWidget> createState() => _FootrWidgetState();
}

class _FootrWidgetState extends State<FootrWidget> {
  late FootrModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FootrModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final currentPath = GoRouterState.of(context).uri.toString();

    final isHome = currentPath == '/home';
    final isBook = currentPath == '/book';
    final isAudio = currentPath.startsWith('/vaniSatsangAndAudioBookCopy');
    final isMedia = currentPath == '/gurudevFigureCopy';

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(
          color: Color(0xF6FFFFFF),
          shape: BoxShape.rectangle,
        ),
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Home Icon
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 57.1,
              // fillColor: isHome ? Color(0xFFDFCBBD) : Color(0x00000000),
              hoverColor: Color(0xFFEDE6E6),
              hoverIconColor: Color(0xFF080808),
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: isHome ? Color(0xFF080808) : Color(0xFFC25123),
                size: 35.0,
              ),
              onPressed: isHome
                  ? null
                  : () async {
                context.go('/home');
              },
            ),

            // Book Icon
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 57.1,
              // fillColor: isBook ? Color(0xFFDFCBBD) : Color(0x00000000),
              hoverColor: Color(0xFFFFE5D0),
              hoverIconColor: Color(0xFF080808),
              icon: Icon(
                Icons.menu_book,
                color: isBook ? Color(0xFF080808) : Color(0xFFC25123),
                size: 40.0,
              ),
              onPressed: isBook
                  ? null
                  : () async {
                context.go('/book');
              },
            ),

            // Audio Icon
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 57.1,
              // fillColor: isAudio ? Color(0xFFDFCBBD) : Color(0x00000000),
              hoverColor: Color(0xFFFFE5D0),
              hoverIconColor: Color(0xFF080808),
              icon: Icon(
                Icons.library_music,
                color: isAudio ? Color(0xFF080808) : Color(0xFFC25123),
                size: 43.0,
              ),
              onPressed: isAudio
                  ? null
                  : () async {
                context.go('/vaniSatsangAndAudioBookCopy');
              },
            ),

            // Media Icon
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 57.1,
              // fillColor: isMedia ? Color(0xFFDFCBBD) : Color(0x00000000),
              hoverColor: Color(0xFFFFE5D0),
              hoverIconColor: Color(0xFF080808),
              // icon: Icon(
              //   Icons.perm_media,
              //   color: isMedia ? Color(0xFF080808) : Color(0xFFC25123),
              //   size: 40.0,
              // ),
              icon: FaIcon(
                FontAwesomeIcons.images, // or try FontAwesomeIcons.photoFilm
                color: isMedia ? Color(0xFF080808) : Color(0xFFC25123),
                size: 38.0,
              ),
              onPressed: isMedia
                  ? null
                  : () async {
                context.go('/gurudevFigureCopy');
              },
            ),
          ],
        ),
      ),
    );
  }
}
