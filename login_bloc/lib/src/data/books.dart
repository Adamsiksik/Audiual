class books{
  //data Type
  int? id;
  String? name;
  String? imageURL;
  String? pages;
// constructor
  books(
      {
       this.id,
      this.name,
      this.imageURL,
      this.pages
      }
   );
  //method that assign values to respective datatype vairables
  books.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    imageURL = json['imageUrl'];
    pages = json['pages'];
  }
}