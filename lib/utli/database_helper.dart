import 'dart:async';

import 'package:app_ecommerce/model/categories.dart';
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
        'CREATE TABLE $tableProduct($columnIdProduct INTEGER PRIMARY KEY, $columnNameProduct TEXT,'
        '+ $columnImageProduct TEXT, $columnChipProduct TEXT, $columnCamera TEXT,$columnRam TEXT,+'
        '+ $columnStorage TEXT, $columnDetails TEXT, $columnFeatures TEXT, $columnPriceProduct TEXT)');
  }

  Future<int> saveCate(Categories cate) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableCategory, cate.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

    return result;
  }

  Future<List> getAllCates() async {
    var dbClient = await db;
    var result = await dbClient.query(tableCategory,
        columns: [columnIdCate, columnTitleCate, columnImageCate]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

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
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new Categories.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteCate(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableCategory, where: '$columnIdCate = ?', whereArgs: [id]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateCate(Categories note) async {
    var dbClient = await db;
    return await dbClient.update(tableCategory, note.toMap(),
        where: "$columnIdCate = ?", whereArgs: [note.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
