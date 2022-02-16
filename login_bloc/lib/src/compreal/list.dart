// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:convert' show json, utf8;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../data/books.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {
  Post({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.rating,
    required this.pages,
  });

  String name;
  int id;
  String imageUrl;
  String rating;
  String pages;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        name: json["name"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        rating: json["rating"],
        pages: json["pages"],
      );
}

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/feed/posts'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class ListV extends StatefulWidget {
  @override
  late Future<List<Post>> futurePost;
  _list createState() => _list();
}

class _list extends State<ListV> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Post>>(
      future: futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                                "${snapshot.data![index].imageUrl}"),
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
                                  "${snapshot.data![index].name.toString()}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, top: 20),
                                child: Text("Rating:" +
                                    "${snapshot.data![index].pages.toString()}"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, top: 20),
                                child: Text("Rating:" +
                                    "${snapshot.data![index].rating.toString()}"),
                              )
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
