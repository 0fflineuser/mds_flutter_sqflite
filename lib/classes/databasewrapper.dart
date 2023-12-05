import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseWrapper {
  static DatabaseWrapper? _instance;
  final Database _database;
  DatabaseWrapper._(Database database) : _database = database;

  Database get database => _database;

  static Future<DatabaseWrapper> getInstance() async {
    if (_instance == null) {
      final database = await _initDatabase();
      _instance = DatabaseWrapper._(database);
    }
    return _instance!;
  }

  static void _populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE IF NOT EXISTS TODO ("
        "todo_id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "todo_title TEXT NOT NULL, "
        "todo_content TEXT NOT NULL "
        ")");
  }

  static Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');
    return await openDatabase(dbPath, version: 1, onCreate: _populateDb);
  }
}
