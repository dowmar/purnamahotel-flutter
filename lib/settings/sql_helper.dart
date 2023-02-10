import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE kamar(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      kamarName TEXT,
      kamarImg TEXT,
      kamarHarga TEXT,
      kamarType TEXT,
      kamarDeskripsi TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('dbpurnama.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      print("creating table");
      await createTables(database);
    });
  }

  static Future<int> createItem(String kamarName, String? kamarImg,
      String kamarHarga, String kamarType, String? kamarDeskripsi) async {
    final db = await SQLHelper.db();
    final data = {
      'kamarName': kamarName,
      'kamarImg': kamarImg,
      'kamarHarga': kamarHarga,
      'kamarType': kamarType,
      'kamarDeskripsi': kamarDeskripsi
    };
    final id = await db.insert('kamar', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('kamar', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('kamar', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String kamarName, String? kamarImg,
      String kamarHarga, String kamarType, String? kamarDeskripsi) async {
    final db = await SQLHelper.db();
    final data = {
      'kamarName': kamarName,
      'kamarImg': kamarImg,
      'kamarHarga': kamarHarga,
      'kamarType': kamarType,
      'kamarDeskripsi': kamarDeskripsi,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('kamar', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("kamar", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("SOMETHING WENT WRONG $err");
    }
  }
}
