import 'db_provider.dart';
import 'package:pharmacy_inventorymanagement_system/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final dbProvider = DBProvider.instance;

  Future<int> insertProduct(Product product) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.insert('Product', product.toMap());
  }

  Future<int> updateProduct(Product product) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.update(
      'Product',
      product.toMap(),
      where: 'productId = ?',
      whereArgs: [product.productId],
    );
  }

  Future<int> deleteProduct(String productId) async {
    final db = await dbProvider.database;
    notifyListeners();
    return await db.delete(
      'Product',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  Future<List<Product>> getAllProducts() async {
    final db = await dbProvider.database;
    final res = await db.query('Product');
    return res.map((e) => Product.fromMap(e)).toList();
  }
}
