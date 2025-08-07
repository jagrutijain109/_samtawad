import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'granth_shri_samta_vilas_model.dart';
export 'granth_shri_samta_vilas_model.dart';

class GranthShriSamtaVilasWidget extends StatefulWidget {
  const GranthShriSamtaVilasWidget({super.key});

  static String routeName = 'granth_shri_samta_vilas';
  static String routePath = '/granthShriSamtaVilas';

  @override
  State<GranthShriSamtaVilasWidget> createState() =>
      _GranthShriSamtaVilasWidgetState();
}

class _GranthShriSamtaVilasWidgetState
    extends State<GranthShriSamtaVilasWidget> {
  late GranthShriSamtaVilasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GranthShriSamtaVilasModel());

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
    // double height = MediaQuery.of(context).size.0.7;
    double screenHeight = MediaQuery.of(context).size.height;
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.96,
                      child: custom_widgets.GranthShriSamtaVilas(
                        width: double.infinity,
                        height: 800.0,
                        userId: FFAppState().userId,
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
