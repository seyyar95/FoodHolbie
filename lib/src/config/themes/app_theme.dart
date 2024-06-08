import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get apptheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white, //Background

      fontFamily: "Inter",

      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        displayMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        displaySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.6),
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: Color(0xFFE53329), width: 2),
        ),
      ),

      colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color(0xFFE53329),
          ), //Color Scheme for Primary Color

      primaryColor: const Color(0xFFE53329), //Primary Color
    );
  }
}
