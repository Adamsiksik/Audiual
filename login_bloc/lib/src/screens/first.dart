import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get/get.dart';
import 'package:login_bloc/src/screens/search.dart';
import '../compreal/nav.dart';
import '../compreal/list.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _Firststate();
}

class _Firststate extends State<First> {
  final search = TextEditingController();
  final padding = EdgeInsets.symmetric(horizontal: 8);
  String user = "Click on the image to login";
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.blueGrey,
        title: const Text('Newest Books'),
        actions: <Widget>[
          Visibility(
            visible: _isVisible,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 200.0,
                height: 60.0,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 0.0, bottom: 10.0, right: 0.0),
                child: TextFormField(
                  controller: search,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter A book to Search',
                  ),
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              (Icons.search),
              size: 30.0,
              color: Colors.brown[900],
            ),
            onPressed: () {
              if (!_isVisible) {
                setState(() {
                  _isVisible = true;
                });
              } else if (_isVisible) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search(search.text)),
                );
              }
            },
          ),
          Padding(padding: padding)
        ],
      ),
      body: ListV(),
    );
  }
}
