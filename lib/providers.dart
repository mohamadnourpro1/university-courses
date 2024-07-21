import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:university_courses/theme/theme.dart';

List<SingleChildWidget> providers = [
  MultiProvider(
    providers: [  ChangeNotifierProvider(create: (context) => ThemeProvider()),

      Provider(create: (_) => ()),
    ],
  ),
];

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  void switchTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
