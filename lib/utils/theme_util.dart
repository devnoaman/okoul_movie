import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF12BBB3);

  static final lightTheme = ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: const Color(0xFFF5F6F8),
    primaryColor: primaryColor,
    primaryColorDark: const Color(0xff255FA0),
    // brightness: Brightness.light,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black),
    ),
    canvasColor: const Color(0xffFFFFFF),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: const MaterialColor(
      0xFF12BBB3,
      <int, Color>{
        50: Color(0xFF12BBB3),
        100: Color(0xFF12BBB3),
        200: Color(0xFF12BBB3),
        300: Color(0xFF12BBB3),
        400: Color(0xFF12BBB3),
        500: Color(0xFF12BBB3),
        600: Color(0xFF12BBB3),
        700: Color(0xFF12BBB3),
        800: Color(0xFF12BBB3),
        900: Color(0xFF12BBB3),
      },
    )).copyWith(
        background: const Color(0xFFFCFCFC), brightness: Brightness.light),
  );

  /// colors for dark mode
  static final darkTheme = ThemeData(
    fontFamily: 'Cairo',
    // brightness: Brightness.dark,
    canvasColor: const Color(0xff16213E),
    scaffoldBackgroundColor: const Color(0xFF041C32),
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: const MaterialColor(
      0xFF12BBB3,
      <int, Color>{
        50: Color(0xFF12BBB3),
        100: Color(0xFF12BBB3),
        200: Color(0xFF12BBB3),
        300: Color(0xFF12BBB3),
        400: Color(0xFF12BBB3),
        500: Color(0xFF12BBB3),
        600: Color(0xFF12BBB3),
        700: Color(0xFF12BBB3),
        800: Color(0xFF12BBB3),
        900: Color(0xFF12BBB3),
      },
    )).copyWith(
        background: const Color(0xFF02121B), brightness: Brightness.dark),
  );
}
