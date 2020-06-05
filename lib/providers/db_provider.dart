import 'dart:async';

import 'package:nosework/providers/db_mock_data.dart';
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
      "CREATE TABLE ${DBConstants.MOMENT_TABLE} ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "name TEXT,"
      "type TEXT,"
      "maxTime INTEGER,"
      "contestId INTEGER)"
    );

    await db.execute(
      "CREATE TABLE ${DBConstants.PARTICIPANT_TABLE} ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "name TEXT,"
      "dog TEXT)"
    );

    await db.execute(
      "CREATE TABLE ${DBConstants.PROTOCOL_TABLE} ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "momentId INTEGER,"
      "participantId INTEGER,"
      "sse BOOLEAN,"
      "points INTEGER,"
      "errors INTEGER,"
      "time INTEGER,"
      "comment TEXT)"
    );

    await db.execute(
      "INSERT INTO ${DBConstants.TOURNAMENT_TABLE}(name) VALUES ('Sommarsniffen')"
    );

    await db.execute(
      "INSERT INTO ${DBConstants.CONTEST_TABLE}(name, tournamentId) VALUES ('Behållare', 1)"
    );

    await db.execute(
      "INSERT INTO ${DBConstants.MOMENT_TABLE}(name, type, maxTime, contestId) VALUES ('Sök1', 'CONTAINER', 90000, 1)"
    );

    await db.execute(
      "INSERT INTO ${DBConstants.MOMENT_TABLE}(name, type, maxTime, contestId) VALUES ('Sök2', 'CONTAINER', 120000, 1)"
    );

    await db.execute(
      "INSERT INTO ${DBConstants.MOMENT_TABLE}(name, type, maxTime, contestId) VALUES ('Sök3', 'CONTAINER', 60000, 1)"
    );

    DBMockData().participants().forEach((element) async {
      await db.execute(element);
    });

    DBMockData().protocols(1).forEach((element) async {
      await db.execute(element);
    });

    DBMockData().protocols(2).forEach((element) async {
      await db.execute(element);
    });
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