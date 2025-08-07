// import 'dart:io';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
// import 'package:samtawad_team/flutter_flow/flutter_flow_drop_down.dart';
// import 'package:samtawad_team/flutter_flow/flutter_flow_icon_button.dart';
// import 'package:samtawad_team/flutter_flow/flutter_flow_widgets.dart';
import 'package:samtawad_team/flutter_flow/flutter_flow_theme.dart';
// import 'package:samtawad_team/index.dart';
// import 'package:samtawad_team/main.dart';
import 'package:samtawad_team/flutter_flow/flutter_flow_util.dart';

// import 'package:provider/provider.dart';
import 'package:samtawad_team/backend/firebase/firebase_config.dart';
import 'package:samtawad_team/auth/firebase_auth/auth_util.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('Samtawad', () {});
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
