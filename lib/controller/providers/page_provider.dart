import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier {
  int _pageIndex = 0;

  set pageIndex( int newPageIndex) {
    _pageIndex = newPageIndex;
    notifyListeners();
  }

 int  get pageIndex => _pageIndex;
}
