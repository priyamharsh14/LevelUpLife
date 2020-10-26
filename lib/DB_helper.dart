import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final _dbName = "LevelUpLife.db";
  static final _dbVer = 1;

  // make this a singleton class
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), _dbName),
        version: _dbVer, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE userinfo (
      id INTEGER PRIMARY KEY, firstname TEXT NOT NULL,
      lastname TEXT NOT NULL, age INTEGER NOT NULL,
      gender TEXT NOT NULL
      )''');
  }

  // Helper Functions
  Future<int> getUserCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM userinfo'));
  }

  Future<Map<String, dynamic>> getUserInfo() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> rows = await db.query("userinfo");
    return rows[0];
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(
      "userinfo",
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.update(
      "userinfo",
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }
}
