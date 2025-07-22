import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class SaleFormProvider with ChangeNotifier {
  Product? _selectedProduct;
  int _quantity = 1;
  double _totalPrice = 0.0;

  Product? get selectedProduct => _selectedProduct;
  int get quantity => _quantity;
  double get totalPrice => _totalPrice;

  void selectProduct(Product product) {
    _selectedProduct = product;
    _updateTotalPrice();
    notifyListeners();
  }

  void setQuantity(int quantity) {
    _quantity = quantity;
    _updateTotalPrice();
    notifyListeners();
  }

  void _updateTotalPrice() {
    if (_selectedProduct != null) {
      _totalPrice = _selectedProduct!.precioVenta * _quantity;
    } else {
      _totalPrice = 0.0;
    }
  }

  void reset() {
    _selectedProduct = null;
    _quantity = 1;
    _totalPrice = 0.0;
    notifyListeners();
  }
}
