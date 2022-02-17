// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'first.dart';

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


  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

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
        title: Text("Login Page"),
      ),
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
                      child: Image.asset('jpeg2000-home.jpg')),
                ),
              ),
              Padding(

                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: TextFormField(
                    controller: myController2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Email',
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
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: "Password should be atleast 6 characters"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 characters")
                    ])
                    //validatePassword,        //Function to check validation
                    ),
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
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: "Password should be atleast 6 characters"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 characters")
                    ])
                    //validatePassword,        //Function to check validation
                    ),
              ),
             
              Container(
                  height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    content:
                    Text(myController.text);
                    if (formkey.currentState!.validate()) {
                      if(myController==myController2){
                      Navigator.push(
                      context, MaterialPageRoute(builder: (_) => First()));
                      print(myController.text);
                      print(PassController.text);
                      setState(() {
                      });
                      }
                      else{
                        formkey.currentState!.validate();
                      }
                      
                    } else {}
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
