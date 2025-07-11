import 'package:flutter/material.dart';
import 'package:rinavent/core/domain/entities/user.dart';

class AppUserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void updateUser(User user) {
    _user = user;
    notifyListeners(); // Notifie les widgets dépendants
  }
}
