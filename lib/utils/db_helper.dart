import 'dart:async';
import 'dart:io';
import 'package:hello_flutter/models/doto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  // Make the class Singleton
  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper() {
    return _dbHelper;
  }

  final String _dbName = "todos.db";

  String tableTodo = "todo";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    // Get the directory where the DB is stored on the mobile
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + _dbName;

    // Open the Database
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  void _createDb(Database db, int version) async {
    await db.execute("CREATE TABLE $tableTodo(" +
        "$colId INTEGER PRIMARY KEY, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)");
  }

  // *** SQL Commands ***

  // Returns the ID
  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    
    var result = await db.insert(tableTodo, todo.toMap());
    return result;
  }

  Future<List> getTodos() async {
    Database db = await this.db;
    return await db.rawQuery("SELECT * FROM $tableTodo ORDER BY $colPriority ASC");
  }

  Future<int> getCount() async {
    Database db = await this.db;
    return Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT (*) FROM $tableTodo"));
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    return await db.update(tableTodo, todo.toMap(), where: "$colId = ?", whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    return await db.rawDelete("DELETE FROM $tableTodo WHERE $colId = $id");
  }

  Future<int> deleteAll() async {
    Database db = await this.db;
    return await db.rawDelete("DELETE FROM $tableTodo");
  }



}
