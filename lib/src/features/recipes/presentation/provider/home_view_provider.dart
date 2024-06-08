import 'package:flutter/material.dart';

class HomeViewProvider extends ChangeNotifier {
  List<String> items = [];

  void addItem(String item) {
    if (!items.contains(item)) {
      items.add(item);
    }
    notifyListeners();
  }

  void removeItem(String item) {
    items.remove(item);
    notifyListeners();
  }
}
