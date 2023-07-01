import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection{
  String tableName = 'profileDB';

  setDatabase() async{
    var directory = await getDatabasesPath();
    var path = join(directory, 'db_profile');
    var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async{
    print('set database');
    await database.execute('CREATE TABLE $tableName(id INTEGER PRIMARY KEY,'
        'firstname Text,'
        'lastname Text,'
        'nickname Text,'
        'age Text,'
        'hometown Text,'
        'image Text)');
  }
}
