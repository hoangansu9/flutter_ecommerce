import 'dart:async';

import 'package:app_ecommerce/model/categories.dart';
import 'package:app_ecommerce/model/order.dart';
import 'package:app_ecommerce/model/products.dart';
import 'package:app_ecommerce/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
//category
  final String tableCategory = 'cateTable';
  final String columnIdCate = 'id';
  final String columnTitleCate = 'title';
  final String columnImageCate = 'image';
//product
  final String tableProduct = 'productTable';
  final String columnIdProduct = 'id';
  final String columnNameProduct = 'name';
  final String columnImageProduct = 'image';
  final String columnChipProduct = 'chip';
  final String columnCamera = 'camera';
  final String columnRam = 'ram';
  final String columnStorage = 'storage';
  final String columnDetails = 'details';
  final String columnFeatures = 'features';
  final String columnPriceProduct = 'price';
  final String columnCategoryId = 'categoryId';
  //order
  final String tableOrder = 'orderTable';
  final String columnIdOrder = 'id';
  final String columnNameOrder = 'name';
  final String columnPhoneOrder = 'phone';
  final String columnAddressOrder = 'address';
  final String columnCodeOrder = 'code';

  //user
  final String tableUser = 'userTable';
  final String columnUserID = 'id';
  final String columnUserName = 'userName';
  final String columnPassword = 'password';
  final String columnEmail = 'email';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'ecommerce.db');

//    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path,
        version: 1, onCreate: _onCreate, onConfigure: _onConfigure);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    //category
    await db.execute(
        'CREATE TABLE $tableCategory($columnIdCate INTEGER PRIMARY KEY, $columnTitleCate TEXT, $columnImageCate TEXT)');
    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitleCate, $columnImageCate) VALUES ("Phones", "assets/phone.png")');
    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitleCate, $columnImageCate) VALUES ("Computers", "assets/computer.png")');
    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitleCate, $columnImageCate) VALUES ("Heals","assets/health.png")');
    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitleCate, $columnImageCate) VALUES ("Books","assets/books.png")');
    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitleCate, $columnImageCate) VALUES ("Stationery" ,"assets/books.png")');

    ///product
    await db.execute(
        'CREATE TABLE $tableProduct($columnIdProduct INTEGER PRIMARY KEY, $columnNameProduct TEXT,' +
            '$columnImageProduct TEXT, $columnChipProduct TEXT, $columnCamera TEXT,$columnRam TEXT,' +
            '$columnStorage TEXT, $columnDetails TEXT, $columnFeatures TEXT, $columnPriceProduct FLOAT, ' +
            '$columnCategoryId INTEGER, CONSTRAINT fk_category_product FOREIGN KEY ($columnCategoryId) REFERENCES $tableCategory ($columnIdCate))');

    //User
    await db.execute(
        'CREATE TABLE $tableUser($columnUserID INTEGER PRIMARY KEY, $columnUserName TEXT NOT NULL, $columnEmail TEXT NOT NULL, $columnPassword TEXT NOT NULL )');
    await db.rawInsert(
        'INSERT INTO $tableUser($columnUserName, $columnPassword, $columnEmail) VALUES ("admin123", "123444", "admin123@gmail.com")');

    ////order
    await db.execute(
        'CREATE TABLE $tableOrder($columnIdOrder INTEGER PRIMARY KEY, $columnNameOrder TEXT, $columnPhoneOrder TEXT, $columnAddressOrder TEXT, $columnCodeOrder TEXT)');
  }

//#region category
  Future<int> saveCate(Categories cate) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableCategory, cate.toMap());
    return result;
  }

  Future<List> getAllCates() async {
    var dbClient = await db;
    var result = await dbClient.query(tableCategory,
        columns: [columnIdCate, columnTitleCate, columnImageCate]);
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableCategory'));
  }

  Future<Categories> getCate(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableCategory,
        columns: [columnIdCate, columnTitleCate, columnImageCate],
        where: '$columnIdCate = ?',
        whereArgs: [id]);
    if (result.length > 0) {
      return new Categories.fromMap(result.first);
    }
    return null;
  }

  Future<int> deleteCate(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableCategory, where: '$columnIdCate = ?', whereArgs: [id]);
  }

  Future<int> updateCate(Categories note) async {
    var dbClient = await db;
    return await dbClient.update(tableCategory, note.toMap(),
        where: "$columnIdCate = ?", whereArgs: [note.id]);
  }
//#endregion

//#region product
  Future<int> saveProduct(Products products) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableProduct, products.toMap());
    return result;
  }

  Future<List> getAllProduct() async {
    var dbClient = await db;
    var result = await dbClient.query(tableProduct, columns: [
      columnIdProduct,
      columnNameProduct,
      columnImageProduct,
      columnChipProduct,
      columnCamera,
      columnRam,
      columnStorage,
      columnDetails,
      columnFeatures,
      columnPriceProduct,
      columnCategoryId
    ]);
    return result.toList();
  }

  Future<int> getCountProduct() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableProduct'));
  }

  Future<Products> getProduct(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableProduct,
        columns: [
          columnIdProduct,
          columnNameProduct,
          columnImageProduct,
          columnChipProduct,
          columnCamera,
          columnRam,
          columnStorage,
          columnDetails,
          columnFeatures,
          columnPriceProduct,
          columnCategoryId
        ],
        where: '$columnIdProduct = ?',
        whereArgs: [id]);
    if (result.length > 0) {
      return new Products.fromMap(result.first);
    }
    return null;
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableCategory, where: '$columnIdProduct = ?', whereArgs: [id]);
  }

  Future<int> updateProduct(Products product) async {
    var dbClient = await db;
    return await dbClient.update(tableProduct, product.toMap(),
        where: "$columnIdProduct = ?", whereArgs: [product.id]);
  }
//#endregion

//#region order
  Future<int> saveOrder(Order order) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableOrder, order.toMap());
    return result;
  }

  Future<List> getAllOrder() async {
    var dbClient = await db;
    var result = await dbClient.query(tableOrder, columns: [
      columnIdOrder,
      columnNameOrder,
      columnPhoneOrder,
      columnAddressOrder,
      columnCodeOrder
    ]);
    return result.toList();
  }

  Future<int> getCountOrder() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableOrder'));
  }

  Future<Categories> getOrder(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableOrder,
        columns: [
          columnIdOrder,
          columnNameOrder,
          columnPhoneOrder,
          columnAddressOrder,
          columnCodeOrder
        ],
        where: '$columnIdOrder = ?',
        whereArgs: [id]);
    if (result.length > 0) {
      return new Categories.fromMap(result.first);
    }
    return null;
  }

  Future<int> deleteOrder(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableOrder, where: '$columnIdOrder = ?', whereArgs: [id]);
  }

  Future<int> updateOrder(Order order) async {
    var dbClient = await db;
    return await dbClient.update(tableOrder, order.toMap(),
        where: "$columnIdOrder = ?", whereArgs: [order.id]);
  }
//#endregion

//#region user

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableUser, user.toMap());
    return result;
  }

  Future<User> getUser(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableUser,
        columns: [columnUserID, columnUserName, columnPassword, columnEmail],
        where: '$columnUserID = ?',
        whereArgs: [id]);
    if (result.length > 0) {
      return new User.fromMap(result.first);
    }
    return null;
  }

  Future<User> getWillLoginUser(User user) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableUser,
        columns: [columnUserID, columnUserName, columnPassword, columnEmail],
        where: '$columnUserName = ?',
        whereArgs: [user.userName]);
    if (result.length > 0) {
      return new User.fromMap(result.first);
    }
    return null;
  }
//#endregion

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
