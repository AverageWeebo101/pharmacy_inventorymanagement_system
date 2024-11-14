import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/sale_item.dart';
import 'package:flutter/material.dart';

class SaleItemProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertSaleItem(SaleItem saleitem) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('SaleItem', saleitem.toMap());
  }

  Future<int> updateSaleItem(SaleItem saleitem) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'SaleItem',
      saleitem.toMap(),
      where: 'saleItemId = ?',
      whereArgs: [saleitem.saleItemId],
    );
  }

  Future<int> deleteSaleItem(SaleItem saleItemId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'SaleItem',
      where: 'saleItemId = ?',
      whereArgs: [saleItemId],
    );
  }

  Future<List<SaleItem>> getAllSaleItem() async {
    final db = await dbProvider.database;
    final res = await db.query('SaleItem');
    return res.map((e) => SaleItem.fromMap(e)).toList();
  }
}
