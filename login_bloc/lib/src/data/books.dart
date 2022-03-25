class books{
  //data Type

  String? ISBN;
  String? BookTitle;
  String? BookAuthor;
  String? YearOfPublication;
  String ? ImageURLS;
// constructor
  books(
      {
      this.BookTitle,
       this.ISBN,
      this.BookAuthor,
      this.YearOfPublication,
      this.ImageURLS,
      }
   );
  //method that assign values to respective datatype vairables
  books.fromJson(Map<String,dynamic> json)
  {
    ISBN = json['ISBN '];
    BookTitle=json['Book-Title'];
    BookAuthor =json['Book-Author'];
    YearOfPublication = json['Year-Of-Publication'];
    ImageURLS = json['Image-URL-S'];
  }
   factory books.fromMap(Map<String, dynamic> json) => books(
        ISBN: json["ISBN"],
        BookTitle: json["Book-Title"],
        BookAuthor: json["Book-Author"],
        YearOfPublication : json['Year-Of-Publication'],
    ImageURLS: json['Image-URL-S'],
      );
}