import 'package:flutter/material.dart';
import 'package:university_courses/theme/theme.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String labelText;

  PasswordField({
    this.controller,
    this.onChanged,
    this.validator,
    required this.labelText,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.lock,
          color: lightTheme .colorScheme.primary,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
