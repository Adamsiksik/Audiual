// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_bloc/src/data/const/google_controler.dart';
import 'package:login_bloc/src/screens/resetSETemail.dart';
import 'info.dart';
import 'signup.dart';
import 'package:flutter_session/flutter_session.dart';
import '../data/api/apiser.dart';
import '../data/models/user.dart';
import 'first.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          title: Text("Login Page"),
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                      if (value.length < 6) {
                        return 'Password Cant be less than 6 Characters ';
                      }
                    }),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => reset()));
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
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
                      final result = await ApiService().checkuser(User(
                          Email: myController.text.toLowerCase(),
                          Password: PassController.text));
                      print(result.message.toString());
                      if (result.message.toString() == "bad password") {
                        print("bad");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      } else if (result.message.toString() ==
                          "no user with such email") {
                        print("no user");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      } else if (result.message.toString() == "Succeful") {
                        await FlutterSession().set('token', myController.text);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => First()));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      }
                    } else {
                      formkey.currentState!.validate();
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                onPressed: () async {
                  await googlecontroller.login();
                  var name =
                      await googlecontroller.googleAccount.value?.displayName ??
                          '';
                  var email =
                      await googlecontroller.googleAccount.value?.email ?? '';
                  FlutterSession().set('token', name);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoScreen(email, name)));
                },
                icon: Icon(Icons.g_mobiledata),
                label: Text('Sign in with Google'),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text(
                  'Make Account Using Email',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
