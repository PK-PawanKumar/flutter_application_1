import 'dart:io';
import 'package:flutter_application/helperpages/TaskStatus.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final _databasename = "todo.db";
  static final _databaseversion = 1;
  static final table = "my_table";
  static final columnID = 'id';
  static final columnName = "todo";
  static final columnDate = "todo";
  static final columnDes = "todo";
  static Database? _database;

  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  Future<Database> get databse async {
    if (_database != null) return _database ??= await _initDatabase();

    _database = await _initDatabase();
    return _database ??= await _initDatabase();
  }

  _initDatabase() async {
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = join(documentdirecoty.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnID INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
      
      );
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.databse;
    return await db.insert(table, row);
  }

  // function to query all the rows
  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.databse;
    return await db.query(table);
  }

  Future<int> deletedata(int id) async {
    Database db = await instance.databse;
    var res = await db.delete(table, where: "id = ?", whereArgs: [id]);
    return res;
  }
  // Future<int> CheckStatus(int id) async {
  //   Database db = await instance.databse;
  //   var res = await db.delete(table, where: "id = ?", whereArgs: [id]);
  //   return res;
  // }
}
