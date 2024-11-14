import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/manufacturer.dart';
import 'package:flutter/material.dart';

class ManufacturerProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertManufacturer(Manufacturer manufacturer) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('Manufacturer', manufacturer.toMap());
  }

  Future<int> updateManufacturer(Manufacturer manufacturer) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'Manufacturer',
      manufacturer.toMap(),
      where: 'manufacturerId = ?',
      whereArgs: [manufacturer.manufacturerId],
    );
  }

  Future<int> deleteManufacturer(String manufacturerId) async {
    final db = await dbProvider.database;
    notifyListeners();

    return await db.delete(
      'Manufacturer',
      where: 'manufacturerId = ?',
      whereArgs: [manufacturerId],
    );
  }

  Future<List<Manufacturer>> getAllManufacturers() async {
    final db = await dbProvider.database;
    final res = await db.query('Manufacturer');
    return res.map((e) => Manufacturer.fromMap(e)).toList();
  }
}
