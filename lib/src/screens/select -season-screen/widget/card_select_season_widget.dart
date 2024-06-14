import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/view_course_screen/view_course_screen.dart';

class CardSelectSeasonWidget extends StatelessWidget {
  const CardSelectSeasonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: theme.colorScheme.primary,
              child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ViewCourseScreen()));
                    Navigator.of(context).pushNamed('Login/Level/ViewLevel/');
                  },
                  child: Container(
                    height: 380,
                    alignment: Alignment.center,
                    child: Text(
                      " الفصل الاول",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  )),
            ),
            Card(
              color: theme.colorScheme.primary,
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
                          color: Colors.white,
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
