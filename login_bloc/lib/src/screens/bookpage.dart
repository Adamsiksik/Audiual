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

Future<List<books>> getbox(String something) async {
  print('http://192.168.1.19:3000/books/same?isbn=${something}');
  final response = await http
      .get(Uri.parse('http://192.168.1.19:3000/books/same?isbn=${something}'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<books>((json) => books.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class BookPage extends StatefulWidget {
  String something;

  late Future<books> futurePost;
  late Future<List<books>> futurebooks;
  BookPage(this.something);
  @override
  _BookPageState createState() => _BookPageState(this.something);
}

class _BookPageState extends State<BookPage> {
  late bool ispressed = false;
  late Future<List<books>> futurebooks;

  late Future<List<books>> futurePost;
  late String something;

  _BookPageState(this.something);
  final padding = EdgeInsets.symmetric(horizontal: 8);

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost(something);
    futurebooks = getbox(something);
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
              body: SizedBox(
                child: Column(
                  children: <Widget>[
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
                      height: 130,
                      child: GestureDetector(
                        onTap: () => {},
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
                                    margin: EdgeInsets.only(left: 30, top: 20),
                                    child: IconButton(
                                      icon: Icon(
                                        (Icons.watch_later),
                                        size: 40.0,
                                        color: Colors.blue[900],
                                      ),
                                      onPressed: () async {
                                        String s =
                                            await FlutterSession().get('token');
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  content: Stack(
                                                      overflow:
                                                          Overflow.visible,
                                                      children: <Widget>[
                                                    Positioned(
                                                      right: -40.0,
                                                      top: -40.0,
                                                      child: InkResponse(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: CircleAvatar(
                                                          child:
                                                              Icon(Icons.close),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.blue,
                                                            minimumSize: const Size
                                                                    .fromHeight(
                                                                50), // NEW
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => MyApp(snapshot
                                                                          .data![
                                                                              0]
                                                                          .ISBN
                                                                          .toString() +
                                                                      "A")),
                                                            );
                                                          },
                                                          child: const Text(
                                                            'Audio1',
                                                            style: TextStyle(
                                                                fontSize: 24),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.blue,
                                                            minimumSize: const Size
                                                                    .fromHeight(
                                                                50), // NEW
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => MyApp(snapshot
                                                                          .data![
                                                                              0]
                                                                          .ISBN
                                                                          .toString() +
                                                                      "B")),
                                                            );
                                                          },
                                                          child: const Text(
                                                            'Audio2',
                                                            style: TextStyle(
                                                                fontSize: 24),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.blue,
                                                            minimumSize: const Size
                                                                    .fromHeight(
                                                                50), // NEW
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => MyApp(snapshot
                                                                          .data![
                                                                              0]
                                                                          .ISBN
                                                                          .toString() +
                                                                      "C")),
                                                            );
                                                          },
                                                          child: const Text(
                                                            'Audio3',
                                                            style: TextStyle(
                                                                fontSize: 24),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ]));
                                            });
                                      },
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Audio',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              builder: (context) => homepage(
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
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 30, bottom: 20),
                        child: Text(
                          "Books To Read",
                          style: DefaultTextStyle.of(context)
                              .style
                              .apply(fontSizeFactor: 1.5),
                        )),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder<List<books>>(
                        future: futurebooks,
                        builder: (context, snapshot) {
                          print(snapshot);
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
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
