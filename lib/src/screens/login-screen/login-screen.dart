import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:university_courses/src/widgets/email_field.dart';
import 'package:university_courses/src/widgets/password_field.dart';
import 'package:university_courses/src/widgets/signup_text.dart';
import 'package:university_courses/src/widgets/login_button.dart';
import 'package:university_courses/theme/theme.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى إدخال جميع الحقول')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('http://192.168.0.105:8000/api/auth/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      Navigator.of(context).pushReplacementNamed('Login/Level/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'فشل تسيجل الدخول ',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTheme.colorScheme.secondary,
      body: Center(
        child: Container(
          color: lightTheme.colorScheme.secondary,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                EmailField(
                  controller: emailController,
                  labelText: 'الايميل',
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                PasswordField(
                  controller: passwordController,
                  labelText: 'كلمة المرور',
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    : LoginButton(
                        text: 'تسجيل الدخول',
                        onPressed: _login,
                      ),
                SizedBox(height: 20),
                SignupText(
                  signupText: 'إنشاء حساب',
                  promptText: 'ليس لديك حساب؟',
                  onSignupPressed: () {
                    Navigator.of(context).pushNamed('Login/SignUp/');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
