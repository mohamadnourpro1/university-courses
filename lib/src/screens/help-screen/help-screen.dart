import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/help-screen/widget/help_body_widget%20.dart';
import 'package:university_courses/src/widgets/AppBarWidget.dart';
import 'package:university_courses/src/widgets/BottomNavigationBarWidget.dart';
import 'package:university_courses/src/widgets/EndDrawerWidget.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: HelpBodyWidget(),
      endDrawer: MyEndDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
