import 'package:flutter/material.dart';

import 'package:anime_vault/ui/router/router_path.dart';

class GlobalProvider extends ChangeNotifier {
  String selected = RouterPath.home;

  void setSelected(String newValue) {
    selected = newValue;
  }
}
