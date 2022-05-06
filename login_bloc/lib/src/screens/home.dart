// ignore_for_file: prefer_const_constructors

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' show json, utf8;
import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/search.dart';

import '../compreal/gradText.dart';
import '../compreal/nav.dart';
import '../data/books.dart';
import '../screens/bookpage.dart';

Future<List<books>> getbox() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.19:3000/books/all'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<books>((json) => books.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<books>> getHist() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.19:3000/books/gene?name=History'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<books>((json) => books.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<books>> getActi() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.19:3000/books/gene?name=Action'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<books>((json) => books.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<books>> getMyst() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.19:3000/books/gene?name=Mystery'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<books>((json) => books.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomeP();
}

class _HomeP extends State<HomeP> {
  late Future<List<books>> futurebooks;
  late Future<List<books>> futurehist;
  late Future<List<books>> futuremyst;
  bool pressAttention = true;
  bool pressAttention1 = true;
  bool pressAttention2 = true;
  bool pressAttention3 = true;
  bool pressAttention4 = true;
  bool pressAttention5 = true;
  bool pressAttention6 = true;
  List gen = [];
  late Future<List<books>> futureact;

  final search = TextEditingController();
  final padding = EdgeInsets.symmetric(horizontal: 8);
  String user = "click on the image to login";
  bool _isVisible = false;
  @override
  void initState() {
    super.initState();
    futurebooks = getbox();
    futurehist = getHist();
    futureact = getActi();
    futuremyst = getMyst();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          titleSpacing: 20,
          backgroundColor: Colors.blueGrey,
          title: const Text('Home Page'),
          actions: <Widget>[
            Visibility(
              visible: _isVisible,
              child: Row(
                children: <Widget>[
                  Align(
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
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      (Icons.settings),
                      size: 30.0,
                      color: Colors.brown[900],
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                return AlertDialog(
                                  content: Stack(
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            margin: EdgeInsets.only(
                                                left: 20, top: 10),
                                            child: GradientText(
                                              'Search by',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                              gradient:
                                                  LinearGradient(colors: const [
                                                Colors.blue,
                                                Colors.blueGrey,
                                              ]),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  margin:
                                                      EdgeInsets.only(left: 20),
                                                  child: GradientText(
                                                    'Year :',
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                    gradient: LinearGradient(
                                                        colors: const [
                                                          Colors.black,
                                                          Colors.blueGrey,
                                                        ]),
                                                  ),
                                                ),
                                                flex: 1,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 10,
                                                      top: 10,
                                                      bottom: 20),
                                                  child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'Enter Year',
                                                  )),
                                                ),
                                                flex: 3,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: GradientText(
                                                        'Genre :',
                                                        style: const TextStyle(
                                                            fontSize: 15),
                                                        gradient:
                                                            LinearGradient(
                                                                colors: const [
                                                              Colors.black,
                                                              Colors.blueGrey,
                                                            ]),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      child: RaisedButton(
                                                        child: Text('Action'),
                                                        textColor: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        color: pressAttention
                                                            ? Colors.grey
                                                            : Colors.blue,
                                                        onPressed: () => setState(
                                                            () => pressAttention =
                                                                !pressAttention),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: RaisedButton(
                                                          child:
                                                              Text('Adventure'),
                                                          textColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          color: pressAttention1
                                                              ? Colors.grey
                                                              : Colors.blue,
                                                          onPressed: () {
                                                            setState(() =>
                                                                pressAttention1 =
                                                                    !pressAttention1);
                                                            this.setState(
                                                                () {});
                                                          }),
                                                    ),
                                                    Expanded(
                                                      child: RaisedButton(
                                                          child:
                                                              Text('Mystery'),
                                                          textColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          color: pressAttention2
                                                              ? Colors.grey
                                                              : Colors.blue,
                                                          onPressed: () {
                                                            setState(() =>
                                                                pressAttention2 =
                                                                    !pressAttention2);
                                                            this.setState(
                                                                () {});
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: RaisedButton(
                                                          child: Text('Crime'),
                                                          textColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          color: pressAttention3
                                                              ? Colors.grey
                                                              : Colors.blue,
                                                          onPressed: () {
                                                            setState(() =>
                                                                pressAttention3 =
                                                                    !pressAttention3);
                                                            this.setState(
                                                                () {});
                                                          }),
                                                    ),
                                                    Expanded(
                                                      child: RaisedButton(
                                                          child:
                                                              Text('Romance'),
                                                          textColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          color: pressAttention4
                                                              ? Colors.grey
                                                              : Colors.blue,
                                                          onPressed: () {
                                                            setState(() =>
                                                                pressAttention4 =
                                                                    !pressAttention4);
                                                            this.setState(
                                                                () {});
                                                          }),
                                                    ),
                                                    Expanded(
                                                      child: RaisedButton(
                                                          child:
                                                              Text('History '),
                                                          textColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          color: pressAttention5
                                                              ? Colors.grey
                                                              : Colors.blue,
                                                          onPressed: () {
                                                            setState(() =>
                                                                pressAttention5 =
                                                                    !pressAttention5);
                                                            this.setState(
                                                                () {});
                                                          }),
                                                    ),
                                                    Expanded(
                                                      child: RaisedButton(
                                                          child: Text('Sports'),
                                                          textColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          color: pressAttention6
                                                              ? Colors.grey
                                                              : Colors.blue,
                                                          onPressed: () {
                                                            setState(() =>
                                                                pressAttention6 =
                                                                    !pressAttention6);
                                                            this.setState(
                                                                () {});
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          RaisedButton(
                                            onPressed: () async {},
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        80.0)),
                                            padding: EdgeInsets.all(0.0),
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff374ABE),
                                                      Color(0xff64B6FF)
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 250.0,
                                                    minHeight: 50.0),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Submit",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }));
                    },
                  ),
                ],
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
                    MaterialPageRoute(
                        builder: (context) => Search(search.text)),
                  );
                }
              },
            ),
            Padding(padding: padding)
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: GradientText(
                    'Best Action Books',
                    style: const TextStyle(fontSize: 20),
                    gradient: LinearGradient(colors: const [
                      Colors.blue,
                      Colors.blueGrey,
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 150.0,
                  width: double.infinity,
                  child: FutureBuilder<List<books>>(
                    future: futureact,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData &&
                          snapshot.data != null) {
                        return SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => SizedBox(
                              height: 150,
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => BookPage(snapshot
                                              .data![index].ISBN
                                              .toString())))
                                },
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          height: 150,
                                          child: Image(
                                            image: NetworkImage(
                                                "${snapshot.data![index].ImageURLS}"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: GradientText(
                    'Best History Books',
                    style: const TextStyle(fontSize: 20),
                    gradient: LinearGradient(colors: const [
                      Colors.blue,
                      Colors.blueGrey,
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 150.0,
                  width: double.infinity,
                  child: FutureBuilder<List<books>>(
                    future: futurehist,
                    builder: (context, snapshot2) {
                      if (snapshot2.connectionState == ConnectionState.done &&
                          snapshot2.hasData &&
                          snapshot2.data != null) {
                        return SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot2.data!.length,
                            itemBuilder: (_, index) => SizedBox(
                              height: 150,
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => BookPage(snapshot2
                                              .data![index].ISBN
                                              .toString())))
                                },
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          height: 150,
                                          child: Image(
                                            image: NetworkImage(
                                                "${snapshot2.data![index].ImageURLS}"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: GradientText(
                    'Best Mystery Books',
                    style: const TextStyle(fontSize: 20),
                    gradient: LinearGradient(colors: const [
                      Colors.blue,
                      Colors.blueGrey,
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 150.0,
                  width: double.infinity,
                  child: FutureBuilder<List<books>>(
                    future: futuremyst,
                    builder: (context, snapshot2) {
                      if (snapshot2.connectionState == ConnectionState.done &&
                          snapshot2.hasData &&
                          snapshot2.data != null) {
                        return SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot2.data!.length,
                            itemBuilder: (_, index) => SizedBox(
                              height: 150,
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => BookPage(snapshot2
                                              .data![index].ISBN
                                              .toString())))
                                },
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          height: 150,
                                          child: Image(
                                            image: NetworkImage(
                                                "${snapshot2.data![index].ImageURLS}"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: GradientText(
                    'Books To Read',
                    style: const TextStyle(fontSize: 20),
                    gradient: LinearGradient(colors: const [
                      Colors.blue,
                      Colors.blueGrey,
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 150.0,
                  width: double.infinity,
                  child: FutureBuilder<List<books>>(
                    future: futurebooks,
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData &&
                          snapshot.data != null) {
                        return SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => SizedBox(
                              height: 150,
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => BookPage(snapshot
                                              .data![index].ISBN
                                              .toString())))
                                },
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          height: 150,
                                          child: Image(
                                            image: NetworkImage(
                                                "${snapshot.data![index].ImageURLS}"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}