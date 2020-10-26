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
    // await db.execute();
  }
}
