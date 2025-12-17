import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  bool _isBalanceVisible = false;
  String _balance = '10,000'; // Initialize balance with a default value

  bool get isBalanceVisible => _isBalanceVisible;
  String get balance => _balance;

  void toggleBalanceVisibility() {
    _isBalanceVisible = !_isBalanceVisible;
    notifyListeners();
  }
}



class SliderProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
