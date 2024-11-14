import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/log.dart';
import 'package:flutter/material.dart';

class LogProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertLog(Log log) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('Log', log.toMap());
  }

  Future<List<Log>> getLogs(
      {bool? viewableByAdmin, bool? viewableByOwner}) async {
    final db = await dbProvider.database;
    notifyListeners();
    final whereClauses = <String>[];
    final whereArgs = <dynamic>[];

    if (viewableByAdmin != null) {
      whereClauses.add('viewableByAdmin = ?');
      whereArgs.add(viewableByAdmin ? 1 : 0);
    }
    if (viewableByOwner != null) {
      whereClauses.add('viewableByOwner = ?');
      whereArgs.add(viewableByOwner ? 1 : 0);
    }

    final res = await db.query(
      'Log',
      where: whereClauses.isEmpty ? null : whereClauses.join(' AND '),
      whereArgs: whereArgs.isEmpty ? null : whereArgs,
    );

    return res.map((e) => Log.fromMap(e)).toList();
  }
}
