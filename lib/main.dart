import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_courses/providers.dart';
import 'package:university_courses/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.currentTheme,
            debugShowCheckedModeBanner: false,
            routes: routes,
          );
        },
      ),
    );
  }
}
