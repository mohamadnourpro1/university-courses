import 'package:flutter/material.dart';
import 'package:university_courses/src/constants/help_about.dart';
import 'package:university_courses/src/widgets/body_secondary_widget.dart';

class HelpBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BodySecondaryWidget(title: titlehelp, text1: text1, text2: text2);
  }
}
