import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Lemonaries',
  colorScheme: const ColorScheme(
    primary: Color(0xFF1E265D),
    secondary: Color(0xFFF2AC28),
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
    background: Color(0xFFFFFFFF),
    onBackground: Colors.black,
  ),
  textTheme: const TextTheme(
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
      )),
  scaffoldBackgroundColor: Colors.white,
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xFF1E265D),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E265D),
    foregroundColor: Colors.white,
    
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1E265D),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black,
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: 'Lemonaries',
  colorScheme: const ColorScheme(
    primary: Color(0xFF1E1E1E),
    secondary: Color(0xFFF2AC28),
    surface: Colors.black,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
    background: Color(0xFF000000),
    onBackground: Colors.white,
  ),
  textTheme: const TextTheme(
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
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black,
  ),
);
