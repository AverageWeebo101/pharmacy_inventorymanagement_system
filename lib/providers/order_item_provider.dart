import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/order_item.dart';
import 'package:flutter/material.dart';

class OrderItemProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertOrderItem(OrderItem orderitem) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('OrderItem', orderitem.toMap());
  }

  Future<int> updateOrderItem(OrderItem orderitem) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'OrderItem',
      orderitem.toMap(),
      where: 'orderItemId = ?',
      whereArgs: [orderitem.orderItemId],
    );
  }

  Future<int> deleteOrderItem(OrderItem orderItemId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'OrderItem',
      where: 'orderItemId = ?',
      whereArgs: [orderItemId],
    );
  }

  Future<List<OrderItem>> getAllOrderItem() async {
    final db = await dbProvider.database;
    final res = await db.query('OrderItem');
    return res.map((e) => OrderItem.fromMap(e)).toList();
  }
}
