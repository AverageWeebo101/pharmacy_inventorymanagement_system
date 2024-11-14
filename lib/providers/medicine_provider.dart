import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/medicine.dart';
import 'package:flutter/material.dart';

class MedicineProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertMedicine(Medicine medicine) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('Medicine', medicine.toMap());
  }

  Future<int> updateMedicine(Medicine medicine) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'Medicine',
      medicine.toMap(),
      where: 'medicineId = ?',
      whereArgs: [medicine.medicineId],
    );
  }

  Future<int> deleteMedicine(String medicineId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'Medicine',
      where: 'medicineId = ?',
      whereArgs: [medicineId],
    );
  }

  Future<List<Medicine>> getAllMedicines() async {
    final db = await dbProvider.database;
    final res = await db.query('Medicine');
    return res.map((e) => Medicine.fromMap(e)).toList();
  }
}
