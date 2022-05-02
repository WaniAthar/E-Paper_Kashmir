// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  ThemeMode theme_Mode() => themeMode;

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  themeOf(BuildContext context) {}
}
