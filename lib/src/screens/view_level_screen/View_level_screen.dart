import 'package:university_courses/src/screens/View_level_screen/widgets/GridViewWidget.dart';
import 'package:university_courses/src/widgets/BottomNavigationBarWidget.dart';
import 'package:university_courses/src/widgets/EndDrawerWidget.dart';
import 'package:university_courses/src/widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(ViewLevelScreen());

class ViewLevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MyGridView(),
      endDrawer: MyEndDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
