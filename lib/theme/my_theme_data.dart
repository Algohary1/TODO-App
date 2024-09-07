import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Colors.blue;
  static Color blackColor = Colors.black;
  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFDFECDB),
    primaryColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: Color(0xFF61E757),
            fontSize: 22,
            fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 18),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
    ),
    ),
  );
  static ThemeData DarkTheme = ThemeData();
}
