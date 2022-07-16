import 'package:flutter/material.dart';

class SecondProvider with ChangeNotifier {
  String? name;

  void changeName(String name) {
    this.name = name;
    notifyListeners();
  }

  void resetName() {
    name = null;
  }
}
