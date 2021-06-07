import 'dart:async';

import 'package:app_ecommerce/model/categories.dart';
import 'package:app_ecommerce/model/products.dart';
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
  //
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

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
