import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    fontFamily: 'Lemonaries',
    colorScheme: ColorScheme(
      primary: Color(0xFF1E265D),
      secondary: Color(0xFFF2AC28),
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
      
    ),
    textTheme: TextTheme(
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 20,
        )));
