import 'package:flutter/material.dart';
import 'dart:async';

import 'package:university_courses/src/screens/login-screen/login-screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => LogInScreen(),
        //   ),
        // );
        // Navigator.pushReplacementNamed(context, '/Login/');
        Navigator.of(context).pushReplacementNamed('/Login/');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 100, width: 100),
          ],
        ),
      ),
    );
  }
}
