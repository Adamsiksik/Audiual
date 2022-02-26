import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     // Replace with actual values
      options: const FirebaseOptions(
      apiKey: "AIzaSyDXn4zHI88Ej_FMrQWmk2KvNazS8j1LMTU",
      appId: "1:116796422514:ios:e2232ef2162130494805eb",
      messagingSenderId: "116796422514",
      projectId: "flutter-b6f68",
    ),
  );
  
  runApp(App());

}
