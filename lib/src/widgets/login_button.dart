import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  LoginButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:lightTheme .colorScheme.primary,
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
