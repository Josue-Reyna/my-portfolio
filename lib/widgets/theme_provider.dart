import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool home = true;
  int page = 0;
  bool language = true;

  bool get isLightMode => themeMode == ThemeMode.light;
  String get whatLanguage => language ? 'es' : 'en';

  Color get color => themeMode == ThemeMode.light ? white : black;

  List<List<Color>> randomColor = allDaColors[Random().nextInt(5)];

  void changeLanguage() {
    language = !language;
    notifyListeners();
  }

  void changePage(int pageTo) {
    page = pageTo;
    if (page > -1) {
      home = false;
    } else {
      home = true;
    }
    notifyListeners();
  }

  void randomColorPalette() {
    final i = Random().nextInt(5);
    randomColor = allDaColors[i];
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    randomColorPalette();
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Gabarito',
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: white),
      helperStyle: const TextStyle(color: white),
      floatingLabelStyle: const TextStyle(color: white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: white,
          width: 5,
        ),
      ),
      enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: white)),
      focusColor: white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: white,
          width: 2,
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: white,
      ),
    ),
    scaffoldBackgroundColor: black,
    primaryColor: black,
    primaryColorLight: black,
    primaryColorDark: black,
    cardColor: white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: white,
        backgroundColor: black,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );
  static final darkTheme = ThemeData(
    fontFamily: 'Gabarito',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: white,
    primaryColorLight: white,
    primaryColor: white,
    cardColor: black,
    iconTheme: const IconThemeData(color: white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: black,
        backgroundColor: white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: white),
      helperStyle: const TextStyle(color: white),
      floatingLabelStyle: const TextStyle(color: white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: white,
          width: 5,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: white,
        ),
      ),
      focusColor: white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: white,
          width: 2,
        ),
      ),
    ),
  );
}
