import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class BodySecondaryWidget extends StatelessWidget {
  final String title;
  final String text1;
  final String text2;

  const BodySecondaryWidget({
    super.key,
    required this.title,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightTheme.colorScheme.secondary,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(title, style: lightTheme.textTheme.bodyLarge),
          SizedBox(height: 30.0),
          Text(
            text1,
            style: lightTheme.textTheme.bodyMedium,
          ),
          SizedBox(height: 30.0),
          Text(
            text2,
            style: lightTheme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}