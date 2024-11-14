import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/supplier.dart';
import 'package:flutter/material.dart';

class SupplierProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertSupplier(Supplier supplier) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('Supplier', supplier.toMap());
  }

  Future<int> updateSupplier(Supplier supplier) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'Supplier',
      supplier.toMap(),
      where: 'supplierId = ?',
      whereArgs: [supplier.supplierId],
    );
  }

  Future<int> deleteSupplier(String supplierId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'Supplier',
      where: 'supplierId = ?',
      whereArgs: [supplierId],
    );
  }

  Future<List<Supplier>> getAllSuppliers() async {
    final db = await dbProvider.database;
    final res = await db.query('Supplier');
    return res.map((e) => Supplier.fromMap(e)).toList();
  }
}
