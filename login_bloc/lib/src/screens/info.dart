// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'login.dart';
import 'first.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final PassController = TextEditingController();

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
        title: Text("Personal Infromation")
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                      width: 240,
                      height: 80,
                      child: GradientText(
  'Welcome',
  style: const TextStyle(fontSize: 50),
  gradient: LinearGradient(colors: [
    Colors.black,
    Colors.red,
  ]),)))),       
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
                    ])
              ),),
             
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
                     validator: (value){
                      if(value==null||value.isEmpty){
                      return 'Password Cant be Empty';
                      }               
                     }
                                         ),
              ),
           
           
            ],
          ),
          
        ),

      ),
    );
  }
}


class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}