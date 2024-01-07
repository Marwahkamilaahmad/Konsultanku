import 'package:flutter/material.dart';
import 'package:konsultanku/pages/loginpage.dart';
import 'package:konsultanku/pages/showpost.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Login UI'),
      // home: ShowPost(),
    );
  }
}
