import 'package:flutter/material.dart';
import 'package:university_courses/src/widgets/AppBarWidget.dart';
import 'package:university_courses/src/widgets/BottomNavigationBarWidget.dart';
import 'package:university_courses/src/widgets/EndDrawerWidget.dart';
import 'package:university_courses/src/widgets/under_development.dart';
import 'package:university_courses/theme/theme.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: appTheme.colorScheme.secondary,
      body: UnderDevelopment(),
      endDrawer: MyEndDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
