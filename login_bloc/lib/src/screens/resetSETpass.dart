// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';
import 'login.dart';
import 'resetSETemail.dart';

import 'package:flutter_session/flutter_session.dart';
import '../data/api/apiser.dart';
import '../data/models/user.dart';
import 'first.dart';

class resetpass extends StatefulWidget {
  @override
  late String something;
  resetpass(this.something);

  _resetpassState createState() => _resetpassState(this.something);
}

class _resetpassState extends State<resetpass> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final PassController2 = TextEditingController();
  final PassController = TextEditingController();
  late String something;
  _resetpassState(this.something);
  get usernameController => null;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    PassController2.dispose();
    PassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(" Reset Password page "),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => First()));
            },
          )),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode:
              AutovalidateMode.always, //check for validation while typing
          key: formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                    child: Container(
                  width: 200,
                  height: 150,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 15),
                child: TextFormField(
                    controller: PassController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Cant be Empty';
                      }
                      if (value != PassController2.text) {
                        return 'Password has to be the same';
                      }
                      if (value.length < 6) {
                        return 'Password Cant be less than 6 Characters ';
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 20),
                child: TextFormField(
                    controller: PassController2,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        hintText: 'Enter secure password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Cant be Empty';
                      }
                      if (value != PassController.text) {
                        return 'Password has to be the same';
                      }
                      if (value.length < 6) {
                        return 'Password Cant be less than 6 Characters ';
                      }
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  InkWell(
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // ignore: prefer_const_constructors
                      ),
                    ),
                    onTap: () {},
                  ),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  InkWell(
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      final result = await ApiService()
                          .resetCheckUserpass(something, PassController2.text);
                      print(result.message.toString());
                      if (result.message.toString() ==
                          "your passwor has been updated ") {
                        print("your passwor has been updated ");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => resetpass(something)));
                      }
                    } else {
                      formkey.currentState!.validate();
                    }
                  },
                  child: Text(
                    'reset password ',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
