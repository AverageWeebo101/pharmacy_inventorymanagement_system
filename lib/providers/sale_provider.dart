import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/sale.dart';
import 'package:flutter/material.dart';

class SaleProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertSale(Sale sale) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('Sale', sale.toMap());
  }

  Future<int> updateSale(Sale sale) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'Sale',
      sale.toMap(),
      where: 'orderId = ?',
      whereArgs: [sale.saleId],
    );
  }

  Future<int> deleteSale(Sale saleId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'Sale',
      where: 'saleId = ?',
      whereArgs: [saleId],
    );
  }

  Future<List<Sale>> getAllSale() async {
    final db = await dbProvider.database;
    final res = await db.query('Sale');
    return res.map((e) => Sale.fromMap(e)).toList();
  }
}
