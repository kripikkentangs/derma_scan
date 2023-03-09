import 'package:derma_scan/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  Database? _database;

  String tableName = 'tableHasil';
  String columnId = 'id';
  String columnImage = 'image';
  // String columnOutput = 'output';
  // String columnConfidenceFix = 'confidenceFix';

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
    print('DATABASE PATH: $databasePath');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql =
        'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnImage TEXT)';
    await db.execute(sql);
  }

  Future<int?> saveHasil(Hasil hasil) async {
    var dbClient = await _db;
    hasil.id = await dbClient!.insert(tableName, hasil.toMap());
    print('saveHasil: hasil id: ${hasil.id}');
    print('saveHasil: hasil image: ${hasil.image}');
    // print('saveHasil: hasil output: ${hasil.output}');
    // print('saveHasil: hasil id: ${hasil.confidenceFix}');
    return hasil.id;
  }

  Future<List?> getAllHasil() async {
    var dbClient = await _db;
    List<Map> maps =
        await dbClient!.query(tableName, columns: [columnId, columnImage]);
    List<Hasil> photos = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        photos.add(Hasil.fromMap(Map<String, dynamic>.from(maps[i])));
      }
    }

    return maps.toList();
  }

  Future<int?> deleteHasil(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
