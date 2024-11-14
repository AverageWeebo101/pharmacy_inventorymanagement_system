import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertOrder(Order order) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('Order', order.toMap());
  }

  Future<int> updateOrder(Order order) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'Order',
      order.toMap(),
      where: 'orderId = ?',
      whereArgs: [order.orderId],
    );
  }

  Future<int> deleteOrder(Order orderId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'Order',
      where: 'orderId = ?',
      whereArgs: [orderId],
    );
  }

  Future<List<Order>> getAllOrder() async {
    final db = await dbProvider.database;
    final res = await db.query('Order');
    return res.map((e) => Order.fromMap(e)).toList();
  }
}
