import 'dart:convert';

import 'package:http/http.dart' as http;
import '../const/url.dart';
import '../const/route.dart';
import '../models/respond.dart';
import '../models/user.dart';

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

