import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_courses/providers.dart';
import 'package:university_courses/routes.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   await Firebase.initializeApp(options:FirebaseOptions(apiKey: "AIzaSyBnNR2chauf82Xg5KQosnBzt2OWIZ7Z-rk", appId: "1:695145906122:android:89fe140b186b8ba2d05933", messagingSenderId: "695145906122", projectId: "iusr-courses" ,storageBucket:"iusr-courses.appspot.com" ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.currentTheme,
            debugShowCheckedModeBanner: false,
            routes: routes,
          );
        },
      ),
    );
  }
}
