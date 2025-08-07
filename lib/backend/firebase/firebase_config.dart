import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAmNAFqbEgrbhX838CvHwbNvoM78qkpxlU",
            authDomain: "samtawad-afde2.firebaseapp.com",
            projectId: "samtawad-afde2",
            storageBucket: "samtawad-afde2.firebasestorage.app",
            messagingSenderId: "677844269622",
            appId: "1:677844269622:web:058ea18217c27ab0063697",
            measurementId: "G-C6JZDXERJK"));
  } else {
    await Firebase.initializeApp();
  }
}
