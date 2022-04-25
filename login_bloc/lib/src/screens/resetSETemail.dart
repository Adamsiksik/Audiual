// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'resetSETkey.dart';
import 'package:flutter_session/flutter_session.dart';
import '../data/api/apiser.dart';
import '../data/models/user.dart';
import 'first.dart';

class reset extends StatefulWidget {
  @override
  _resetState createState() => _resetState();
}

class _resetState extends State<reset> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final PassController = TextEditingController();
  late String something;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'abc@mail.com'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter valid email "),
                      EmailValidator(errorText: "Enter valid email "),
                    ])),
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
                          .resetCheckUser(myController.text.toLowerCase());
                      print(result.message.toString());
                      final usernameController =
                          myController.text.toLowerCase();
                      print(result.message.toString() + "result");
                      if (result.message.toString() ==
                          "no user with such email") {
                        print("no user");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => reset()));
                      } else if (result.message.toString() ==
                          "check your email to rest your password ") {
                        await FlutterSession().set('token', myController.text);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    resetSETkey(usernameController)));
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
            ],
          ),
        ),
      ),
    );
  }
}
