// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:convert' show json, utf8;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../data/books.dart';

List<Book> bookFromJson(String str) =>
    List<Book>.from(json.decode(str).map((x) => Book.fromMap(x)));

class Book {
  Book({
    required this.title,
    required this.thumbnailUrl,
    required this.pageCount,
  });

  String title;
  String thumbnailUrl;
  String pageCount;

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        title: json["title"],
        thumbnailUrl: json["thumbnailUrl"],
        pageCount: json["pageCount"],
      );
}

Future<List<Book>> fetchPost() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/books'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Book>((json) => Book.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class ListV extends StatefulWidget {
  @override
  late Future<List<Book>> futurePost;
  _list createState() => _list();
}

class _list extends State<ListV> {
  late Future<List<Book>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Book>>(
      future: futurePost,
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => Container(
              child: Container(
                height: 150,
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
                                "${snapshot.data![index].thumbnailUrl}"),
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
                                  "${snapshot.data![index].title.toString()}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, top: 20),
                                child: Text("Rating:" +
                                    "${snapshot.data![index].pageCount.toString()}"),
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
