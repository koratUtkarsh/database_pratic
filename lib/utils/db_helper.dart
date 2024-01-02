import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final helper = DbHelper._();

  DbHelper._();

  Database? database;

  // ---------- CheckDb ---------- //

  Future<Database> checkDb() async {
    if (database != null) {
      return database!;
    } else {
      return await initDb();
    }
  }

  // ---------- initDb ---------- //

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "my.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE incomeexpense(id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,amount TEXT,notes TEXT,date TEXT,time TEXT,paytypes TEXT,status TEXT)";
        db.execute(query);
      },
    );
  }

  // ---------- insertDb ---------- //

  Future<void> insertDb(
      {required category,
      required amount,
      required notes,
      required date,
      required time,
      required paytypes,
      required status}) async {
    database = await checkDb();
    database!.insert(
      "incomeexpense",
      {
        "category": category,
        "amount": amount,
        "notes": notes,
        "date": date,
        "time": time,
        "paytypes": paytypes,
        "status": status,
      },
    );
  }

  // ---------- readDb ---------- //

  Future<List<Map>> readDb() async {
    database = await checkDb();
    String query = "SELECT * FROM incomeexpense";
    List<Map> list = await database!.rawQuery(query);
    return list;
  }

  // ---------- deleteDb ---------- //

  Future<void> deleteDb({required id}) async {
    database = await checkDb();
    database!.delete("incomeexpense", where: "id=?", whereArgs: [id]);
  }

  // ---------- updateDb ---------- //

  Future<void> updateDb(
      {required id,
      required category,
      required amount,
      required notes,
      required date,
      required time,
      required paytypes,
      required status}) async {
    database = await checkDb();
    database!.update(
      "incomeexpense",
      {
        "category": category,
        "amount": amount,
        "notes": notes,
        "date": date,
        "time": time,
        "paytypes": paytypes,
        "status": status,
      },
      where: "id=?",
      whereArgs: [id],
    );
  }
}
