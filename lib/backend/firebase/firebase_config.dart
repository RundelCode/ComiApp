import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDjGrAV4HbfPCk205ccUmrNUNeR3r-09eg",
            authDomain: "comidapp-404723.firebaseapp.com",
            projectId: "comidapp-404723",
            storageBucket: "comidapp-404723.appspot.com",
            messagingSenderId: "754201288759",
            appId: "1:754201288759:web:150bea20ab5dc082f75fb2",
            measurementId: "G-X76Z5V8LHB"));
  } else {
    await Firebase.initializeApp();
  }
}
