import 'package:derma_scan/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'tableHasil';
  final String columnId = 'id';
  final String columnImage = 'image';
  final String cloumnOutput = 'output';
  final String columnConfidenceFix = 'confidenceFix';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'hasil.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnImage TEXT,"
        "$cloumnOutput TEXT,"
        "$columnConfidenceFix TEXT";
    await db.execute(sql);
  }

  Future<int?> saveHasil(Hasil hasil) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, hasil.toMap());
  }

  Future<List?> getAllHasil() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName,
        columns: [columnId, columnImage, cloumnOutput, columnConfidenceFix]);

    return result.toList();
  }

  // Future<int?> updateHasil(Hasil hasil) async {
  //   var dbClient = await _db;
  //   return await dbClient!.update(tableName, hasil.toMap(),
  //       where: '$columnId = ?', whereArgs: [hasil.id]);
  // }

  Future<int?> deleteHasil(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

}
