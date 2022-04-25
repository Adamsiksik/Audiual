import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/pdf.dart';
import 'package:login_bloc/src/screens/resetSETemail.dart';
import 'package:login_bloc/src/screens/resetSETpass.dart';
import 'package:login_bloc/src/screens/signup.dart';
import 'screens/login.dart';
import 'screens/resetSETkey.dart';
import 'screens/first.dart';
import 'screens/info.dart';
import 'screens/profile.dart';

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
      home: Scaffold(
        body: Center(child: PDF()),
      ),
    );
  }
}
