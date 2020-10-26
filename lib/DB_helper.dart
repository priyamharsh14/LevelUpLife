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
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), _dbName),
        version: _dbVer, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    // USER INFO TABLE
    await db.execute('''CREATE TABLE userinfo (
      id INTEGER PRIMARY KEY, fullname TEXT NOT NULL, age INTEGER NOT NULL,
      gender TEXT NOT NULL
      )''');
    // SKILL INFO TABLE
    await db.execute('''CREATE TABLE userskills (
      id INTEGER PRIMARY KEY, skillname TEXT NOT NULL,
      level INTEGER NOT NULL, xp INTEGER NOT NULL
      )''');
  }

  // All Helper Functions
  Future<int> getRowCount(String table) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<Map<String, dynamic>> getUserInfo() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> rows = await db.query("userinfo");
    if (rows.length > 0) {
      return rows[0];
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> addXP(int skillId, int xp) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> rows =
        await db.rawQuery("SELECT * FROM userskills WHERE id=$skillId");
    if (rows.length > 0) {
      rows[0]['xp'] += xp;
      // 50 * [(level+1) ^ 2] --> LEVELLING SYSTEM
      while (rows[0]['xp'] >
          50 * (rows[0]['level'] + 1) * (rows[0]['level'] + 1)) {
        rows[0]['level'] += 1;
      }
      return await db.update(
        "userskills",
        rows[0],
        where: 'id = ?',
        whereArgs: [skillId],
      );
    } else {
      return -1;
    }
  }

  Future<int> addSkill(String skillname) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> rows = await db
        .rawQuery("SELECT * FROM userskills WHERE skillname='$skillname'");
    if (rows.length > 0) {
      return -1;
    }
    Map<String, dynamic> row = {
      'id': await getRowCount("userskills") + 1,
      'skillname': skillname,
      'level': 0,
      'xp': 0
    };
    return await db.insert(
      "userskills",
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> insertRow(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(
      table,
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
