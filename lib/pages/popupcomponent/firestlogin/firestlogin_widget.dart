import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firestlogin_model.dart';
export 'firestlogin_model.dart';

class FirestloginWidget extends StatefulWidget {
  const FirestloginWidget({super.key});

  @override
  State<FirestloginWidget> createState() => _FirestloginWidgetState();
}

class _FirestloginWidgetState extends State<FirestloginWidget> {
  late FirestloginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FirestloginModel());

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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ensures it takes only needed height
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
           "प्रेमीजी! यदि आपको पसंदीदा में जोड़ना है तो पहले लॉगिन करना होगा।",
            // FFLocalizations.of(context).getText(
            //   'e8uw177g' /* If you want to use this function... */,
            // ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.alegreyaSans(
                fontWeight: FontWeight.bold,
              ),
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          Text("ॐ ब्रह्म सत्यम् सर्वाधार",style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.alegreyaSans(
              fontWeight: FontWeight.bold,
            ),
            color: Colors.black,
            fontSize: 20.0,
          ),),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => context.pushNamed(LoginPageWidget.routeName),
              child: Text(
                FFLocalizations.of(context).getText(
                  '1u7vliqk' /* Log in */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.alegreyaSans(
                    fontWeight: FontWeight.bold,
                  ),
                  fontSize: 20.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
