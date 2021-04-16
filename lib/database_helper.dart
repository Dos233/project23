import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:project2ems_app/find.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String dbName = "findDB.db";
  final String tableFind = "findTable";
  final String columnid = "id";
  final String columnjobname = "jobname";
  final String columnjobdes = "jobdes";
  final String columnwagesperhour = "wagesperhour";
  final String columndate = "date";
  final String columnduration = "duration";
  final String columnworkhour = "workhour";
  final String columnnumberofworkers = "numberofworkers";
  final String columnworkername = "workername";
  final String columnworkerphone = "workerphone";
  final String columnapplyjob = "applyjob";

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute("create table $tableFind("
        "$columnid integer primary key autoincrement, "
        "$columnjobname text, "
        "$columnjobdes text, "
        "$columnwagesperhour text, "
        "$columndate text, "
        "$columnduration text, "
        "$columnworkhour text, "
        "$columnnumberofworkers text, "
        "$columnworkername text, "
        "$columnworkerphone text, "
        "$columnapplyjob text"
        ")");
  }

  Future<int> create(Find find) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableFind, find.toJson());
    return result;
  }

  Future<List> findAll() async {
    var dbClient = await db;
    var result = await dbClient.query(tableFind, columns: [
      columnid,
      columnjobname,
      columnjobdes,
      columnwagesperhour,
      columndate,
      columnduration,
      columnworkhour,
      columnnumberofworkers,
      columnworkername,
      columnworkerphone,
      columnapplyjob,
    ]);
    return result.toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableFind, where: '$columnid =?', whereArgs: [id]);
  }

  Future<int> update(Find find) async {
    var dbClient = await db;
    var result = await dbClient.update(tableFind, find.toJson(),
        where: "$columnid = ?", whereArgs: [find.id]);
    return result;
  }
}
