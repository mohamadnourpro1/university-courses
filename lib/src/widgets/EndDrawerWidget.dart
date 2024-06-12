import 'package:flutter/material.dart';
import 'package:university_courses/src/screens/about-screen/about-screen.dart';
import 'package:university_courses/src/screens/help-screen/help-screen.dart';
import 'package:university_courses/src/screens/login-screen/login-screen.dart';
import 'package:university_courses/theme/theme.dart';

class MyEndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: appTheme.colorScheme.primary,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: appTheme.colorScheme.primary,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon:
                      Icon(Icons.close, color: appTheme.colorScheme.secondary),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,
                  color: appTheme.colorScheme.secondary),
              title: Text('تسجيل خروج', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: appTheme.colorScheme.secondary),
              title: Text('مساعدة', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: appTheme.colorScheme.secondary),
              title: Text('حول', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
