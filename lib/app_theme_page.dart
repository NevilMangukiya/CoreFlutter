import 'package:flutter/material.dart';

import 'app_colors_page.dart';
//
// class ThemeP extends ChangeNotifier {
//   ThemeMode themeMode = ThemeMode.dark;
//
//   bool get isDark => themeMode == ThemeMode.dark;
// }

class AppTheme {
  static bool isDark = false;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Appcolors.primaryColor,
      secondary: Appcolors.secondaryColor,
      brightness: Brightness.light,
    ),
  );
  static ThemeData Darktheme = ThemeData(
    scaffoldBackgroundColor: Colors.blue.shade300,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.amberAccent,
      secondary: Colors.amber,
    ),
  );
}
