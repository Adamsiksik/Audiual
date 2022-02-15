class books{
  //data Type
  int? id;
  String? name;
  String? imageURL;
  String? pages;
  String ? rating;
// constructor
  books(
      {
       this.id,
      this.name,
      this.imageURL,
      this.pages,
       this.rating
      }
   );
  //method that assign values to respective datatype vairables
  books.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    imageURL = json['imageUrl'];
    pages = json['pages'];
    rating = json['rating'];
  }
}