import 'dart:io';
import 'package:path/path.dart';
import 'package:ra_app_m_vil/models/user.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'NoteDB.db');

    return await openDatabase(path, version: 4, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Users(
          email TEXT PRIMARY KEY,
          pass TEXT,
          fullName TEXT
        )

      ''');
    }, );
  }

  Future<int?> addUser(User user) async {
    final email = user.email;
    final fullName = user.fullName;
    final password = user.password;
    final db = await database;

    final res = await db?.rawInsert('''
    INSERT INTO Users(email, pass, fullName)
    VALUES('$email', '$password', '$fullName')
    ''');
    return res;
  }

  Future<User?> getUser(String email) async {
    final db = await database;
    final res =
        await db?.query('Users', where: 'email = ?', whereArgs: [email]);

    return res!.isNotEmpty
        ? User(
            email: res.first['email'].toString(),
            fullName: res.first['fullName'].toString(),
            password: res.first['pass'].toString())
        : null;
  }

  
}
