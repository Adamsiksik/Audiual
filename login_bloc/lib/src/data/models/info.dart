class Info {
  late String Email;
  late String Username;
  late String Gender;
  late String DOB;
   late List Genre;

  Info({
    required this.Email,
    required this.Username,
   required this.Gender,
    required this.DOB,
     required this.Genre,

  });

  Info.fromJson(Map<String, dynamic> json) {
    Email = json['Email'];
    Username = json['Username'];
    Gender = json['Gender'];
    DOB = json['DOB'];
        Genre = json['genre'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['Email'] = Email;
    data['Username'] =Username;
    data['Gender'] =Gender;
    data['DOB'] =DOB;
        data['genre'] = Genre;

    return data;
  }
}