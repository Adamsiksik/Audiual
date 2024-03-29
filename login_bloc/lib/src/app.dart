import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/audio.dart';
import 'package:login_bloc/src/screens/home.dart';
import 'package:login_bloc/src/screens/pdf.dart';
import 'package:login_bloc/src/screens/resetSETemail.dart';
import 'package:login_bloc/src/screens/resetSETpass.dart';
import 'package:login_bloc/src/screens/signup.dart';
import 'screens/login.dart';
import 'screens/resetSETkey.dart';
import 'screens/first.dart';
import 'screens/info.dart';
import 'screens/profile.dart';
import 'screens/pdf.dart';

class App extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home': (context) => First(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
      title: 'Log in screen',
      home: const Scaffold(
        body: Center(child: HomeP()),
      ),
    );
  }
}
