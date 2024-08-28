import 'package:ecommerce/themes/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themedata => _themeData;

  set themedata(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themedata = darkmode;
    } else {
      themedata = lightmode;
    }
  }
}
