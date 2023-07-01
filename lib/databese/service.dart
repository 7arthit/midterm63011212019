
import 'package:midterm63011212019/databese/connection.dart';
import 'package:sqflite/sqflite.dart';

class DBService{
  late DatabaseConnection _databaseConnection;
  String tableName = 'profileDB';

  DBService(){
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  get profileId => null;

  readData() async{
    var connection = await database;
    return await connection?.query(tableName);
  }

  insertData(data) async{
    var connection = await database;
    return await connection?.insert(tableName, data);
  }

  readDataById(itemId) async {
    var connection = await database;
    return await connection?.query(tableName,
        where: 'id=?', whereArgs: [itemId]
    );
  }

  updataData(profile, id) async {
    print('Update');
    var connection = await database;
    return await connection?.update(tableName, profile,
        where: 'id=?', whereArgs: [id]
    );
  }

  deleteData(profileId) async{
    var connection = await database;
    return await connection?.delete(tableName,
        where: 'id=?', whereArgs: [profileId]);
  }
}