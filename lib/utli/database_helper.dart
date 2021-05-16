import 'package:app_ecommerce/utli/constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/categories.dart';

class DBHelper {
  static final DBHelper _dbHelper = new DBHelper.internal();

  factory DBHelper() => _dbHelper;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  DBHelper.internal();

  initDB() async {
// Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'data.db');

    var theDB = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(Constant.CREATE_CATEGORY);
      await db.execute(Constant.CREATE_PRODUCT);

      await initData();
    });
    return theDB;
  }

  initData() async {
    List<Category> data = [
      Category("Phones", "assets/phone.png"),
      Category("Computers", "assets/computer.png"),
      Category("Heals", "assets/health.png"),
      Category("Books", "assets/books.png"),
      Category("Stationery ", "assets/books.png"),
    ];
    var idTMP = 0;
    data.forEach((element) {
      element.setCategoryID(idTMP);
      addNewCategory(element);
      idTMP++;
    });
  }

  Future<int> addNewCategory(Category category) async {
    var database = await db;
    database.transaction((txn) async {
      int result =
          await database.insert(Constant.TABLE_CATEGORY, category.toMap());
      return result;
    });
  }

  Future<List<Category>> getAllCategory() async {
    var database = await db;
    List<Map> list;
    list = await database.rawQuery("SELECT * FROM " + Constant.TABLE_CATEGORY);
    // ignore: deprecated_member_use
    List<Category> categories = new List();
    list.forEach((element) {
      var category = new Category(element[Constant.CATEGORY_NAME],
          element[Constant.CATEGORY_IMAGE_URL]);
      category.setCategoryID(element[Constant.CATEGORY_ID]);
      categories.add(category);
    });

    return categories;
  }

  Future<int> deleteAllCategory() async {
    var database = await db;

    int result =
        await database.rawDelete("DELETE FROM " + Constant.TABLE_CATEGORY);
    return result;
  }

  Future<int> deleteCategory(Category category) async {
    var database = await db;

    int result = await database.rawDelete(
        "DELETE FROM " + Constant.TABLE_CATEGORY + " WHERE id = ?",
        [category.id]);
    return result;
  }

  Future<bool> updateCategory(Category category) async {
    var database = await db;

    int result = await database.update(
        Constant.TABLE_CATEGORY, category.toMap(),
        where: "id = ?", whereArgs: <int>[category.id]);

    return result > 0 ? true : false;
  }
}
