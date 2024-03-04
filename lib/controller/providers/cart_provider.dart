import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

// Add Product.......
  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

// remove Product.....
  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
