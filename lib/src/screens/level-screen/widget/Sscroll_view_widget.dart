import 'package:flutter/material.dart';
import 'package:university_courses/src/models/names_cours/name_courses.dart';
import 'package:university_courses/src/screens/level-screen/widget/card_level.dart.dart';

class ScrollViewWidgetCard extends StatelessWidget {
  const ScrollViewWidgetCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CardLevelWidget(
              selectedLevelShow: {
                'Season1': nameCoursesLevel1.Level1Season1,
                'Season2': nameCoursesLevel1.Level1Season2,
              },
              levelText: "المستوى الأول",
            ),
            CardLevelWidget(
              selectedLevelShow: {
                'Season1': nameCoursesLevel2.Level2Season1,
                'Season2': nameCoursesLevel2.Level2Season2,
              },
              levelText: "المستوى الثاني",
            ),
            CardLevelWidget(
              selectedLevelShow: {
                'Season1': nameCoursesLevel3.Level3Season1,  
                'Season2': nameCoursesLevel3.Level3Season2,
              },
              levelText: "المستوى الثالث",
            ),
            CardLevelWidget(
              selectedLevelShow: {
                'Season1': nameCoursesLevel4.Level4Season1,  
                'Season2': nameCoursesLevel4.Level4Season2,
              },
              levelText: "المستوى الرابع",
            ),
          ],
        ),
      ),
    );
  }
}
