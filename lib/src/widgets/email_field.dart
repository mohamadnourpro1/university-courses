import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String labelText;

  EmailField({this.controller, this.onChanged, this.validator, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.email,
          color: lightTheme.colorScheme.primary,
        ),
        filled: true,
        fillColor: Colors.white,
        constraints: BoxConstraints.tightFor(width: 300), 
      ),
    );
  }
}
