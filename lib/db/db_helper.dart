import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const int _version = 3;
  static const String _tableName = 'pureSoft';
  static Database? _database;

  static Future<Database?> initDb() async {
    if (_database != null) {
      return _database;
    }
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'pureSoft.db');
    _database = await openDatabase(path,
        version: _version, onCreate: onCreate, onUpgrade: onUpgrade);

    return _database;
  }

  static onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, titleInAr STRING NOT NULL, titleInEn STRING NOT NULL, desInAr TEXT NOT NULL, desInEn TEXT NOT NULL, imagePath TEXT)");
    //        "CREATE TABLE $tableName (id integer primary key autoincrement,titleInAr varchar(50),titleInEn varchar(50),desInAr varchar(50),desInEn varchar(50))");
    log('Table Created Done Success');
  }

  static onUpgrade(Database db, int oldVersion, int newVersion) {
    log('Data Updated Done');
  }

  static Future<int> createSection(Map<String, Object?> values) async {
    return await _database!.insert(_tableName, values);
  }

  static Future<List> allSection() async {
    return await _database!.query(_tableName);
  }

  static Future<int> deleteSection(int id) async {
    return await _database!
        .delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateSection(Map<String, Object?> values, String myWhere,
      List<Object?>? whereArgs) async {
    return await _database!
        .update(_tableName, values, where: myWhere, whereArgs: whereArgs);
  }
}
