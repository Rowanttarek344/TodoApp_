import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color blue_color = Color(0xFF5D9CEC);
  static Color primary_light_color = Color(0xFFDFECDB);
  static Color white_color = Color(0xFFFFFFFF);
  static Color black_color = Color(0xFF363636);
  static Color gray_color = Color(0xFFC8C9CB);
  static Color green_color = Color(0xFF61E757);
  static Color red_color = Color(0xFFEC4B4B);
  static Color primary_dark_color = Color(0xFF060E1E);

  static ThemeData light_theme = ThemeData(
    primaryColor: primary_light_color,
    appBarTheme: AppBarTheme(
        color: blue_color,
        elevation: 0
    ),
    scaffoldBackgroundColor: primary_light_color,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blue_color,
      unselectedItemColor: gray_color
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white_color
      )
    )
  );
  static ThemeData dark_theme = ThemeData(
      primaryColor: primary_dark_color,
      appBarTheme: AppBarTheme(
          color: blue_color,
          elevation: 0
      ),
      scaffoldBackgroundColor: primary_dark_color,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blue_color,
          unselectedItemColor: gray_color
      ),
      primaryTextTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: black_color
          )
      )
  );
}
