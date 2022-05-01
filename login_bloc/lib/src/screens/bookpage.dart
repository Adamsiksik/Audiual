// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:convert' show json, utf8;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:login_bloc/src/screens/pdf.dart';
import '../data/api/apiser.dart';
import '../data/books.dart';
import '../screens/bookpage.dart';
import 'audio.dart';

List<books> bookFromJson(String str) =>
    List<books>.from(json.decode(str).map((x) => books.fromMap(x)));

Future<List<books>> fetchPost(String something) async {
  final response = await http
      .get(Uri.parse('http://192.168.1.19:3000/books/book?isbn=${something}'));
  if (response.statusCode == 200) {
    final parsed = json.decode("[" + response.body + "]") as List<dynamic>;
    return parsed.map<books>((json) => books.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class BookPage extends StatefulWidget {
  String something;
  late Future<books> futurePost;
  BookPage(this.something);
  @override
  _BookPageState createState() => _BookPageState(this.something);
}

class _BookPageState extends State<BookPage> {
  late bool ispressed = false;

  late Future<List<books>> futurePost;
  late String something;

  _BookPageState(this.something);
  final padding = EdgeInsets.symmetric(horizontal: 8);

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost(something);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<books>>(
        future: fetchPost(something),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print("2" + snapshot.toString());
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 20,
                backgroundColor: Colors.blueGrey,
                title: Text(snapshot.data![0].BookTitle.toString()),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      (Icons.favorite),
                      size: 30.0,
                      color:
                          (ispressed) ? Color(0xff007397) : Color(0xff9A9A9A),
                    ),
                    onPressed: () async {
                      if (!ispressed) {
                        setState(() {
                          ispressed = true;
                        });
                      } else {
                        setState(() {
                          ispressed = false;
                        });
                      }
                      String s = await FlutterSession().get('token');
                      await ApiService().like(
                          s.toString(), snapshot.data![0].BookTitle.toString());
                    },
                  ),
                  Padding(padding: padding)
                ],
              ),
              body: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {},
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 40, top: 30),
                                width: 170,
                                height: 400,
                                child: Image(
                                  image: NetworkImage(
                                      "${snapshot.data![0].ImageURLS}"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, top: 30),
                                        child: Text(
                                          "${snapshot.data![0].BookTitle.toString()}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, top: 20),
                                        child: Text("year:" +
                                            "${snapshot.data![0].YearOfPublication.toString()}"),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, top: 20),
                                        child: Text("Author:" +
                                            "${snapshot.data![0].BookAuthor.toString()}"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {},
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 30, top: 20),
                                      child: IconButton(
                                        icon: Icon(
                                          (Icons.watch_later),
                                          size: 40.0,
                                          color: Colors.blue[900],
                                        ),
                                        onPressed: () async {
                                          String s = await FlutterSession()
                                              .get('token');
                                          await ApiService().later(
                                              s.toString(),
                                              snapshot.data![0].BookTitle
                                                  .toString());
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: IconButton(
                                          icon: Icon(
                                            (Icons.play_arrow),
                                            size: 40.0,
                                            color: Colors.blue[900],
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => MyApp(
                                                      snapshot.data![0].ISBN
                                                          .toString())),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: Text(
                                            'PreRecorded Audio',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 30, top: 20),
                                        child: IconButton(
                                          icon: Icon(
                                            (Icons.play_arrow),
                                            size: 40.0,
                                            color: Colors.blue[900],
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                  snapshot.data![0].ISBN
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const Text(
                                        'Text To Speech',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
    );
  }

  Future<List<books>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('json/books.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => books.fromJson(e)).toList();
  }
}
