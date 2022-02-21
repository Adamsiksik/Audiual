// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'login.dart';
import 'first.dart';
import '../compreal/gradText.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final myController = TextEditingController();
  DateTime _dateTime = DateTime.now();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Personal Infromation")),
        body: SingleChildScrollView(
            child: Form(
                autovalidateMode:
                    AutovalidateMode.always, //check for validation while typing
                key: formkey,
                child: Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Center(
                          child: SizedBox(
                              width: 340,
                              height: 80,
                              child: GradientText(
                                'Please Enter Your Data',
                                style: const TextStyle(fontSize:30),
                                gradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.red,
                                ]),
                              )))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Fill Up This Field';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 0),
                    child: Row(children: <Widget>[
                      GradientText(
                        'Date Of Birth:',
                        style: const TextStyle(fontSize: 20),
                        gradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.blueGrey,
                        ]),
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        padding: EdgeInsets.only(left: 5),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime,
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now())
                              .then((date) {
                            setState(() {
                              _dateTime = date!;
                            });
                          });
                        },
                      ),
                    ]),
                  ),
                 Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                    child: Row(children: const <Widget>[
                      GradientText(
                        'Gender:',
                        style: TextStyle(fontSize: 20),
                        gradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.blueGrey,
                        ]),
                      ),
                     
                    ]),
                  ),
                ]))));
  }
}
