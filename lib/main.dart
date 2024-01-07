import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';
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
      // home: MyHomePage(title: 'Login UI'),
      // home: ShowPost(),
      home : PostWidget(post : Post(username: "melly", content: "lorem ipsum he webOnlyAssetManager getter is deprecated and will be removed in a future release. Please use `assetManager` from `dart:ui_web` instead", imageUrl: 'assets/images/Rectangle-30.png'))
    );
  }
}
