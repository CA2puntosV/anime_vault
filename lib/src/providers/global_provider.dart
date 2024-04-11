import 'package:anime_vault/ui/shared/nav_bar_options.dart';
import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  String selected = NavBarOptions.home['name']!;

  void setSelected(String newValue) {
    selected = newValue;

    notifyListeners();
  }
}
