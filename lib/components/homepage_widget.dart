import '../pages/apppages/gurujisquestion/gurujisquestion_widget.dart';
import '../pages/apppages/gurupatrika.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/popupcomponent/firestlogin/firestlogin_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';
import 'dart:async';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;
  final int _initialPage = 10000;
  // final PageController _pageController = PageController(viewportFraction: 1.0);
  late final PageController _pageController = PageController(
    initialPage: _initialPage,
    viewportFraction: 1.0, // keep your original fraction
  );
  int _currentPage = 10000;
  Timer? _timer;


  final List<String> imagePaths = [
    // 'assets/images/error_image.png',
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
  ];

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());  // <-- add this back

    // added
    _currentPage = 10000;
    // _pageController.jumpToPage(_currentPage);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(_currentPage);
      }
    });

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!mounted || !_pageController.hasClients) return;
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    // _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   if (!mounted) return;
    //   if (!_pageController.hasClients) return;
    //   _currentPage++;
    //
    //   // if (_currentPage < imagePaths.length - 1) {
    //   //   _currentPage++;
    //   // } else {
    //   //   _currentPage = 0;
    //   // }
    //
    //   _pageController.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 500),
    //     curve: Curves.easeInOut,
    //   );
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }


  @override
  void dispose() {
    _model.maybeDispose();
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color backgroundColor = isDark ? Color(0xFF1E1E1E) : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,   // << use your background color depending on theme
      ),
      child: Stack(
          children: [
      Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
      Padding(
        // change
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        // change
        height: 560,
        child: Stack(
          children: [
            // PageView
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 400,
                child: PageView.builder(
                  controller: _pageController,
                  // ✅ remove itemCount to make it "infinite"
                  itemBuilder: (context, index) {
                    final imageIndex = index % imagePaths.length; // ✅ repeat images infinitely
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFB04E06).withOpacity(0.6),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                          child: Image.asset(
                            imagePaths[imageIndex],  // ✅ use modulo index
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    );
                  },
                  onPageChanged: (index) {
                    _currentPage = index; // ✅ sync current page if user swipes
                  },
                ),
              ),
            ),

            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     height: 400,
            //     child: PageView.builder(
            //       controller: _pageController,
            //       itemCount: imagePaths.length,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           // margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            //           margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(16.0),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Color(0xFFB04E06).withOpacity(0.6),
            //                 blurRadius: 6,
            //                 offset: Offset(0, 4),
            //               ),
            //             ],
            //           ),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(16.0),
            //             // child: Image.asset(
            //             //   imagePaths[index],
            //             //   fit: BoxFit.contain,   // << show full image without crop
            //             //   alignment: Alignment.center,
            //             //   width: double.infinity,
            //             //   height: double.infinity,
            //             // ),
            //             child: Container(
            //               width: double.infinity,      // ensures it uses full width
            //               height: double.infinity,
            //               // color: Color(0xFFF5E3D0),
            //               color: Colors.white,
            //               child: Image.asset(
            //                 imagePaths[index],
            //                 fit: BoxFit.cover,         // covers and crops properly
            //                 alignment: Alignment.center,
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),

            // changes
            Positioned(
              bottom: 0,
              left: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.all(12.0), // reduced from 16.0
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color(0xFFB04E06).withOpacity(0.95),
                      // Color(0xFF8E3E04).withOpacity(0.95),
                      Color(0xFFB46A35).withOpacity(0.95),  // lighter warm top
                      Color(0xFF844012).withOpacity(0.95),  // middle rich brown
                      Color(0xFF703102).withOpacity(0.95),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14.0), // slightly smaller curve
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Color(0xFFFFB300).withOpacity(0.8),
                    width: 1.0,
                  ),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Main Sanskrit text
                    Text(
                      // 'ॐ ब्रह्म सत्यं सर्वधार',
                      'महामन्त्र',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21, // was 24
                        color: Color(0xFFFFB300),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        fontFamily: 'Gotu',
                      ),
                    ),
                    SizedBox(height: 4), // was 6
                    // Divider with devotional icon
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white.withOpacity(0.6),
                            thickness: 1,
                            endIndent: 6, // was 8
                          ),
                        ),
                        Icon(
                          Icons.spa, // built-in, spiritual/leaf/flower shape
                          color: Color(0xFFFFB300),
                          size: 18, // was 20
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white.withOpacity(0.6),
                            thickness: 1,
                            indent: 6,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4), // was 6
                    // Subtitle
                    Text(
                      // 'Om Braham Satyam Sarvadhar',
                      'ओ३म् ब्रह्म सत्यम् निरंकार अजन्मा अद्वैत पुरखा सर्व व्यापक कल्याण मूरत परमेश्वराय नमस्तं ।।',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15, // was 17
                        color: Colors.white.withOpacity(0.9),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        fontFamily: 'Gotu',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // changes till
          ],
        ),
      ),
    ),
//                   child: Container(
//                     width: 406.8,
//                     height: 107.08,
//                     decoration: BoxDecoration(),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () async {
//
//                             // if (FFAppState().islogin) {
//                               context.pushNamed(
//                                 VaniSatsangAndAudioBookCopyWidget.routeName,
//                                 queryParameters: {
//                                   'tabNumber': serializeParam(
//                                     0,
//                                     ParamType.int,
//                                   ),
//                                 }.withoutNulls,
//                               );
//                             // } else {
//                             //   await showModalBottomSheet(
//                             //     isScrollControlled: true,
//                             //     backgroundColor: Colors.transparent,
//                             //     enableDrag: false,
//                             //     context: context,
//                             //     builder: (context) {
//                             //       return Padding(
//                             //         padding: MediaQuery.viewInsetsOf(context),
//                             //         child: Container(
//                             //           height: 500.0,
//                             //           child: FirestloginWidget(),
//                             //         ),
//                             //       );
//                             //     },
//                             //   ).then((value) => safeSetState(() {}));
//                             },
//                           // },
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Container(
//                                 width: 51.1,
//                                 height: 45.0,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   shape: BoxShape.rectangle,
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Expanded(
//                                       child: Icon(
//                                         Icons.graphic_eq,
//                                         color: Color(0xFF030303),
//                                         size: 40.0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Text(
//                                 FFLocalizations.of(context).getText(
//                                   'y0tnvoyd' /* ऑडियो */,
//                                 ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.roboto(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: Color(0xFF0C0C0C),
//                                       fontSize: 12.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ]
//                                 .divide(SizedBox(height: 10.0))
//                                 .around(SizedBox(height: 10.0)),
//                           ),
//                         ),
//                         Flexible(
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 20.0),
//                             child: Container(
//                               width: 28.8,
//                               height: 71.4,
//                               decoration: BoxDecoration(),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(24.0),
//                                 child: Image.asset(
//                                   'assets/images/line.png',
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () async {
//                             // if (FFAppState().islogin) {
//                               context.pushNamed(BookWidget.routeName);
//                             // } else {
//                             //   await showModalBottomSheet(
//                             //     isScrollControlled: true,
//                             //     backgroundColor: Colors.transparent,
//                             //     enableDrag: false,
//                             //     context: context,
//                             //     builder: (context) {
//                             //       return Padding(
//                             //         padding: MediaQuery.viewInsetsOf(context),
//                             //         child: Container(
//                             //           height: 500.0,
//                             //           child: FirestloginWidget(),
//                             //         ),
//                             //       );
//                             //     },
//                             //   ).then((value) => safeSetState(() {}));
//                             },
//                           // },
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Container(
//                                 width: 51.1,
//                                 height: 45.0,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   shape: BoxShape.rectangle,
//                                 ),
//                                 child: Icon(
//                                   Icons.book_outlined,
//                                   color: Color(0xFF030303),
//                                   size: 40.0,
//                                 ),
//                               ),
//                               Text(
//                                 FFLocalizations.of(context).getText(
//                                   'gqtn0b6q' /* किताबें */,
//                                 ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.roboto(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: Color(0xFF0C0C0C),
//                                       fontSize: 12.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ]
//                                 .divide(SizedBox(height: 10.0))
//                                 .around(SizedBox(height: 10.0)),
//                           ),
//                         ),
//                         Flexible(
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 20.0),
//                             child: Container(
//                               width: 28.8,
//                               height: 71.4,
//                               decoration: BoxDecoration(),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(24.0),
//                                 child: Image.asset(
//                                   'assets/images/line.png',
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: (){
//                             context.pushNamed(VaniSatsangAndAudioBookCopyWidget.routeName,queryParameters: {
//                               'tabNumber':serializeParam(3, ParamType.int),
//                             }.withoutNulls);
//                           },
//                           // onTap: () async {
//                           //   if (FFAppState().islogin) {
//                           //     context.pushNamed(
//                           //       VaniSatsangAndAudioBookCopyWidget.routeName,
//                           //       queryParameters: {
//                           //         'tabNumber': serializeParam(
//                           //           3,
//                           //           ParamType.int,
//                           //         ),
//                           //       }.withoutNulls,
//                           //     );
//                           //   } else {
//                           //     await showModalBottomSheet(
//                           //       isScrollControlled: true,
//                           //       backgroundColor: Colors.transparent,
//                           //       enableDrag: false,
//                           //       context: context,
//                           //       builder: (context) {
//                           //         return Padding(
//                           //           padding: MediaQuery.viewInsetsOf(context),
//                           //           child: Container(
//                           //             height: 500.0,
//                           //             child: FirestloginWidget(),
//                           //           ),
//                           //         );
//                           //       },
//                           //     ).then((value) => safeSetState(() {}));
//                           //   }
//                           // },
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Container(
//                                 width: 51.1,
//                                 height: 45.0,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   shape: BoxShape.rectangle,
//                                 ),
//                                 child: Icon(
//                                   Icons.audio_file_outlined,
//                                   color: Color(0xFF030303),
//                                   size: 40.0,
//                                 ),
//                               ),
//                               Text(
//                                 FFLocalizations.of(context).getText(
//                                   'm50br175' /* ऑडियो
// बुक */
//                                   ,
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.roboto(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: Color(0xFF0C0C0C),
//                                       fontSize: 12.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ]
//                                 .divide(SizedBox(height: 10.0))
//                                 .around(SizedBox(height: 10.0)),
//                           ),
//                         ),
//                         Flexible(
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 20.0),
//                             child: Container(
//                               width: 28.8,
//                               height: 71.4,
//                               decoration: BoxDecoration(),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(24.0),
//                                 child: Image.asset(
//                                   'assets/images/line.png',
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: ()async{
//                             context.pushNamed(GurudevFigureCopyWidget.routeName);
//                           },
//                           // onTap: () async {
//                           //   if (FFAppState().islogin) {
//                           //     context
//                           //         .pushNamed(GurudevFigureCopyWidget.routeName);
//                           //   } else {
//                           //     await showModalBottomSheet(
//                           //       isScrollControlled: true,
//                           //       backgroundColor: Colors.transparent,
//                           //       enableDrag: false,
//                           //       context: context,
//                           //       builder: (context) {
//                           //         return Padding(
//                           //           padding: MediaQuery.viewInsetsOf(context),
//                           //           child: Container(
//                           //             height: 500.0,
//                           //             child: FirestloginWidget(),
//                           //           ),
//                           //         );
//                           //       },
//                           //     ).then((value) => safeSetState(() {}));
//                           //   }
//                           // },
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Container(
//                                 width: 51.1,
//                                 height: 45.0,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   shape: BoxShape.rectangle,
//                                 ),
//                                 child: Icon(
//                                   Icons.photo_library_sharp,
//                                   color: Color(0xFF030303),
//                                   size: 40.0,
//                                 ),
//                               ),
//                               Text(
//                                 FFLocalizations.of(context).getText(
//                                   'j85pfl83' /* गैलरी */,
//                                 ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.roboto(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: Color(0xFF0C0C0C),
//                                       fontSize: 12.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ]
//                                 .divide(SizedBox(height: 10.0))
//                                 .around(SizedBox(height: 10.0)),
//                           ),
//                         ),
//                         Flexible(
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 20.0),
//                             child: Container(
//                               width: 28.8,
//                               height: 71.4,
//                               decoration: BoxDecoration(),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(24.0),
//                                 child: Image.asset(
//                                   'assets/images/line.png',
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: ()async{
//                             context.pushNamed(PhotoLocationWidget.routeName);
//                           },
//                           // onTap: () async {
//                           //   if (FFAppState().islogin) {
//                           //     context.pushNamed(PhotoLocationWidget.routeName);
//                           //   } else {
//                           //     await showModalBottomSheet(
//                           //       isScrollControlled: true,
//                           //       backgroundColor: Colors.transparent,
//                           //       enableDrag: false,
//                           //       context: context,
//                           //       builder: (context) {
//                           //         return Padding(
//                           //           padding: MediaQuery.viewInsetsOf(context),
//                           //           child: Container(
//                           //             height: 500.0,
//                           //             child: FirestloginWidget(),
//                           //           ),
//                           //         );
//                           //       },
//                           //     ).then((value) => safeSetState(() {}));
//                           //   }
//                           // },
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Flexible(
//                                 child: Container(
//                                   width: 51.1,
//                                   height: 49.0,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(0.0),
//                                       bottomRight: Radius.circular(0.0),
//                                       topLeft: Radius.circular(0.0),
//                                       topRight: Radius.circular(0.0),
//                                     ),
//                                     shape: BoxShape.rectangle,
//                                   ),
//                                   child: Icon(
//                                     Icons.event_note_sharp,
//                                     color: Color(0xFF030303),
//                                     size: 40.0,
//                                   ),
//                                 ),
//                               ),
//                               Text("इवेंट्स,लोकेशन",
//                                 // FFLocalizations.of(context).getText(
//                                 //   'n01fb6n8' /* घटनाएँ */,
//                                 // ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       font: GoogleFonts.roboto(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                       color: Color(0xFF0C0C0C),
//                                       fontSize: 12.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ]
//                                 .divide(SizedBox(height: 10.0))
//                                 .around(SizedBox(height: 10.0)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Container(
                            width: double.infinity,
                            height: 135.4,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Samtawad_UIUX_(19).png',
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 350.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 500.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 650.0;
                                        } else {
                                          return 550.0;
                                        }
                                      }(),
                                      height: 133.2,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  child: CarouselSlider(
                                    items: [
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w8j3rr85' /*  साचे सतगुर मिल के, कीजो नित अ... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5956urre' /*  सिमरन साचा नाम है, जो सिमरे ग... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jlxa1eho' /*  मन तू साचा हो रहो, सिमर के सा... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'vvtbqf9l' /* जीवन का ये लाभ है, जो परसेवा च... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'djo74oqt' /*   मन तू साचा हो रहो, सिमर के स... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5auypk22' /* सादा जीवन जिसका, तिसका मन परसन... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zcqzqy3g' /* अम्बर वायू अगनी, नित ही सेवा ध... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sgw45ebv' /* जीवन का ये लाभ है, जो परसेवा च... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jwvfh16g' /* बार बार करूँ बन्दना, सतगुर चरन... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 59.4,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 25.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w1m25q1f' /*  सिमरन साचा नाम है, जो सिमरे ग... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Gotu',
                                                    color: Color(0xFFF5F6FC),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    carouselController:
                                        _model.carouselController ??=
                                            CarouselSliderController(),
                                    options: CarouselOptions(
                                      initialPage: 1,
                                      viewportFraction: 1.0,
                                      disableCenter: true,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 1.0,
                                      enableInfiniteScroll: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: true,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayInterval:
                                          Duration(milliseconds: (800 + 4000)),
                                      autoPlayCurve: Curves.linear,
                                      pauseAutoPlayInFiniteScroll: true,
                                      onPageChanged: (index, _) =>
                                          _model.carouselCurrentIndex = index,
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
                ),
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(GurupehchanCopyWidget.routeName);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 128.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                            border: Border.all(
                              color: Color(0x02875959),
                              width: 5.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Samtawad_UIUX_(21).png',
                                  width: double.infinity,
                                  height: 231.1,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 10.0, 18.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '3jb08i2n' /* गुरु की पहचान */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Gotu',
                                            color: Color(0xFF050505),
                                            fontSize: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 18.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 22.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 24.0;
                                              } else {
                                                return 25.0;
                                              }
                                            }(),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                            shadows: [
                                              Shadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                offset: Offset(2.0, 2.0),
                                                blurRadius: 2.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '21p4o442' /* गुरु: प्रकाश का स्वरूप — महात्... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'subheders',
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(MahaMantraKaPrakatWidget.routeName);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 142.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                            border: Border.all(
                              color: Color(0x02875959),
                              width: 5.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Samtawad_UIUX_(21).png',
                                  width: double.infinity,
                                  height: 210.9,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 10.0, 18.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '1ajkhpqb' /* महामंत्र का प्रकट होना */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Gotu',
                                            color: Color(0xFF111111),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                            shadows: [
                                              Shadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                offset: Offset(2.0, 2.0),
                                                blurRadius: 2.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'nf4u063k' /* गुरुदेव महात्मा मंगतराम जी की ... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'subheders',
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(SamtawadWidget.routeName);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 127.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                            border: Border.all(
                              color: Color(0x02875959),
                              width: 5.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Samtawad_UIUX_(21).png',
                                  width: double.infinity,
                                  height: 204.5,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 10.0, 18.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'w73pysrn' /* समतावाद  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Gotu',
                                            color: Color(0xFF111111),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                            shadows: [
                                              Shadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                offset: Offset(2.0, 2.0),
                                                blurRadius: 2.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'kksc3r38' /* एक आध्यात्मिक अनुभव, न कोई संप... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'subheders',
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(PdfWidget.routeName);
                              },
                              child: Container(
                                width: 162.0,
                                height: 110.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: Color(0x05AB613E),
                                    width: 5.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Samtawad_UIUX_(4).png',
                                        width: double.infinity,
                                        height: 207.4,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.12, -0.06),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'v6ued329' /* ग्रन्थ श्री
 समता प्रकाश */
                                          ,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Gotu',
                                          color: Color(0xFF090909),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                    GranthShriSamtaVilasWidget.routeName);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 110.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: Color(0x05AB613E),
                                    width: 5.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Samtawad_UIUX_(4).png',
                                        width: double.infinity,
                                        height: 207.4,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.12, -0.06),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'd3re99q0' /* ग्रन्थ श्री
समता विलास */
                                          ,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Gotu',
                                          color: Color(0xFF090909),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(ParamNidhanWidget.routeName);
                              },
                              child: Container(
                                width: 162.0,
                                height: 110.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: Color(0x05AB613E),
                                    width: 5.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Samtawad_UIUX_(4).png',
                                        width: double.infinity,
                                        height: 207.4,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.06, -0.53),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '6v6pwb6w' /* परम निधान */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Gotu',
                                          color: Color(0xFF090909),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, 0.53),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'gndiu9fk' /* ग्रन्थ श्री समता
विलास से */
                                          ,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'subheders',
                                              color: Color(0xFF0C0C0C),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                // context.pushNamed(GurujisquestionWidget.routeName);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => GurujisquestionWidget()),
                                );

                                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (co) => GurujisquestionWidget()));
                              },
                              child: Container(
                                width: 162.0,
                                height: 110.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: Color(0x05AB613E),
                                    width: 5.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Samtawad_UIUX_(4).png',
                                        width: double.infinity,
                                        height: 207.4,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.02, -0.56),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '7c0waoe4' /* प्रश्नों के उत्तर */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Gotu',
                                          color: Color(0xFF090909),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.02, 0.41),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'l7qmcn4o' /* गुरुदेव द्वारा प्रश्नों के
ज्... */
                                            ,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'subheders',
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: double.infinity,
                                height: 147.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.0),
                                  border: Border.all(
                                    color: Color(0x02875959),
                                    width: 5.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Samtawad_UIUX_(19).png',
                                        width: double.infinity,
                                        height: 131.07,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '6di20rj0' /*   मन तू साचा हो रहो, सिमर के स... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Gotu',
                                                color:
                                                    Colors.white,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 0.0))
                            .around(SizedBox(width: 0.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 147.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.0),
                                border: Border.all(
                                  color: Color(0x02875959),
                                  width: 5.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Samtawad_UIUX_(19).png',
                                      width: double.infinity,
                                      height: 131.1,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 22.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'gp8gdovg' /*  साचे सतगुर मिल के, कीजो नित अ... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Gotu',
                                              color: Color(0xFFF5F5F9),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Gurupatrika()));
                                // context.pushNamed(CheckingWidget.routeName);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 125.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: Color(0x05AB613E),
                                    width: 5.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Samtawad_UIUX_(4).png',
                                        width: double.infinity,
                                        height: 207.4,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.02, -0.58),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'a02ndf6b' /* गुरु पत्रिका  */,
                                        ),
                                        textAlign: TextAlign.justify,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'heders',
                                              color: Color(0xFF0C0C0C),
                                              fontSize: 26.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.17, 0.41),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '0bxs6yw8' /*  प्रेम और ज्ञान का शब्द */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'subheders',
                                                color: Color(0xFF0B0A0A),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 385.4,
                              height: 147.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.0),
                                border: Border.all(
                                  color: Color(0x02875959),
                                  width: 5.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Samtawad_UIUX_(19).png',
                                      width: double.infinity,
                                      height: 131.1,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 25.0, 5.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'c7o9dm3h' /*  सिमरन साचा नाम है, जो सिमरे ग... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Gotu',
                                              color: Color(0xFFF5F5F9),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w900,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 147.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.0),
                                border: Border.all(
                                  color: Color(0x02875959),
                                  width: 5.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Samtawad_UIUX_(19).png',
                                      width: double.infinity,
                                      height: 120.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ut6sdyfk' /* बार बार करूँ बन्दना, सतगुर चरन... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Gotu',
                                              color: Color(0xFFF5F5F9),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w900,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(SamtaVilasWidget.routeName);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 165.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: Color(0x05AB613E),
                                    width: 5.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Samtawad_UIUX_(4).png',
                                        width: double.infinity,
                                        height: 212.7,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -0.47),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lb5cwu24' /* ग्रन्थ श्री समता विलास */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'heders',
                                                    color: Color(0xFF090909),
                                                    fontSize: 26.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.27),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 5.0, 30.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tpbx298i' /* प्रश्न और उत्तर */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'subheders',
                                                    color: Color(0xFF0B0A0A),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 20.0))
                            .around(SizedBox(width: 20.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 104.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                                border: Border.all(
                                  color: Color(0x05AB613E),
                                  width: 5.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Samtawad_UIUX_(5).png',
                                      width: double.infinity,
                                      height: 207.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.04, 0.01),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          PhotoLocationWidget.routeName,
                                          queryParameters: {
                                            'tabNumber': serializeParam(
                                              2,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'tmayji0p' /* आगामी सत्संग */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'heders',
                                              color: Color(0xFF090909),
                                              fontSize: 26.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 25.0))
                            .around(SizedBox(width: 25.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 104.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                                border: Border.all(
                                  color: Color(0x05AB613E),
                                  width: 5.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Samtawad_UIUX_(5).png',
                                      width: double.infinity,
                                      height: 207.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.04, 0.01),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          PhotoLocationWidget.routeName,
                                          queryParameters: {
                                            'tabNumber': serializeParam(
                                              1,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '963ojeb0' /* स्थान */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'heders',
                                              color: Color(0xFF090909),
                                              fontSize: 26.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 25.0))
                            .around(SizedBox(width: 25.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 160.0,
                              decoration: BoxDecoration(
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 25.0))
                            .around(SizedBox(width: 25.0)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: AlignmentDirectional(0.98, -0.05),
          //   child: InkWell(
          //     splashColor: Colors.transparent,
          //     focusColor: Colors.transparent,
          //     hoverColor: Colors.transparent,
          //     highlightColor: Colors.transparent,
          //     onTap: () async {
          //       Scaffold.of(context).openEndDrawer();
          //     },
          //     child: Container(
          //       width: 39.1,
          //       height: 33.0,
          //       decoration: BoxDecoration(
          //         color: Color(0xFF703102),
          //         borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(10.0),
          //           bottomRight: Radius.circular(10.0),
          //           topLeft: Radius.circular(10.0),
          //           topRight: Radius.circular(10.0),
          //         ),
          //       ),
          //       child: Align(
          //         alignment: AlignmentDirectional(0.0, 1.0),
          //         child: Column(
          //           mainAxisSize: MainAxisSize.max,
          //           children: [
          //             Align(
          //               alignment: AlignmentDirectional(0.0, 0.0),
          //               child: FaIcon(
          //                 FontAwesomeIcons.om,
          //                 color: Color(0xFFF5F5FB),
          //                 size: 24.0,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
