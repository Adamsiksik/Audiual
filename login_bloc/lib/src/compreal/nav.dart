// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import '../screens/login.dart';
import '../screens/first.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  String user="Click on the image to login";
  Widget build(BuildContext context) {
      
      return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 28),
              FutureBuilder<dynamic>(
              future: FlutterSession().get('token'),
              builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
                if(snapshot.hasData){
                 user=snapshot.data.toString();
                 print(user);
                }
                return Text("");
              }
            ),
            InkWell(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      '5562.png',
                    ),
                  ),
                ),
              ),
              onTap: () {
                if(user=="Click on the image to login"){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }
               else{
                FlutterSession().set("token", 'Click on the image to login');
              }
              }
             
            ),
            const SizedBox(height: 20),
            Text(user,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                    decorationStyle: TextDecorationStyle.wavy)),
            Divider(color: Colors.white),
            const SizedBox(height: 20),
            MenuItem(
              text: 'Recommended',
              icon: Icons.thumb_up_alt_sharp,
            ),
            const SizedBox(height: 16),
            MenuItem(
              text: 'List of books',
              icon: Icons.view_list_sharp,
            ),
            const SizedBox(height: 16),
            MenuItem(
              text: 'Popular',
              icon: Icons.local_fire_department,
            ),
            const SizedBox(height: 16),
            MenuItem(
              text: 'Best',
              icon: Icons.favorite,
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white),
            const SizedBox(height: 24),
            const SizedBox(height: 16),
            MenuItem(text: 'History', icon: Icons.alarm),
            const SizedBox(height: 16),
            MenuItem(
              text: 'Listen to Later',
              icon: Icons.watch_later,
            ),
          ],
        ),
      ),
    );
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
