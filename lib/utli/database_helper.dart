import 'dart:async';

import 'package:app_ecommerce/model/categories.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableCategory = 'cateTable';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnImage = 'image';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'ecommerce.db');

//    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableCategory($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnImage TEXT)');

    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitle, $columnImage) VALUES ("Phones", "assets/phone.png")');

    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitle, $columnImage) VALUES ("Computers", "assets/computer.png")');

    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitle, $columnImage) VALUES ("Heals","assets/health.png")');

    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitle, $columnImage) VALUES ("Books","assets/books.png")');

    await db.rawInsert(
        'INSERT INTO $tableCategory($columnTitle, $columnImage) VALUES ("Stationery" ,"assets/books.png")');
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
    var result = await dbClient
        .query(tableCategory, columns: [columnId, columnTitle, columnImage]);
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
        columns: [columnId, columnTitle, columnImage],
        where: '$columnId = ?',
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
        .delete(tableCategory, where: '$columnId = ?', whereArgs: [id]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateCate(Categories note) async {
    var dbClient = await db;
    return await dbClient.update(tableCategory, note.toMap(),
        where: "$columnId = ?", whereArgs: [note.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
