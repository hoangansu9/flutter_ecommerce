class Categories {
  int _id;
  String _title;
  String _image;

  // Categories({this.id, this.title, this.image});
  // static List<Categories> init() {
  //   List<Categories> data = [
  //     Categories(id: 1, title: "Phones", image: "assets/phone.png"),
  //     Categories(id: 2, title: "Computers", image: "assets/computer.png"),
  //     Categories(id: 3, title: "Heals", image: "assets/health.png"),
  //     Categories(id: 4, title: "Books", image: "assets/books.png"),
  //     Categories(id: 5, title: "Stationery ", image: "assets/books.png"),
  //   ];
  //   return data;
  // }
  Categories(this._title, this._image);
  Categories.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._image = obj['image'];
  }

  int get id => _id;
  String get title => _title;
  String get image => _image;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['image'] = _image;

    return map;
  }

  Categories.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._image = map['image'];
  }
}
