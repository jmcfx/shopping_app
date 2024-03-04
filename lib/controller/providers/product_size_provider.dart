import 'package:flutter/material.dart';

class ProductSizeNotifier extends ChangeNotifier {
  int _selectedSize = 0;

  set selectedSize(int newSelectedSize) {
    _selectedSize = newSelectedSize;
    notifyListeners();
  }

  int get selectedSize => _selectedSize;
}
