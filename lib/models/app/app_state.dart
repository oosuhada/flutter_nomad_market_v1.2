import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _currentRoute = '/';

  bool get isLoggedIn => _isLoggedIn;
  String get currentRoute => _currentRoute;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void setCurrentRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }
}
