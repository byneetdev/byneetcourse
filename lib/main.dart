import 'package:byneetcourseapp/src/modules/home/screens/android/home_android.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Byneet Course',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeAndroid(),
    );
  }
}
