import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'covercard_model.dart';
export 'covercard_model.dart';

class CovercardWidget extends StatefulWidget {
  const CovercardWidget({
    super.key,
    this.bookImageUrl,
    this.audioBook,
    this.bookInfo,
  });

  /// Cover Page Image
  final String? bookImageUrl;

  /// For Playing The Audio
  final String? audioBook;

  /// Information About Book
  final String? bookInfo;

  @override
  State<CovercardWidget> createState() => _CovercardWidgetState();
}

class _CovercardWidgetState extends State<CovercardWidget> {
  late CovercardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CovercardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SafeArea(
          child: Container(
            height: 250.0,
            decoration: BoxDecoration(
              color: Color(0xF6FFFFFF),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color(0xFFC25123),
                width: 4.0,
              ),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget!.bookImageUrl!,
                  height: 240.0,
                  fit: BoxFit.cover,
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
