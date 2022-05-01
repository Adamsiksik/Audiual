// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_bloc/src/screens/likeb.dart';
import '../screens/login.dart';
import '../screens/first.dart';
import '../screens/profile.dart';
import '../screens/rec.dart';
import '../screens/watchlater.dart';
import 'list.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  void dispose() {
    super.dispose();
  }

  final padding = EdgeInsets.symmetric(horizontal: 20);
  String user = "";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future:
            FlutterSession().get('token'), // function where you call your api
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (user != "") {
              user = snapshot.data.toString().toLowerCase();
            } else {
              user = "click on the image to login";
            }
          } else {
            user = "click on the image to login";
          }
          return Drawer(
            child: Material(
              color: Color.fromRGBO(50, 75, 205, 1),
              child: ListView(
                padding: padding,
                children: <Widget>[
                  const SizedBox(height: 28),
                  InkWell(
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://imgur.com/gallery/mCHMpLT",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      onTap: () {
                        if (user == "click on the image to login") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen(user)),
                          );
                        }
                      }),
                  const SizedBox(height: 20),
                  Text(user,
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                          decorationStyle: TextDecorationStyle.wavy)),
                  Divider(color: Colors.white),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if (user == "click on the image to login") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LikedB(user)),
                        );
                      }
                    },
                    child: IgnorePointer(
                      child: MenuItem(
                        text: 'Liked',
                        icon: Icons.thumb_up_alt_sharp,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => First()),
                      );
                    },
                    child: IgnorePointer(
                      child: MenuItem(
                        text: 'List of Books',
                        icon: Icons.menu,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      if (user == "click on the image to login") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecB(user)),
                        );
                      }
                    },
                    child: IgnorePointer(
                      child: MenuItem(
                          text: 'Recommended',
                          icon: Icons.local_fire_department_sharp),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      if (user == "click on the image to login") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }
                    },
                    child: IgnorePointer(
                      child: MenuItem(text: 'Best', icon: Icons.favorite),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if (user == "click on the image to login") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }
                    },
                    child: IgnorePointer(
                      child: MenuItem(text: 'History', icon: Icons.alarm),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      if (user == "click on the image to login") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LaterB(user)),
                        );
                      }
                    },
                    child: IgnorePointer(
                      child: MenuItem(
                          text: 'Listen to later ', icon: Icons.watch_later),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget MenuItem({
    required String text,
    required IconData icon,
  }) {
    final color = Colors.lightBlueAccent;
    final hovorcolor = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hovorcolor,
      onTap: () {},
    );
  }
}
