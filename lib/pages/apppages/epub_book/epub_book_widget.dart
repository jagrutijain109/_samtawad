import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'epub_book_model.dart';
export 'epub_book_model.dart';

class EpubBookWidget extends StatefulWidget {
  const EpubBookWidget({
    super.key,
    required this.epubBookUrl,
    required this.bookId,
    required this.bookname,
  });

  final String? epubBookUrl;
  final DocumentReference? bookId;
  final String? bookname;

  static String routeName = 'epubBook';
  static String routePath = '/epubBook';

  @override
  State<EpubBookWidget> createState() => _EpubBookWidgetState();
}

class _EpubBookWidgetState extends State<EpubBookWidget> {
  late EpubBookModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EpubBookModel());

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
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF8DEB5),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.96,
                  child: custom_widgets.FlipEpubReader(
                    width: double.infinity,
                    height: 800.0,
                    userId: FFAppState().userId,
                    epubUrl: widget!.epubBookUrl!,
                    bookRef: widget!.bookId!,
                    bookname: widget!.bookname!,
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
