import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// The database helper class
class Databasehelper {
  // Database name
  static final _databasename = "passwords.db";
  static final _databaseversion = 1;

  // The table name
  static final table = "my_table";

  // Column name
  static final columnID = 'id';
  static final columnType = "type";
  static final columnUser = "user";
  static final columnPass = 'pass';

  // A database
  static Database _database;

  // Private constructor
  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  // Asking for a database
  Future<Database> get databse async {
    if (_database != null) return _database;

    // Create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  // Function to return a database
  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  // Create a database since it doesn't exist
  Future _onCreate(Database db, int version) async {
    // SQL code
    await db.execute('''
      CREATE TABLE $table (
        $columnID INTEGER PRIMARY KEY
        $columnType TEXT NOT NULL,
        $columnUser TEXT NOT NULL,
        $columnPass TEXT NOT NULL
      )
    ''');
  }

  // Functions to insert data
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.databse;
    return await db.insert(table, row);
  }

  // Function to query all the rows
  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.databse;
    return await db.query(table);
  }

  // Function to query specific
  Future<List<Map<String, dynamic>>> queryspecific(int age) async {
    Database db = await instance.databse;
    var res = await db.rawQuery('SELECT * FROM my_table WHERE age >?', [age]);
    return res;
  }

  // Function to delete some data
  Future<int> deletedata(int id) async {
    Database db = await instance.databse;
    var res = await db.delete(table, where: "id = ?", whereArgs: [id]);
    return res;
  }

  // Function to update some data
  Future<int> update(int id) async {
    Database db = await instance.databse;
    var res = await db.update(
        table, {"name": "Password Manager Demo", "age": 2},
        where: "id = ?", whereArgs: [id]);
    return res;
  }
}
