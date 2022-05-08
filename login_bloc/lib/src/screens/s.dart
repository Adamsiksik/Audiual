// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:convert' show json, utf8;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:login_bloc/src/screens/search.dart';
import '../compreal/nav.dart';
import '../data/api/apiser.dart';
import '../data/books.dart';
import '../screens/bookpage.dart';

List<books> bookFromJson(String str) =>
    List<books>.from(json.decode(str).map((x) => books.fromMap(x)));

Future<List<books>> fetchseached(String t, String y, String a, String i) async {
  print(
      'http://192.168.1.19:3000/books/searchh?Book_Title=$t&Book_Author=$a&YOP=$y&ISBN=$i');
  final response = await http.get(Uri.parse(
      'http://192.168.1.19:3000/books/searchh?Book_Title=$t&Book_Author=$a&YOP=$y&ISBN=$i'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<books>((json) => books.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Searchh extends StatefulWidget {
  @override
  late String title;
  late String year;
  late String auth;
  late String isbn;
  Searchh(this.title, this.year, this.auth, this.isbn);

  late Future<List<books>> seached;
  _Searchh createState() =>
      _Searchh(this.title, this.year, this.auth, this.isbn);
}

class _Searchh extends State<Searchh> {
  final padding = EdgeInsets.symmetric(horizontal: 8);
  String s = "ss";
  late String title;
  late String year;
  late String auth;
  late String isbn;
  late Future<List<books>> seached;
  late String something;
  final search = TextEditingController();

  _Searchh(this.title, this.year, this.auth, this.isbn);
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    seached = fetchseached(title, year, auth, isbn);
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
          future: seached,
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
                      if (s == "click on the image to login" || s == null)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BookPage(
                                      snapshot.data![index].ISBN.toString())))
                        }
                      else
                        {
                          await ApiService().hist(s.toString(),
                              snapshot.data![index].ISBN.toString()),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BookPage(
                                      snapshot.data![index].ISBN.toString())))
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
