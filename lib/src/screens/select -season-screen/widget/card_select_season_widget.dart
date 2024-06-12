import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/view_course_screen/view_course_screen.dart';
import 'package:university_courses/theme/theme.dart';

class CardSelectSeasonWidget extends StatelessWidget {
  const CardSelectSeasonWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                            builder: (context) => ViewCourseScreen()));
                  },
                  child: Container(
                    height: 380,
                    alignment: Alignment.center,
                    child: Text(
                      " الفصل الاول",
                      style: TextStyle(
                          color: appTheme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  )),
            ),
            Card(
              color: appTheme.colorScheme.primary,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewCourseScreen()));
                  },
                  child: Container(
                    height: 380,
                    alignment: Alignment.center,
                    child: Text(
                      " الفصل الثاني",
                      style: TextStyle(
                          color: appTheme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
