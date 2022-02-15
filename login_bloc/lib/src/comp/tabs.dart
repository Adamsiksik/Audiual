import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
    final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            margin: EdgeInsets.all(2),
            color: msgCount[index]>=10? Colors.blue[400]:
              msgCount[index]>3? Colors.blue[100]: Colors.grey,
            child: Center(
              child: Text('${names[index]} (${msgCount[index]})',
                style: TextStyle(fontSize: 18),
              )
            ),
          );
        }
      )
    );
        }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
              child: 
              Text('Second Activity Screen',
                style: TextStyle(fontSize: 21),)
              )
            )
          );
  }
}
 
class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
              child: 
              Text('Third Activity Screen',
                style: TextStyle(fontSize: 21),)
              )
            )
          );
  }
}