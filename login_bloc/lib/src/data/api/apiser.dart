import 'dart:convert';

import 'package:http/http.dart' as http;
import '../books.dart';
import '../const/url.dart';
import '../const/route.dart';
import '../models/respond.dart';
import '../models/user.dart';
import '../models/info.dart';


class ApiService {
  static final ApiService _apiService = ApiService._init();

  factory ApiService() {
    return _apiService;
  }

  ApiService._init();

  Future<Response> createuser(User user) async {
    final url = Uri.parse("http://localhost:3000/users/signup");
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

    Future<Response> Userinfo(Info info) async {
    final url = Uri.parse("http://localhost:3000/users/signup2");
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
final request =  await http.post(Uri.parse("http://localhost:3000/books/book?isbn=${something}"));
  books book = books();
    try {
      if (request.statusCode == 200) {
        final parsed=json.decode(request.body).cast<Map<String, dynamic>>();
        book =parsed.map<books>((json) => books.fromMap(json)).toList();
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
    final url = Uri.parse("http://localhost:3000/users/login");
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
}

