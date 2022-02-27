import 'dart:convert';

import 'package:http/http.dart' as http;
import '../const/url.dart';
import '../const/route.dart';
import '../models/respond.dart';
import '../models/user.dart';
import '../models/user_list.dart';

class ApiService {
  static final ApiService _apiService = ApiService._init();

  factory ApiService() {
    return _apiService;
  }

  ApiService._init();

 
  Future<Response> createuser(User user) async {
     final url = Uri.parse(
      AppConstants.API_URL + UserMethodConstants.signup,
    );
    final request = await http.post(
      url,
      body: jsonEncode(user.toJson()),
      headers: AppConstants.HEADERS,
    );
    Response response = Response();
    try {
      if (request.statusCode == 201) {
        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }


  //get all data
  Future<List<UserList>> getuser() async {
    final url = Uri.parse(
      AppConstants.API_URL + UserMethodConstants.login,
    );
    final request = await http.get(
      url,
      headers: AppConstants.HEADERS,
    );
    List<UserList> tasklist = [];
    try {
      if (request.statusCode == 200) {
        tasklist = userListFromJson(request.body);
      } else {
        print(request.statusCode);
        return const [];
      }
    } catch (e) {
      return const [];
    }
    return tasklist;
  }
}
