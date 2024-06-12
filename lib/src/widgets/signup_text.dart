import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class SignupText extends StatelessWidget {
  final String signupText;
  final String promptText;
  final VoidCallback onSignupPressed;

  SignupText(
      {required this.signupText,
      required this.promptText,
      required this.onSignupPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onSignupPressed,
          child: Text(
            signupText,
            style: TextStyle(
              color: appTheme.colorScheme.primary
            ),
          ),
        ),
        Text(
          promptText,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
