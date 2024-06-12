import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/View_level_screen/View_level_screen.dart';
import 'package:university_courses/src/screens/book_screen/book_screen.dart';
import 'package:university_courses/src/screens/calendar_today_screen/calendar_today_screen.dart';
import 'package:university_courses/src/screens/level-screen/level-screen.dart';
import 'package:university_courses/theme/theme.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: appTheme.colorScheme.secondary,
      unselectedItemColor: Colors.white,
      backgroundColor: appTheme.colorScheme.primary,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded,
              color: appTheme.colorScheme.secondary),
          label: 'الاخبار',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: appTheme.colorScheme.secondary),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon:
              Icon(Icons.calendar_today, color: appTheme.colorScheme.secondary),
          label: 'البرنامج',
        ),
      ],
      currentIndex: 1,
      onTap: (index) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            switch (index) {
              case 0:
                return BookScreen();
              case 1:
                return LevelScreen();
              case 2:
                return CalendarTodayScreen();
              default:
                return ViewLevelScreen();
            }
          },
        ));
      },
    );
  }
}
