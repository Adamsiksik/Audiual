import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'login.dart';
import 'info.dart';
import '../data/api/apiser.dart';
import '../data/models/user.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  final PassController = TextEditingController();
  final PassController2 = TextEditingController();

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
          title: Text("Signup Page"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      await ApiService()
                          .createuser(User(
                              email: myController.text,
                              password: PassController.text))
                          .then((data) {
                        if (data.result == true) {
                          setState(() {
                            myController.clear();
                            PassController.clear();
                            Text("Succ");
                          });
                        } else {
                          Text("error");
                        }
                      });
                    } else {
                      formkey.currentState!.validate();
                    }
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
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
