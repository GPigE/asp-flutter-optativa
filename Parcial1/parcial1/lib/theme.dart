import 'package:flutter/material.dart';

class AppTheme {
  static const blue = Color(0xFF2196F3);

  static ThemeData get data => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: blue),
    appBarTheme: const AppBarTheme(
      backgroundColor: blue,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
