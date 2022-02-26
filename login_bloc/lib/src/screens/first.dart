import 'package:flutter/material.dart';
import '../compreal/nav.dart';
import '../compreal/list.dart';


class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _Firststate();
}

class _Firststate extends State<First> {
 
    final padding = EdgeInsets.symmetric(horizontal: 8);

  @override
    Widget build(BuildContext context) {    
   return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        titleSpacing: 20,
            backgroundColor: Colors.blueGrey,
        title: const Text('Recommendation'),
      actions: <Widget>[
              IconButton(
                icon: Icon(
                  (Icons.search),
                  size: 30.0,
                  color: Colors.brown[900],
                ),
                onPressed: () {
                  //   _onDeleteItemPressed(index);
                },
              ),
              Padding(padding: padding)
            
            ],
          ),
      body: ListV(),
     );
  }
}

