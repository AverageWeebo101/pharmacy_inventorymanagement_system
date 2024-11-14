import 'dart:async';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
// ignore: unnecessary_import
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBProvider extends ChangeNotifier {
  static final DBProvider instance = DBProvider._init();
  Database? _database;

  DBProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('pharmacy.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    if (!kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux ||
            defaultTargetPlatform == TargetPlatform.macOS)) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
          CREATE TABLE Supplier (
            supplierId TEXT PRIMARY KEY,
            supplierName TEXT,
            supplierContact TEXT
          )
        ''');

    await db.execute('''
          CREATE TABLE Manufacturer (
            manufacturerId TEXT PRIMARY KEY,
            manufacturerName TEXT,
            manufacturerContact TEXT
          )
        ''');

    await db.execute('''
          CREATE TABLE Product (
            productId TEXT PRIMARY KEY,
            productName TEXT,
            manufacturerId TEXT,
            expirationDate TEXT,
            FOREIGN KEY (manufacturerId) REFERENCES Manufacturer(manufacturerId)
          )
        ''');

    await db.execute('''
          CREATE TABLE Medicine (
            medicineId TEXT PRIMARY KEY,
            medicineName TEXT,
            manufacturerId TEXT,
            expirationDate TEXT,
            FOREIGN KEY (manufacturerId) REFERENCES Manufacturer(manufacturerId)
          )
        ''');

    await db.execute('''
          CREATE TABLE InventoryItem (
            inventoryItemId TEXT PRIMARY KEY,
            inventoryItemName TEXT,
            quantity INTEGER,
            supplierId TEXT,
            medicineId TEXT,
            productId TEXT,
            expirationDate TEXT,
            FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId),
            FOREIGN KEY (medicineId) REFERENCES Medicine(medicineId),
            FOREIGN KEY (productId) REFERENCES Product(productId)
          )
        ''');

    await db.execute('''
          CREATE TABLE OrderItem (
            orderItemId TEXT PRIMARY KEY,
            orderId TEXT,
            inventoryItemId TEXT,
            quantity INTEGER,
            FOREIGN KEY (orderId) REFERENCES Orders(orderId),
            FOREIGN KEY (inventoryItemId) REFERENCES InventoryItem(inventoryItemId)
          )
        ''');

    await db.execute('''
          CREATE TABLE Orders (
            orderId TEXT PRIMARY KEY,
            orderDate TEXT,
            employeeId TEXT,
            FOREIGN KEY (employeeId) REFERENCES Employee(employeeId)
          )
        ''');

    await db.execute('''
          CREATE TABLE Sale (
            saleId TEXT PRIMARY KEY,
            saleDate TEXT,
            employeeId TEXT,
            FOREIGN KEY (employeeId) REFERENCES Employee(employeeId)
          )
        ''');

    await db.execute('''
          CREATE TABLE SaleItem (
            saleItemId TEXT PRIMARY KEY,
            saleId TEXT,
            inventoryItemId TEXT,
            quantity INTEGER,
            FOREIGN KEY (saleId) REFERENCES Sale(saleId),
            FOREIGN KEY (inventoryItemId) REFERENCES InventoryItem(inventoryItemId)
          )
        ''');

    await db.execute('''
          CREATE TABLE Log (
            logId TEXT PRIMARY KEY,
            event TEXT,
            eventDetail TEXT,
            eventDate TEXT,
            employeeId TEXT,
            viewableByAdmin INTEGER,
            viewableByOwner INTEGER,
            FOREIGN KEY (employeeId) REFERENCES Employee(employeeId)
          )
        ''');

    await db.execute('''
          CREATE TABLE Employee (
            employeeId TEXT PRIMARY KEY,
            employeeName TEXT,
            email TEXT,
            role TEXT,
            canViewLogs INTEGER DEFAULT 0,
            canManageInventory INTEGER DEFAULT 0,
            canProcessSales INTEGER DEFAULT 0
          )
        ''');
  }

  Future close() async {
    final db = _database;
    if (db != null) {
      await db.close();
    }
  }
}
