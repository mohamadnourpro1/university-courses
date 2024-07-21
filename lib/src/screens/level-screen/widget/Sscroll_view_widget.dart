import 'package:flutter/material.dart';
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
              levelText: "المستوى الأول",
            ),
            CardLevelWidget(
              levelText: "المستوى الثاني",
            ),
            CardLevelWidget(
              levelText: "المستوى الثالث",
            ),
            CardLevelWidget(
              levelText: "المستوى الرابع",
            ),
          ],
        ),
      ),
    );
  }
}
