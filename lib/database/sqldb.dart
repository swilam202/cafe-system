import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLDB {
  static Database? _db;

  Future<Database> get db async {
    if (_db == null)
      return _db = await initDatabase();
    else
      return _db!;
  }

  initDatabase() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'cafe.db');

    Database myDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "users"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    username TEXT,
    password TEXT,
    permissions INTEGER)
    ''');
    print('database created+++++++++++++++++++++++++++');
  }

  queryData(String tableName) async {
    List response = await _db!.query(tableName);
    return response;
  }

  insertData(String tableName, Map<String, Object> map) async {
    int response = await _db!.insert(tableName, map);
    return response;
  }

  deleteData(String tableName, int id) async {
    int response = await _db!.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return response;
  }

  updateData(String tableName, Map<String, Object> map, int id) async {
    int response =
        await _db!.update(tableName, map, where: 'id = ?', whereArgs: [id]);
    return response;
  }

  deletedatabase() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'cafe.db');
    deleteDatabase(path);
    print('database deleted-------------------------');
  }
}
