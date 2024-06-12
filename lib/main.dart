import 'package:provider/provider.dart';
import 'package:university_courses/providers.dart';
import 'package:university_courses/src/screens/splash-screen/splash-screen.dart';
import 'package:university_courses/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
