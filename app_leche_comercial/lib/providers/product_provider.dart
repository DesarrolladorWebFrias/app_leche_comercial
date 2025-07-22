import 'package:flutter/foundation.dart';
import '../models/product_model.dart';
import '../database_helper.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Product> get products => _products;

  ProductProvider() {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final productMaps = await _dbHelper.getProducts();
    _products = productMaps.map((map) => Product.fromMap(map)).toList();
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    await _dbHelper.insertProduct(product.toMap());
    await _loadProducts(); // Recargar para obtener el ID asignado por la BD
  }

  Future<void> updateProduct(Product product) async {
    await _dbHelper.updateProduct(product.toMap());
    await _loadProducts();
  }

  Future<void> deleteProduct(int id) async {
    await _dbHelper.deleteProduct(id);
    await _loadProducts();
  }
}