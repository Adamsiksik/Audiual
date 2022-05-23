// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:convert' show json, utf8;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../compreal/nav.dart';
import '../data/api/apiser.dart';
import '../data/books.dart';
import '../screens/bookpage.dart';

List<books> bookFromJson(String str) =>
    List<books>.from(json.decode(str).map((x) => books.fromMap(x)));

Future<List<books>> fetchliked(String s) async {
  print('http://192.168.1.106:3000/books/search?name=${s}');
  final response = await http
      .get(Uri.parse('http://192.168.1.106:3000/books/search?Book_Title=${s}'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<books>((json) => books.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Search extends StatefulWidget {
  @override
  late String something;
  Search(this.something);
  late Future<List<books>> liked;
  _Search createState() => _Search(this.something);
}

class _Search extends State<Search> {
  final padding = EdgeInsets.symmetric(horizontal: 8);
  String s = "ss";
  late Future<List<books>> liked;
  late String something;
  final search = TextEditingController();

  _Search(this.something);
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    liked = fetchliked(something);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          titleSpacing: 20,
          backgroundColor: Colors.blueGrey,
          title: const Text('Search Result'),
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
                      color: Colors.black,
                      fontSize: 12.0,
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
                    MaterialPageRoute(
                        builder: (context) => Search(search.text)),
                  );
                }
              },
            ),
            Padding(padding: padding)
          ],
        ),
        body: FutureBuilder<List<books>>(
          future: liked,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData != null &&
                snapshot.data != null) {
              print(snapshot);
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  height: 150,
                  child: GestureDetector(
                    onTap: () async => {
                      s = await FlutterSession().get('token'),
                      if (s == "click on the image to login" ||
                          s.toString() == "null")
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BookPage(
                                      snapshot.data![index].ISBN.toString(),
                                      s)))
                        }
                      else
                        {
                          await ApiService().hist(s.toString(),
                              snapshot.data![index].ISBN.toString()),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BookPage(
                                      snapshot.data![index].ISBN.toString(),
                                      s)))
                        },
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 100,
                              child: Image(
                                image: NetworkImage(
                                    "${snapshot.data![index].ImageURLS}"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      "${snapshot.data![index].BookTitle.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, top: 20),
                                    child: Text("year:" +
                                        "${snapshot.data![index].YearOfPublication.toString()}"),
                                  ),
                                ],
                              ),
                            ))
                          ],
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
        ));
  }

  Future<List<books>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('json/books.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => books.fromJson(e)).toList();
  }
}
