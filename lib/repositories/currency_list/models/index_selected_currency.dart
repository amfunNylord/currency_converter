import 'package:flutter/material.dart';

class IndexOfSelectedCurrency extends ChangeNotifier {
  int index = 0;

  void updateIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
