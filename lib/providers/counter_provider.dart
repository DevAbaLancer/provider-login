import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;
  String _dropdownValue = 'India';
  String get dropdownValue => _dropdownValue;

  void incrementCounter() {
    if (_count != 3) {
      _count++;
    }
    notifyListeners();
  }

  void getValueForDropdown(String newValue) {
    _dropdownValue = newValue;

    notifyListeners();
  }

  void deacrementCounter() {
    if (_count != 0) {
      _count--;
    }

    notifyListeners();
  }
}
