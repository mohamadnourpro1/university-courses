import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String labelText;

  UsernameField({this.controller, this.onChanged, this.validator, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.person,
          color:lightTheme .colorScheme.primary,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
