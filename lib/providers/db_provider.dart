import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'db_constants.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider instance = DBProvider._();

  static Database _database;
  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDB();
    }
    return _database;
  }

  _initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, "Nosework.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE ${DBConstants.TOURNAMENT_TABLE} ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT)"
    );

    await db.execute(
        "CREATE TABLE ${DBConstants.CONTEST_TABLE} ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT,"
        "tournamentId INTEGER)"
    );

    await db.execute(
      "INSERT INTO ${DBConstants.TOURNAMENT_TABLE}(name) VALUES ('Sommarsniffen 2020')"
    );

    await db.execute(
      "INSERT INTO ${DBConstants.CONTEST_TABLE}(name, tournamentId) VALUES ('Gullstensön', 1)"
    );
  }

  Future<List<Map<String, dynamic>>> getAll(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> getAllWhere(String table, Map<String, dynamic> whereMap) async {
    final db = await database;

    String whereStr = '';
    List<dynamic> whereArgs = [];
    whereMap.forEach((col, value) {
      whereStr += col + ' = ? AND';
      whereArgs.add(value);
    });
    whereStr = whereStr.substring(0, whereStr.length - 3); // Remove last AND
    return db.query(table, where: whereStr, whereArgs: whereArgs);
  }
}