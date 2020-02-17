import 'package:byneetcourseapp/src/modules/login/screens/android/login_android.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Byneet Course',
      debugShowCheckedModeBanner: false,
      home: LoginAndroid(),
      theme: ThemeData(
        fontFamily: "Nunito",
        backgroundColor: Color(0xFFD2E0EF),
        primaryColor: Color(0xFFD2E0EF),
        splashColor: Color(0xFFA5A4A6),
        accentColor: Color(0xFFD2E0EF),
        buttonColor: Color(0xFFFB1002),
        scaffoldBackgroundColor: Color(0xFFD2E0EF),
      ),
    );
  }
}

// 0xFFD2E0EF
// 0xFF9BB4CE
// 0xFF15140D
// 0xFF514A40
// 0xFFA5A4A6
// 0xFF83867C
// 0xFFFB1002
