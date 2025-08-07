import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pdf_model.dart';
export 'pdf_model.dart';

class PdfWidget extends StatefulWidget {
  const PdfWidget({super.key});

  static String routeName = 'pdf';
  static String routePath = '/pdf';

  @override
  State<PdfWidget> createState() => _PdfWidgetState();
}

class _PdfWidgetState extends State<PdfWidget> {
  late PdfModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentPage = 9;
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 700.0,
                  child: custom_widgets.PDFViewerWithVoiceSearch(
                    width: double.infinity,
                    height: 700.0,
                    pdfUrl:
                        'https://firebasestorage.googleapis.com/v0/b/samtawad-afde2.firebasestorage.app/o/users%2FAfTY8RocJCW6J9N6VBDCp74AmGT2%2Fuploads%2F1749618517708000.pdf?alt=media&token=50adfe6a-1c42-47e5-99b5-a068c343e443',
                    userId: FFAppState().userId,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
