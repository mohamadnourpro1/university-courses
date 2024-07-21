import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_courses/providers.dart';
import 'package:university_courses/src/screens/about-screen/about-screen.dart';
import 'package:university_courses/src/screens/drop_file_screen/drop_file_screen.dart';
import 'package:university_courses/src/screens/help-screen/help-screen.dart';
import 'package:university_courses/src/screens/login-screen/login-screen.dart';

class MyEndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: theme.drawerTheme.backgroundColor,
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: theme.colorScheme.secondary),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
             ListTile(
              leading:
                  Icon(Icons.brightness_6, color: theme.colorScheme.secondary),
              title: Text('تغيير الثيم', style: theme.textTheme.bodyMedium),
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .switchTheme();
              },
            ),  ListTile(
              leading:
                  Icon(Icons.book_sharp, color: theme.colorScheme.secondary),
              title: Text('رفع محاضرات', style: theme.textTheme.bodyMedium),
              onTap: () {
                 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DropFileScreen()),
                );
              
              },
            ),
            
            ListTile(
              leading: Icon(Icons.help, color: theme.colorScheme.secondary),
              title: Text('مساعدة', style: theme.textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: theme.colorScheme.secondary),
              title: Text('حول', style: theme.textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),ListTile(
              leading:
                  Icon(Icons.exit_to_app, color: theme.colorScheme.secondary),
              title: Text('تسجيل خروج', style: theme.textTheme.bodyMedium),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen()),
                );
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
