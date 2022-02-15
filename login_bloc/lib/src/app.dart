// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/first.dart';

class App extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,

      initialRoute: '/',
  routes: {
  
    '/home': (context) => First(),
  },
      title: 'Log in screen',
      home: Scaffold(

        body: Center(child: First()),
      ),
    );
  }
}
