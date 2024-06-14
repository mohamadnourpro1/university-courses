import 'package:university_courses/src/widgets/password_field.dart';
import 'package:university_courses/src/widgets/username_field.dart';
import 'package:university_courses/src/widgets/login_button.dart';
import 'package:university_courses/src/widgets/signup_text.dart';
import 'package:university_courses/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightTheme .colorScheme.secondary,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            color: lightTheme .colorScheme.secondary,
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
                    'انشاء حساب',
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
                  PasswordField(
                    controller: passwordController,
                    labelText: 'كلمة المرور',
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordField(
                    controller: ConfirmpasswordController,
                    labelText: 'تأكيد كلمة المرور',
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),
                  LoginButton(
                    text: 'انشاء حساب',
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  SignupText(
                    signupText: 'تسجيل دخول',
                    promptText: 'هل فعلا" لديك حساب؟',
                    onSignupPressed: () {
                      Navigator.of(context).pushReplacementNamed('/Login/');
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
