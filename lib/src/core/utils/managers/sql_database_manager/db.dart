import 'dart:async';

import 'package:aljomaih_assessment/src/core/common/data/models/order_model/order_model.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../../../../features/orders_list/data/models/orders_response_model.dart';

abstract class DB {
  static  Database? _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      var databasesPath = await getDatabasesPath();
      String _path = p.join(databasesPath, 'crud.db');
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE orders ('
        'orderId INTEGER PRIMARY KEY AUTOINCREMENT, '
        'id TEXT ,'
        'amount TEXT ,date TEXT , UNIQUE(id, date))');


  }

  static Future<int> insertOrder({required OrdersResponseModel order}) async {
    String query =
        "INSERT OR IGNORE INTO orders (amount , date , id ) VALUES('${order.ammount}' , '${order.date}' , '${order.id}')";
    await _db?.rawInsert(query);
    return await _db!.rawInsert(query);
  }


  static getAllOrders() async {

    String query = "SELECT * FROM orders";

    List<Map> result = await _db!.rawQuery(query);

    return result;
  }

}
