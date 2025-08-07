import 'package:samtawad_team/pages/apppages/gurudev_figure_copy/gurudev_figure_copy_widget.dart' show GurudevFigureCopyWidget;

import '../apppages/guru_ji_ka_jivan_and_sadhna/guru_ji_ka_jivan_and_sadhna_widget.dart';
import '../apppages/gurudev_figure/gurudev_figure_widget.dart';
import '../apppages/home/home_widget.dart';

import '../apppages/login_page/login_page_widget.dart';
import '../apppages/profilepage/profilepage_widget.dart';
import '../apppages/user_chat/user_chat_widget.dart';
import '../apppages/vani_satsang_and_audio_book_copy/vani_satsang_and_audio_book_copy_widget.dart';
import '../favoritetest/favoritetest_widget.dart';
import '../shisya_ka_kartvya/shisya_ka_kartvya_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notes_model.dart';
export 'notes_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({super.key});

  static String routeName = 'notes';
  static String routePath = '/notes';

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}
bool _noteLoadedOnce = false; // 👈 Global static flag


class _NotesWidgetState extends State<NotesWidget> {
  late NotesModel _model;
  late TextEditingController _controller;
  DocumentReference? _noteDoc;
  DocumentReference? _editingDocRef;

  bool _showFabOptions = false;



  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesModel());
    _controller = TextEditingController();
_initNote();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentPage = 4;
      safeSetState(() {});
    });
  }
  Future<void> _saveNote() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    if (_editingDocRef != null) {
      // ✏️ Edit existing note
      await _editingDocRef!.update({
        'noteText': text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note updated.')),
      );
    } else {
      // ➕ Add new note
      await FirebaseFirestore.instance.collection('global_notes').add({
        'userId': currentUserUid,
        'noteText': text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note added.')),
      );
    }

    _editingDocRef = null; // Reset after saving
    _controller.clear();
  }


  Future<void> _showSavedNotes() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('global_notes')
        .where('userId', isEqualTo: currentUserUid)
        // .orderBy('timestamp', descending: true)
        .get();

    if (querySnapshot.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No saved notes.')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 400, // 🎯 Fixed height threshold
          ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Text(
                'Saved Notes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Expanded( // 🔑 Make ListView fill remaining space
                child: ListView.builder(
                  itemCount: querySnapshot.docs.length,
                  itemBuilder: (context, index) {
                    final doc = querySnapshot.docs[index];
                    final noteText = doc['noteText'] ?? '';
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        noteText.length > 50
                            ? '${noteText.substring(0, 50)}...'
                            : noteText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {
                        Navigator.pop(context);
                        _showEditDeleteSheet(doc.reference, noteText);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> _initNote() async {
    if (_noteLoadedOnce) return; // ✅ prevent reloading after first time

    final docRef = FirebaseFirestore.instance.collection('notes').doc(currentUserUid);
    final doc = await docRef.get();

    if (doc.exists) {
      final noteText = doc['noteText'] ?? '';
      if (_controller.text.trim().isEmpty) {
        _controller.text = noteText;
      }
    } else {
      await docRef.set({
        'noteText': '',
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    setState(() {
      _noteDoc = docRef;
      _noteLoadedOnce = true;
    });
  }

  void _showEditDeleteSheet(DocumentReference docRef, String currentText) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 🔑 This limits height to content
            children: [
              Text(
                currentText,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _controller.text = currentText;
                        _editingDocRef = docRef;
                      },
                      icon: Icon(Icons.edit),
                      label: Text('Edit + View Note'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFc25123),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await docRef.delete();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Note deleted.')),
                        );
                      },
                      icon: Icon(Icons.delete),
                      label: Text('Delete'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  // WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));


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
                                                            '5ewxwpmo' /* समता अपार शक्ति */,
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
                                                          '7u3kmbnv' /* ॐ ब्रह्म सत्यम सर्वाधार */,
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
        drawer:
        Drawer(
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
                      child: Text("प्रभु सत् आचरण और नि:चल बुद्धि देवें।",
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
                        child: Text("आशीर्वाद ---- महात्मा मंगत राम जी महाराज",

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
                        child: Text("1903-1954",

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
                        child: Text("घर",

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
                child: Text(" जीवन और साधना",
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
                child: Text("शिष्य का कर्तव्य",

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
                child: Text("वाणी ,सत्संग और ऑडियो बुक",

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
                child: Text("गुरुदेव की तस्वीरें और फ़ोटो",
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
                child: Text("पसंदीदा",

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
                child: Text("संवाद",

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
                child: Text("उपयोगकर्ता रूपरेखा",

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
                child: Text("लॉगआउट",

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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📝 अपना नोट यहाँ लिखें',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: _controller,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Paste or write anything here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: _saveNote,
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFC25123),
                    ),
                    child: Center(
                      child: Text(
                        _editingDocRef != null ? "Update Note" : "Save Note",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
                        ),
            ),
            wrapWithModel(
              model: _model.footrModel,
              updateCallback: () => safeSetState(() {}),
              child: FootrWidget(),
            ),
            ],

        ),
    floatingActionButton: Padding(
    padding: const EdgeInsets.only(bottom: 90.0),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    if (_showFabOptions) ...[
    FloatingActionButton(
      backgroundColor: Color(0xFFc25123),
    heroTag: "view",
    child: Icon(Icons.note, color: Colors.white),
    onPressed: _showSavedNotes,
    tooltip: 'View Notes',
    ),
    FloatingActionButton(
      backgroundColor: Color(0xFFc25123),
    heroTag: "close_fab",
    mini: true,
    tooltip: 'Close Options',
    child: Icon(Icons.close, color: Colors.white),
    onPressed: () => setState(() => _showFabOptions = false),
    ),
    ],
    FloatingActionButton(
      backgroundColor: Color(0xFFc25123),
    heroTag: "main_fab",
    tooltip: 'More Options',
    child: Icon(Icons.menu, color: Colors.white),
    onPressed: () => setState(() => _showFabOptions = !_showFabOptions),
    ),
    ],
    ),
    ),


      ),
    );
  }
}
