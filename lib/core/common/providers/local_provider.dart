import 'package:flutter/material.dart';
import 'package:rinavent/core/l10n/l10n.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('fr'); // Langue par défaut

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return; 
    _locale = locale;
    notifyListeners(); 
  }

  void clearLocale() {
    _locale = const Locale('fr');
    notifyListeners();
  }
}
