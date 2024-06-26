import 'package:university_courses/src/screens/level-screen/widget/Sscroll_view_widget.dart';
import 'package:university_courses/src/widgets/BottomNavigationBarWidget.dart';
import 'package:university_courses/src/widgets/EndDrawerWidget.dart';
import 'package:university_courses/src/widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: MyAppBar(showBackButton: false),
     body: ScrollViewWidgetCard(),
      endDrawer: MyEndDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
