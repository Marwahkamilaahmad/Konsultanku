import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';
import 'package:konsultanku/pages/loginpage.dart';
import 'package:konsultanku/pages/showpost.dart';

void main() {
  runApp(MyApp());
}

int _currentIndex = 0;

void navigateToScreens(int index) {
  _currentIndex = index;
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
      home: ShowPost(),
      // home : PostWidget(post : Post(username: "melly", content: "lorem ipsum he webOnlyAssetManager getter is deprecated and will be removed in a future release. Please use `assetManager` from `dart:ui_web` instead", imageUrl: 'assets/images/Rectangle-30.png'))
      // home: NavigateApp());
    );
  }
}

// class NavigateApp extends StatefulWidget {
//   @override
//   _NavigateAppState createState() => _NavigateAppState();
// }

// class _NavigateAppState extends State<NavigateApp> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
