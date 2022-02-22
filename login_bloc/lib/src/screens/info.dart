// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables
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
    String gender = "Male";

  DateTime _dateTime = DateTime.now();
  bool pressAttention = true;
  bool pressAttention1 = true;
  bool pressAttention2 = true;
  bool pressAttention3 = true;
  bool pressAttention4 = true;
  bool pressAttention5 = true;
  bool pressAttention6 = true;

  int? groupValue;

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
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                      child: SizedBox(
                          width: 340,
                          height: 50,
                          child: GradientText(
                            'Please Enter Your Data',
                            style: const TextStyle(fontSize: 30),
                            gradient: LinearGradient(colors: const [
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
                    gradient: LinearGradient(colors: const [
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
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GradientText(
                            'Gender:',
                            style: const TextStyle(fontSize: 20),
                            gradient: LinearGradient(colors: const [
                              Colors.black,
                              Colors.blueGrey,
                            ]),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<int>(
                                  value: 1,
                                  groupValue: groupValue,
                                  toggleable: true,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupValue = value;
                                      gender="Male";
                                    });
                                  }),
                              Expanded(
                                child: Text('Male'),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<int>(
                                  value: 2,
                                  groupValue: groupValue,
                                  toggleable: true,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupValue = value;
                                      gender="Female";
                                    });
                                  }),
                              Expanded(child: Text('Female'))
                            ],
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GradientText(
                            'What are you interseted in :',
                            style: const TextStyle(fontSize: 15),
                            gradient: LinearGradient(colors: const [
                              Colors.black,
                              Colors.blueGrey,
                            ]),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: new Text('Action'),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: pressAttention ? Colors.grey : Colors.blue,
                            onPressed: () => setState(
                                () => pressAttention = !pressAttention),
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: new Text('Adventure'),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: pressAttention1 ? Colors.grey : Colors.blue,
                            onPressed: () => setState(
                                () => pressAttention1 = !pressAttention1),
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: new Text('Mystery '),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: pressAttention2 ? Colors.grey : Colors.blue,
                            onPressed: () => setState(
                                () => pressAttention2 = !pressAttention2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: RaisedButton(
                            child: new Text('Crime'),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: pressAttention3 ? Colors.grey : Colors.blue,
                            onPressed: () => setState(
                                () => pressAttention3 = !pressAttention3),
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: new Text('Romance'),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: pressAttention4 ? Colors.grey : Colors.blue,
                            onPressed: () => setState(
                                () => pressAttention4 = !pressAttention4),
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: new Text('History '),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: pressAttention5 ? Colors.grey : Colors.blue,
                            onPressed: () => setState(
                                () => pressAttention5 = !pressAttention5),
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: new Text('Sports'),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: pressAttention6 ? Colors.grey : Colors.blue,
                            onPressed: () => setState(
                                () => pressAttention6 = !pressAttention6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Container(
             height: 50.0,
             margin: EdgeInsets.all(10),
             child: RaisedButton(
               onPressed: () { if (formkey.currentState!.validate()) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => First()));
                    print(myController.text);
                    print(_dateTime.toString());
                     print(gender);
                    print(pressAttention);
                    print(pressAttention1);
                    print(pressAttention2);
                    print(pressAttention3);
                    print(pressAttention4);
                    print(pressAttention5);
                    print(pressAttention6);
                  }},
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
                     "Submit",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 15),
                   ),
                 ),
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
