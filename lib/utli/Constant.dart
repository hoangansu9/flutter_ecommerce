import 'package:app_ecommerce/model/user.dart';

class Constant {
  //category
  static const String tableCategory = 'cateTable';
  static const String columnIdCate = 'id';
  static const String columnTitleCate = 'title';
  static const String columnImageCate = 'image';

  static bool _isLoggedIn = false;
  static User _currentUser = null;
}
