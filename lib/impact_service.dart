import 'package:flutter/material.dart';

class ImpactService extends ChangeNotifier {
  double _kgsPrevented = 21.5;

  double get kgsPrevented => _kgsPrevented;

  // Simulate adding a random weight between 1.0 and 5.0 kgs
  void recordPurchase() {
    _kgsPrevented += (1.0 + (double.parse((_kgsPrevented * 0.1).toStringAsFixed(2)) % 4.0));
    notifyListeners();
  }
}