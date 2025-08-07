import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/appbar/appbar_widget.dart';
import '/pages/component/footr/footr_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'samtawad_knowledge_picturess_model.dart';
export 'samtawad_knowledge_picturess_model.dart';

class SamtawadKnowledgePicturessWidget extends StatefulWidget {
  const SamtawadKnowledgePicturessWidget({
    super.key,
    this.samtawadKnowledge,
    this.currentIndex,
  });

  final List<SamtawadKnowledgeRecord>? samtawadKnowledge;
  final int? currentIndex;

  static String routeName = 'samtawadKnowledgePicturess';
  static String routePath = '/samtawadKnowledgePicturess';

  @override
  State<SamtawadKnowledgePicturessWidget> createState() =>
      _SamtawadKnowledgePicturessWidgetState();
}

class _SamtawadKnowledgePicturessWidgetState
    extends State<SamtawadKnowledgePicturessWidget> {
  late SamtawadKnowledgePicturessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SamtawadKnowledgePicturessModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.intexNumber = widget!.currentIndex!;
      _model.maxIndex =
          functions.subtractOne(widget!.samtawadKnowledge!.length)!;
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
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 100.0, 0.0, 100.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 775.14,
                              child: Container(
                                width: double.infinity,
                                height: 500.0,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: PageView(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(
                                                    0,
                                                    min(
                                                        valueOrDefault<int>(
                                                          _model.intexNumber,
                                                          0,
                                                        ),
                                                        0))),
                                        onPageChanged: (_) =>
                                            safeSetState(() {}),
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
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
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    widget!
                                                                        .samtawadKnowledge!
                                                                        .elementAtOrNull(
                                                                            _model.intexNumber)!
                                                                        .images,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                    cacheHeight:
                                                                        400,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: widget!
                                                                      .samtawadKnowledge!
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .intexNumber)!
                                                                      .images,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: widget!
                                                                .samtawadKnowledge!
                                                                .elementAtOrNull(
                                                                    _model
                                                                        .intexNumber)!
                                                                .images,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        25.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        25.0),
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                widget!
                                                                    .samtawadKnowledge!
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .intexNumber)!
                                                                    .images,
                                                                width: double
                                                                    .infinity,
                                                                height: 449.8,
                                                                fit:
                                                                    BoxFit.fill,
                                                                alignment:
                                                                    Alignment(
                                                                        0.0,
                                                                        0.0),
                                                                cacheHeight:
                                                                    400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.8,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.76),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 6.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 57.3,
                                                              decoration:
                                                                  BoxDecoration(
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
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFFF8DEB5),
                                                                    Color(
                                                                        0xFFE7ECEC)
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 53.8,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    25.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    25.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
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
                                                                onTap:
                                                                    () async {
                                                                  await _model
                                                                      .pageViewController
                                                                      ?.previousPage(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  if (_model
                                                                          .intexNumber >
                                                                      0) {
                                                                    _model.intexNumber =
                                                                        _model.intexNumber +
                                                                            -1;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('First Page'),
                                                                          content:
                                                                              Text('You are already at the first page.'),
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
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .arrowCircleLeft,
                                                                  color: Color(
                                                                      0xFFB44617),
                                                                  size: 35.0,
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
                                                                            5.0,
                                                                            0.0,
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
                                                                    await downloadFile(
                                                                      filename:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        widget!
                                                                            .samtawadKnowledge
                                                                            ?.elementAtOrNull(_model.intexNumber)
                                                                            ?.tags,
                                                                        'title',
                                                                      ),
                                                                      url: valueOrDefault<
                                                                          String>(
                                                                        widget!
                                                                            .samtawadKnowledge
                                                                            ?.elementAtOrNull(_model.intexNumber)
                                                                            ?.imageUrl,
                                                                        'image url',
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .file_download_rounded,
                                                                    color: Color(
                                                                        0xFFB44617),
                                                                    size: 38.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    FavouriteRecord>>(
                                                              stream:
                                                                  queryFavouriteRecord(
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<FavouriteRecord>
                                                                    iconFavouriteRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final iconFavouriteRecord =
                                                                    iconFavouriteRecordList
                                                                            .isNotEmpty
                                                                        ? iconFavouriteRecordList
                                                                            .first
                                                                        : null;

                                                                return InkWell(
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
                                                                    if ((iconFavouriteRecord?.userId == currentUserUid) &&
                                                                        (iconFavouriteRecord?.type ==
                                                                            'samtawadGallery') &&
                                                                        (iconFavouriteRecord?.iteamId ==
                                                                            widget!.samtawadKnowledge?.elementAtOrNull(_model.intexNumber)?.reference.id)) {
                                                                      _model.isFavorite =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Remove from Wishlist?'),
                                                                                content: Text('Are you sure you want to delete this item from your wishlist?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Remove'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        unawaited(
                                                                          () async {
                                                                            await iconFavouriteRecord!.reference.delete();
                                                                          }(),
                                                                        );
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Favorite'),
                                                                              content: Text('Deleted from favorite'),
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
                                                                    } else {
                                                                      unawaited(
                                                                        () async {
                                                                          await FavouriteRecord
                                                                              .collection
                                                                              .doc()
                                                                              .set(createFavouriteRecordData(
                                                                                image: widget!.samtawadKnowledge?.elementAtOrNull(_model.intexNumber)?.images,
                                                                                status: false,
                                                                                title: widget!.samtawadKnowledge?.elementAtOrNull(_model.intexNumber)?.tags,
                                                                                about: widget!.samtawadKnowledge?.elementAtOrNull(_model.intexNumber)?.information,
                                                                                imagelink: widget!.samtawadKnowledge?.elementAtOrNull(_model.intexNumber)?.imageUrl,
                                                                                userId: currentUserUid,
                                                                                type: 'samtawadGallery',
                                                                                iteamId: widget!.samtawadKnowledge?.elementAtOrNull(_model.intexNumber)?.reference.id,
                                                                              ));
                                                                        }(),
                                                                      );
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Favorite'),
                                                                            content:
                                                                                Text('Added to favorite'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      _model.isFavorite =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_outlined,
                                                                    color: Color(
                                                                        0xFFB44617),
                                                                    size: 38.0,
                                                                  ),
                                                                );
                                                              },
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
                                                                    await launchURL(widget!
                                                                        .samtawadKnowledge!
                                                                        .elementAtOrNull(
                                                                            _model.intexNumber)!
                                                                        .imageUrl);
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .share,
                                                                    color: Color(
                                                                        0xFFB44617),
                                                                    size: 35.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
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
                                                                onTap:
                                                                    () async {
                                                                  await _model
                                                                      .pageViewController
                                                                      ?.nextPage(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  if (_model
                                                                          .intexNumber <
                                                                      _model
                                                                          .maxIndex) {
                                                                    _model.intexNumber =
                                                                        _model.intexNumber +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Last Page'),
                                                                          content:
                                                                              Text('You\'ve reached the last page.'),
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
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .arrowCircleRight,
                                                                  color: Color(
                                                                      0xFFB44617),
                                                                  size: 35.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 10.0,
                                                          20.0, 10.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget!.samtawadKnowledge
                                                          ?.elementAtOrNull(
                                                              _model
                                                                  .intexNumber)
                                                          ?.tags,
                                                      'Guru Ji',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Gotu',
                                                      color: Color(0xFFC25123),
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      shadows: [
                                                        Shadow(
                                                          color:
                                                              Color(0xFFC25123),
                                                          offset:
                                                              Offset(1.0, 1.0),
                                                          blurRadius: 1.0,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 3.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFC25123),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
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
                                                                20.0,
                                                                10.0,
                                                                20.0,
                                                                10.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget!
                                                            .samtawadKnowledge
                                                            ?.elementAtOrNull(
                                                                _model
                                                                    .intexNumber)
                                                            ?.information,
                                                        'गुरु जी, आपके चरणों में मेरा नमन।  आपकी कृपा से मेरा जीवन धन्य है।  आपकी शिक्षा मुझे सही मार्ग दिखाती है। आपकी शिक्षा मुझे सही मार्ग दिखाती है।',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Gotu',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          valueOrDefault<int>(
                                                            _model.intexNumber,
                                                            0,
                                                          ),
                                                          0))),
                                          count: 1,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                            safeSetState(() {});
                                          },
                                          effect:
                                              smooth_page_indicator.SlideEffect(
                                            spacing: 8.0,
                                            radius: 8.0,
                                            dotWidth: 8.0,
                                            dotHeight: 8.0,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            paintStyle: PaintingStyle.fill,
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
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: wrapWithModel(
                  model: _model.appbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppbarWidget(),
                ),
              ),
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
        ),
      ),
    );
  }
}
