// ignore_for_file: prefer_collection_literals, non_constant_identifier_names

class User {
  late String Email;
  late String Password;

  User({
    required this.Email,
    required this.Password,
  });

  User.fromJson(Map<String, dynamic> json) {
    Email = json['Email'];
    Password = json['Password'];
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['Email'] = Email;
    data['Password'] =Password;
    return data;
  }
}
