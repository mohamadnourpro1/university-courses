import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/View_level_screen/View_level_screen.dart';
import 'package:university_courses/src/screens/book_screen/book_screen.dart';
import 'package:university_courses/src/screens/calendar_today_screen/calendar_today_screen.dart';
import 'package:university_courses/src/screens/level-screen/level-screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor: Colors.white,
      backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:
              Icon(Icons.menu_book_rounded, color: theme.colorScheme.secondary),
          label: 'الاخبار',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: theme.colorScheme.secondary),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, color: theme.colorScheme.secondary),
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
