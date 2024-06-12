import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/view_level_screen/View_level_screen.dart';
import 'package:university_courses/theme/theme.dart';

class CardLevelWidget extends StatelessWidget {
  const CardLevelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight / 5;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: appTheme.colorScheme.primary,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewLevelScreen(),
                    ),
                  );
                },
                child: Container(
                  height: cardHeight,
                  alignment: Alignment.center,
                  child: Text(
                    " المستوى الاول ",
                    style: TextStyle(
                      color: appTheme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: appTheme.colorScheme.primary,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewLevelScreen(),
                    ),
                  );
                },
                child: Container(
                  height: cardHeight,
                  alignment: Alignment.center,
                  child: Text(
                    " المستوى الثاني ",
                    style: TextStyle(
                      color: appTheme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: appTheme.colorScheme.primary,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewLevelScreen(),
                    ),
                  );
                },
                child: Container(
                  height: cardHeight,
                  alignment: Alignment.center,
                  child: Text(
                    " المستوى الثالث ",
                    style: TextStyle(
                      color: appTheme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: appTheme.colorScheme.primary,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewLevelScreen(),
                    ),
                  );
                },
                child: Container(
                  height: cardHeight,
                  alignment: Alignment.center,
                  child: Text(
                    " المستوى الرابع ",
                    style: TextStyle(
                      color: appTheme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
