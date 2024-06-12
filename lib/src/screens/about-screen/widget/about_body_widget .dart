import 'package:flutter/material.dart';
import 'package:university_courses/src/constants/text_about.dart';
import 'package:university_courses/src/widgets/body_secondary_widget.dart';
class AboutBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BodySecondaryWidget(title: titleabout, text1: text1, text2: text2);
  }
}
