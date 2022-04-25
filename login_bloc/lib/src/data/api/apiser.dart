import 'dart:convert';
import 'package:http/http.dart' as http;
import '../books.dart';
import '../const/url.dart';
import '../const/route.dart';
import '../models/respond.dart';
import '../models/user.dart';
import '../models/UF.dart';

import '../models/info.dart';
<<<<<<< Updated upstream
=======
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
>>>>>>> Stashed changes

class ApiService {
  static final ApiService _apiService = ApiService._init();

  factory ApiService() {
    return _apiService;
  }

  ApiService._init();

  Future<Response> createuser(User user) async {
    final url = Uri.parse("http://192.168.1.19:3000/users/signup");
    final request = await http.post(
      url,
      body: jsonEncode(user.toJson()),
      headers: AppConstants.HEADERS,
    );
    Response response = Response();
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }

  Future<List<UserFull>> getuser(String s) async {
    final response = await http
<<<<<<< Updated upstream
        .get(Uri.parse('http://192.168.1.19:3000/users/profile?email=${s}'));
=======
        .get(Uri.parse('http://localhost:3000/users/profile?email=${s}'));
>>>>>>> Stashed changes
    print("http://localhost:3000/users/profile?email=${s}");

    if (response.statusCode == 200) {
      final parsed = json.decode("[" + response.body + "]") as List<dynamic>;
      return parsed.map<UserFull>((json) => UserFull.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<String> ispress(String s, String c) async {
    final response = await http.get(
<<<<<<< Updated upstream
        Uri.parse('192.168.1.19:3000/users/ispress?Email=${s}&likedbook=${c}'));
=======
        Uri.parse('localhost:3000/users/ispress?Email=${s}&likedbook=${c}'));
>>>>>>> Stashed changes

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load book');
    }
  }

  Future<Response> changeD(String s, String c) async {
    final url = Uri.parse(
<<<<<<< Updated upstream
        "http://192.168.1.19:3000/users/update?email=${s}&userName=${c}");
=======
        "http://localhost:3000/users/update?email=${s}&userName=${c}");
>>>>>>> Stashed changes
    print("localhost:3000/users/update?email=${s}&userName=${c}");
    final request = await http.post(
      url,
      headers: AppConstants.HEADERS,
    );
    Response response = Response();
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }

  Future<Response> like(String s, String c) async {
<<<<<<< Updated upstream
    print("http://192.168.1.19:3000/users/like?Email=${s}&likedbook=${c}");

    final url = Uri.parse(
        "http://192.168.1.19:3000/users/like?Email=${s}&likedbook=${c}");
=======
    print("http://localhost:3000/users/like?Email=${s}&likedbook=${c}");

    final url =
        Uri.parse("http://localhost:3000/users/like?Email=${s}&likedbook=${c}");
>>>>>>> Stashed changes
    final request = await http.post(
      url,
      headers: AppConstants.HEADERS,
    );
    Response response = Response();
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }

  Future<Response> Userinfo(Info info) async {
<<<<<<< Updated upstream
    final url = Uri.parse("http://192.168.1.19:3000/users/signup2");
=======
    final url = Uri.parse("http://localhost:3000/users/signup2");
>>>>>>> Stashed changes
    print(info.toJson());
    final request = await http.post(
      url,
      body: jsonEncode(info.toJson()),
      headers: AppConstants.HEADERS,
    );
    Response response = Response();
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }

  Future<books> getbook(String something) async {
<<<<<<< Updated upstream
    final request = await http.post(
        Uri.parse("http://192.168.1.19:3000/books/book?isbn=${something}"));
=======
    final request = await http
        .post(Uri.parse("http://localhost:3000/books/book?isbn=${something}"));
>>>>>>> Stashed changes
    books book = books();
    try {
      if (request.statusCode == 200) {
        final parsed = json.decode(request.body).cast<Map<String, dynamic>>();
        book = parsed.map<books>((json) => books.fromMap(json)).toList();
        print(book);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return books();
    }
    return book;
  }

  Future<Response> checkuser(User user) async {
<<<<<<< Updated upstream
    final url = Uri.parse("http://192.168.1.19:3000/users/login");
=======
    final url = Uri.parse("http://localhost:3000/users/login");
>>>>>>> Stashed changes
    final request = await http.post(
      url,
      body: jsonEncode(user.toJson()),
      headers: AppConstants.HEADERS,
    );
    Response response = Response();
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }
<<<<<<< Updated upstream
=======

  Future<Response> resetCheckUser(String user) async {
    print("sss");
    final request = await http
        .post(Uri.parse("http://localhost:3000/users/reset?Email=${user}"));

    Response response = Response();
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }

  Future<Response> resetCheckUserkey(String user) async {
    print("sss");
    final request = await http
        .get(Uri.parse("http://localhost:3000/users/resetkey?key=${user}"));

    Response response = Response();
    print(request.body);
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
        return response;
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      print("error " + request.body);
      return Response(message: e.toString());
    }
    return response;
  }

  Future<Response> resetCheckUserpass(String key, String pass) async {
    print("sss");
    final request = await http.get(Uri.parse(
        "http://localhost:3000/users/resetpass?key=${key}&password=${pass}"));
    print("asdasd");
    Response response = Response();
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }
>>>>>>> Stashed changes
}
