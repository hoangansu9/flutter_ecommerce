class Products {
  int _id;
  String _name;
  String _image;
  String _chip;
  String _camera;
  String _ram;
  String _storage;
  String _details;
  String _features;
  double _price;
  int _categoryId;

  Products(
      this._name,
      this._image,
      this._chip,
      this._camera,
      this._ram,
      this._storage,
      this._details,
      this._features,
      this._price,
      this._categoryId);


  Products.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._chip = obj['chip'];
    this._camera = obj['camera'];
    this._ram = obj['ram'];
    this._storage = obj['storage'];
    this._details = obj['details'];
    this._features = obj['features'];
    this._price = obj['price'];
    this._categoryId = obj['categoryId'];
  }

  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get chip => _chip;
  String get camera => _camera;
  String get ram => _ram;
  String get storage => _storage;
  String get details => _details;
  String get features => _features;
  double get price => _price;
  int get categoryId => _categoryId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['image'] = _image;
    map['chip'] = _chip;
    map['camera'] = _camera;
    map['ram'] = _ram;
    map['storage'] = _storage;
    map['details'] = _details;
    map['features'] = _features;
    map['price'] = _price;
    map['categoryId'] = _categoryId;
    return map;
  }

  Products.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._chip = map['chip'];
    this._image = map['image'];
    this._camera = map['camera'];
    this._ram = map['ram'];
    this._storage = map['storage'];
    this._details = map['details'];
    this._features = map['features'];
    this._price = map['price'];
    this._categoryId = map['categoryId'];
  }
}
