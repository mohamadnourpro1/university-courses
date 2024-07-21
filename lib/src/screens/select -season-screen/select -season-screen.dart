import 'package:university_courses/src/screens/select%20-season-screen/widget/card_select_season_widget.dart';
import 'package:university_courses/src/widgets/AppBarWidget.dart';
import 'package:university_courses/src/widgets/BottomNavigationBarWidget.dart';
import 'package:university_courses/src/widgets/EndDrawerWidget.dart';
import 'package:flutter/material.dart';

class SelectSeasonScreen extends StatelessWidget {
  const SelectSeasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: CardSelectSeasonWidget(),
      endDrawer: MyEndDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
