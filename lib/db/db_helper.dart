import 'package:derma_scan/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  Database? _database;

  String tableName = 'tableHasil';
  String columnId = 'id';
  String columnImage = 'image';
  String cloumnOutput = 'output';
  String columnConfidenceFix = 'confidenceFix';

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
    var sql =
        'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnImage TEXT, $cloumnOutput TEXT, $columnConfidenceFix TEXT)';
    await db.execute(sql);
  }

  Future<int?> saveHasil(Hasil hasil) async {
    var dbClient = await _db;
    var query = await dbClient!.insert(tableName, hasil.toMap());
    print('saveHasil: hasil id: ${hasil.id}');
    print('saveHasil: hasil image: ${hasil.image}');
    print('saveHasil: hasil output: ${hasil.output}');
    print('saveHasil: hasil id: ${hasil.confidenceFix}');
    return query;
  }

  Future<List?> getAllHasil() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName,
        columns: [columnId, columnImage, cloumnOutput, columnConfidenceFix]);
    // List<Hasil> photos = [];
    // if (result.isNotEmpty) {
    //   for (int i = 0; i < result.length; i++) {
    //     photos.add(Hasil.fromMap(Map<String, dynamic>.from(result[i])));
    //   }
    // }

    return result.toList();
  }

  Future<int?> deleteHasil(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
