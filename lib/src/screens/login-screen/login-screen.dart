import 'package:university_courses/src/widgets/email_field.dart';
import 'package:university_courses/src/widgets/password_field.dart';
import 'package:university_courses/src/widgets/signup_text.dart';
import 'package:university_courses/src/widgets/login_button.dart';
import 'package:university_courses/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightTheme.colorScheme.secondary,
      ),
      home: Scaffold(
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
                  LoginButton(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('Login/Level/');
                    },
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
      ),
    );
  }
}
