import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:university_courses/src/widgets/email_field.dart';
import 'package:university_courses/src/widgets/password_field.dart';
import 'package:university_courses/src/widgets/username_field.dart';
import 'package:university_courses/src/widgets/login_button.dart';
import 'package:university_courses/src/widgets/signup_text.dart';
import 'package:university_courses/theme/theme.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى إدخال جميع الحقول')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('كلمة المرور وتأكيد كلمة المرور لا يتطابقان')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('http://192.168.0.105:8000/api/auth/register');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': username,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        }),
      );

      setState(() {
        _isLoading = false;
      });

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Data: $data'); // طباعة البيانات للتأكد
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم تسجيل الحساب بنجاح')),
        );
        Navigator.of(context).pushReplacementNamed('/Login/');
      } else {
        final responseBody = json.decode(response.body);
        final message = responseBody['message'] ?? 'فشل التسجيل: ${response.reasonPhrase}';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ أثناء محاولة الاتصال بالخادم: $e')),
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
                  'إنشاء حساب',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                UsernameField(
                  controller: usernameController,
                  labelText: 'اسم المستخدم',
                  onChanged: (value) {},
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
                PasswordField(
                  controller: confirmPasswordController,
                  labelText: 'تأكيد كلمة المرور',
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    : LoginButton(
                        text: 'إنشاء حساب',
                        onPressed: _register,
                      ),
                SizedBox(height: 20),
                SignupText(
                  signupText: 'تسجيل دخول',
                  promptText: 'هل فعلاً لديك حساب؟',
                  onSignupPressed: () {
                    Navigator.of(context).pushReplacementNamed('/Login/');
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
