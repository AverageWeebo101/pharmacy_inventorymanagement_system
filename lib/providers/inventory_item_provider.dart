import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/inventory_item.dart';
import 'package:flutter/material.dart';

class InventoryItemProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertInventoryItem(InventoryItem item) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('InventoryItem', item.toMap());
  }

  Future<int> updateInventoryItem(InventoryItem item) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'InventoryItem',
      item.toMap(),
      where: 'inventoryItemId = ?',
      whereArgs: [item.inventoryItemId],
    );
  }

  Future<int> deleteInventoryItem(String inventoryItemId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'InventoryItem',
      where: 'inventoryItemId = ?',
      whereArgs: [inventoryItemId],
    );
  }

  Future<List<InventoryItem>> getAllInventoryItems() async {
    final db = await dbProvider.database;
    final res = await db.query('InventoryItem');
    return res.map((e) => InventoryItem.fromMap(e)).toList();
  }
}
