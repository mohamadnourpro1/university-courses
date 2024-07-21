import 'package:flutter/material.dart';
import 'package:university_courses/src/widgets/AppBarWidget.dart';
import 'package:university_courses/src/widgets/BottomNavigationBarWidget.dart';
import 'package:university_courses/src/widgets/EndDrawerWidget.dart';
import 'package:university_courses/src/widgets/under_development.dart';
import 'package:university_courses/theme/theme.dart';

class CalendarTodayScreen extends StatelessWidget {
  const CalendarTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTheme .colorScheme.secondary,
      appBar: MyAppBar(),
      body: UnderDevelopment(),
      endDrawer: MyEndDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
