import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  String _userName = "John Doe";
  String _userBio = "Eco Warrior | Giving old tech a new purpose.";

  String get userName => _userName;
  String get userBio => _userBio;

  void updateUser(String newName, String newBio) {
    _userName = newName;
    _userBio = newBio;
    notifyListeners();
  }
}
