import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class UnderDevelopment extends StatelessWidget {
  const UnderDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.45,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: Icon(
              Icons.construction,
              size: MediaQuery.of(context).size.width * 0.35,
              color: appTheme.colorScheme.primary,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            ' . . . قيد التطوير',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
