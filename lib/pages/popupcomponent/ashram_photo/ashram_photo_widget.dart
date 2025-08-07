import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ashram_photo_model.dart';
export 'ashram_photo_model.dart';

class AshramPhotoWidget extends StatefulWidget {
  const AshramPhotoWidget({
    super.key,
    required this.imagePath,
  });

  final String? imagePath;

  @override
  State<AshramPhotoWidget> createState() => _AshramPhotoWidgetState();
}

class _AshramPhotoWidgetState extends State<AshramPhotoWidget> {
  late AshramPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AshramPhotoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFBF6F6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            child: Image.network(
              widget!.imagePath!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/error_image.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: FlutterFlowIconButton(
              buttonSize: 40.0,
              fillColor: Color(0xFF2C2929),
              hoverColor: Color(0xFFA42929),
              hoverIconColor: FlutterFlowTheme.of(context).primaryBackground,
              icon: Icon(
                Icons.close_sharp,
                color: Color(0xFFF6F2F2),
                size: 20.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
