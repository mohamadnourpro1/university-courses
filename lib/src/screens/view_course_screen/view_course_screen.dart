import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/view_course_screen/widget/lsitview_body_widget.dart';
import 'package:university_courses/src/widgets/AppBarWidget.dart';
import 'package:university_courses/src/widgets/BottomNavigationBarWidget.dart';
import 'package:university_courses/src/widgets/EndDrawerWidget.dart';

class ViewCourseScreen extends StatelessWidget {
  const ViewCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: LsitviewBodyWidget(),
      endDrawer: MyEndDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
