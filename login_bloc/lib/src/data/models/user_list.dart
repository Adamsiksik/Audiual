import 'dart:convert';

List<UserList> userListFromJson(String str) => List<UserList>.from(json.decode(str).map((x) => UserList.fromJson(x)));

String userListToJson(List<UserList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserList {
    UserList({
        required this.id,
        required this.email,
        required this.password,
        required this.createdDate,
        required this.v,
    });

    String id;
    String email;
    String password;
    DateTime createdDate;
    int v;

    factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        createdDate: DateTime.parse(json["createdDate"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "createdDate": createdDate.toIso8601String(),
        "__v": v,
    };
}