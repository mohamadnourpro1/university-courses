import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/about-screen/about-screen.dart';
import 'package:university_courses/src/screens/book_screen/book_screen.dart';
import 'package:university_courses/src/screens/calendar_today_screen/calendar_today_screen.dart';
import 'package:university_courses/src/screens/help-screen/help-screen.dart';
import 'package:university_courses/src/screens/level-screen/level-screen.dart';
import 'package:university_courses/src/screens/login-screen/login-screen.dart';
import 'package:university_courses/src/screens/select%20-season-screen/select%20-season-screen.dart';
import 'package:university_courses/src/screens/signup_screen/signup_screen.dart';
import 'package:university_courses/src/screens/splash-screen/splash-screen.dart';
import 'package:university_courses/src/screens/view_course_screen/view_course_screen.dart';
import 'package:university_courses/src/screens/view_level_screen/View_level_screen.dart';
import 'package:university_courses/src/screens/view_pdf_screen/view_pdf_screen.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => SplashScreen(),
  "/Login/": (context) => LogInScreen(),
  "Login/SignUp/": (context) => SignUpScreen(),
  "Home/AppBar/Help/": (context) => HelpScreen(),
  "Home/BottomNavigationBar/Book/": (context) => BookScreen(),
  "Home/BottomNavigationBar/CalendarToday/": (context) => CalendarTodayScreen(),
  "Home/AppBar/About/": (context) => AboutScreen(),
  "Login/Level/": (context) => LevelScreen(),
  "Login/Level/ViewLevel/": (context) => ViewLevelScreen(),
  "Login/Level/SelectSeason/": (context) => SelectSeasonScreen(),
  "Login/Level/ViewCourseS/": (context) => ViewCourseScreen(),
  "Login/Level/ViewLevel/ViewPdf/": (context) => ViewPdfScreen(),
};