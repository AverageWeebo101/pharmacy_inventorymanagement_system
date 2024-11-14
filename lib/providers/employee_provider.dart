import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertEmployee(Employee employee) async {
    notifyListeners();
    final db = await dbProvider.database;
    return await db.insert('Employee', employee.toMap());
  }

  Future<int> updateEmployee(Employee employee) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'Employee',
      employee.toMap(),
      where: 'employeeId = ?',
      whereArgs: [employee.employeeId],
    );
  }

  Future<int> deleteEmployee(String employeeId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'Employee',
      where: 'employeeId = ?',
      whereArgs: [employeeId],
    );
  }

  Future<Employee?> getEmployeeById(String employeeId) async {
    final db = await dbProvider.database;
    final res = await db.query(
      'Employee',
      where: 'employeeId = ?',
      whereArgs: [employeeId],
    );
    return res.isNotEmpty ? Employee.fromMap(res.first) : null;
  }

  Future<List> getAllEmployees() async {
    final db = await dbProvider.database;
    final res = await db.query('Employee');
    return res.map((e) => Employee.fromMap(e)).toList();
  }
}
