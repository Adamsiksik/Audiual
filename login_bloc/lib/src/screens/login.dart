// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'first.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SanFrancisco',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        body: LoginScreen(),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Company name, Inc",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      if (kDebugMode) {
        print("Hello world from _gestureRecognizer");
      }
    };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
         
          children: <Widget>[
            const SizedBox(height: 28),
            InkWell(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      '5562.png',
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  First()),
  );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Click on the image to login',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                 decorationStyle: TextDecorationStyle.wavy)
            ),
            Divider(color: Colors.white),
            const SizedBox(height: 20),
           
            const SizedBox(height: 16),
           
            const SizedBox(height: 16),
           
            const SizedBox(height: 16),
           
            const SizedBox(height: 24),
            Divider(color: Colors.white),
            const SizedBox(height: 24),
            const SizedBox(height: 16),
           
          ],
        ),
    ),
      );
  }
}
