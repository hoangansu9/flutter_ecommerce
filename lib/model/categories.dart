import '../utli/constant.dart';

class Category {
  int id;
  String _categoryName;
  String _categoryImageUrl;

  Category(this._categoryName, this._categoryImageUrl);

  Category.map(dynamic object) {
    this.id = object[Constant.CATEGORY_ID];
    this._categoryName = object[Constant.CATEGORY_NAME];
    this._categoryImageUrl = object[Constant.CATEGORY_IMAGE_URL];
  }

  String get categoryName => _categoryName;
  String get categoryImageUrl => _categoryImageUrl;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map[Constant.CATEGORY_ID] = id;
    map[Constant.CATEGORY_NAME] = _categoryName;
    map[Constant.CATEGORY_IMAGE_URL] = _categoryImageUrl;

    return map;
  }

  void setCategoryID(int id) {
    this.id = id;
  }
}
