import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAHL8qVYHZ6Omxn2gjaANnR_HsPyNMzDAk",
            authDomain: "mother-universe.firebaseapp.com",
            projectId: "mother-universe",
            storageBucket: "mother-universe.appspot.com",
            messagingSenderId: "617343922237",
            appId: "1:617343922237:web:cb5043396fd359b849ba54",
            measurementId: "G-R9SFN9JQ50"));
  } else {
    await Firebase.initializeApp();
  }
}
