import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

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

  static Future<void> insertData() async {
    final db = await SQLHelper.db();
    List<Map<String, dynamic>> data = [
      {
        'kamarName': "Standard Single",
        'kamarImg':
            "https://purnamabaligehotel.com/wp-content/uploads/2023/02/STANDAR-SINGLE-ROOM-1-1024x461.jpg",
        'kamarHarga': "Rp. 450.000 / Malam",
        'kamarType': "Standard Room",
        'kamarDeskripsi': "16 m2 , Kapasitas 1 Orang"
      },
      {
        'kamarName': "Standard Twin",
        'kamarImg':
            "https://purnamabaligehotel.com/wp-content/uploads/2023/02/Standard-double2-1024x819.png",
        'kamarHarga': "Rp. 500.000 / Malam",
        'kamarType': "Standard Room",
        'kamarDeskripsi': "16 m2 , Kapasitas 1 Orang"
      },
      {
        'kamarName': "Deluxe Room",
        'kamarImg':
            "https://purnamabaligehotel.com/wp-content/uploads/2023/02/1660638916746-1-1024x576.jpg",
        'kamarHarga': "Rp. 600.000 / Malam",
        'kamarType': "Deluxe Room",
        'kamarDeskripsi': "20 m2, Kapasitas 2 Orang"
      },
      {
        'kamarName': "VIP Standard",
        'kamarImg':
            "https://purnamabaligehotel.com/wp-content/uploads/2023/02/VIP-with-View4-1024x768.png",
        'kamarHarga':
            "Rp 1.300.000 / malam (Jumat - Minggu) / (Peak Season)\n Rp. 1.000.000 / malam (Senin - Kamis)",
        'kamarType': "VIP Room",
        'kamarDeskripsi': "24 m2, Kapasitas 2 Orang\n Tidak Ada Lake View"
      },
      {
        'kamarName': "VIP Luxury",
        'kamarImg':
            "https://purnamabaligehotel.com/wp-content/uploads/2023/02/VIP-with-View2-1024x819.png",
        'kamarHarga':
            "Rp 1.500.000 / malam (Jumat - Minggu) / (Peak Season)\n Rp. 1.300.000 / malam (Senin - Kamis)",
        'kamarType': "VIP Room",
        'kamarDeskripsi': "24 m2, Kapasitas 2 Orang\n Tidak Ada Lake View"
      }
    ];

    sql.Batch batch = db.batch();
    data.forEach((element) {
      batch.insert('kamar', element);
    });
    await batch.commit();
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
