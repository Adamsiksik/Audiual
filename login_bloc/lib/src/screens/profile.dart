// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/first.dart';
import '../compreal/gradText.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: FlutterSession().get('token'), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // AsyncSnapshot<Your object type>
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text("Profile"), actions: <Widget>[
            IconButton(
              icon: Icon(
                (Icons.logout),
                size: 30.0,
                color: Colors.brown[900],
              ),
              onPressed: () {
                FlutterSession().set("token", 'Click on the image to login');
                 Navigator.push(
                          context, MaterialPageRoute(builder: (_) => First()));
                    
              },
            ),
          ]),
          body: Column(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 45),
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        '5562.png',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: GradientText(
                  "Welcome User",
                  style: const TextStyle(fontSize: 20),
                  gradient: LinearGradient(colors: const [
                    Colors.black,
                    Colors.blueGrey,
                  ]),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GradientText(
                            "Email",
                            style: const TextStyle(fontSize: 20),
                            gradient: LinearGradient(colors: const [
                              Colors.black,
                              Colors.blueGrey,
                            ]),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            width: 200,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          flex: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GradientText(
                            "UserName",
                            style: const TextStyle(fontSize: 18),
                            gradient: LinearGradient(colors: const [
                              Colors.black,
                              Colors.blueGrey,
                            ]),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            width: 200,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          flex: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GradientText(
                            "Password",
                            style: const TextStyle(fontSize: 18),
                            gradient: LinearGradient(colors: const [
                              Colors.black,
                              Colors.blueGrey,
                            ]),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            width: 200,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          flex: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Change Data",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
 //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,