import 'package:flutter/material.dart';

class NewComeetiProvider with ChangeNotifier {
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  bool get isButtonEnabled => _selectedIndex != null;

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
