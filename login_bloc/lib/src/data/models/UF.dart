// ignore_for_file: prefer_collection_literals, non_constant_identifier_names

class UserFull {
  late String Email;
  late String DOB;
  late String Gender;
  late String UserName;
  late String Password;

  UserFull({
    required this.Email,
    required this.Password,
    required this.Gender,
    required this.UserName,
    required this.DOB,
  });

  UserFull.fromJson(Map<String, dynamic> json) {
    Email = json['Email'];
    Password = json['Password'];
    Gender = json['gender'];
    DOB = json['DoB'];
    Email = json['Email'];
    UserName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['Email'] = Email;
    data['Password'] =Password;
    data['gender'] = Gender;
    data['DoB'] =DOB;
    data['userName'] = UserName;
    return data;
  }
   factory UserFull.fromMap(Map<String, dynamic> json) => UserFull(
        Email: json["Email"],
        Password: json["Password"],
        Gender: json["Gender"],
        DOB : json['DoB'],
      UserName: json['userName'],
      );
}
