// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/first.dart';
import '../compreal/gradText.dart';

class BookPage extends StatefulWidget {
   String something;
    BookPage(this.something);
  @override
  _BookPageState createState() => _BookPageState(this.something);
}

class _BookPageState extends State<BookPage> {
 late String something;
  _BookPageState(this.something);
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: FlutterSession().get('token'), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(
          title:Text(something)
        ),
        );
      },
    );
  }
}
