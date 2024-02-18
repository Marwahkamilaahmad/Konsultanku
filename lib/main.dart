import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';
import 'package:konsultanku/pages/loginpage.dart';
import 'package:konsultanku/pages/progressPage.dart';
import 'package:konsultanku/widget/bottomNav.dart';
import 'package:konsultanku/pages/chatPage.dart';
import 'package:konsultanku/pages/profilePage.dart';
import 'package:konsultanku/pages/showpost.dart';
import 'package:konsultanku/widget/appBar.dart';

import 'package:flutter/cupertino.dart';

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
        home: MyHomePage(),
        // home: ShowPost(),
        // home : PostWidget(post : Post(username: "melly", content: "lorem ipsum he webOnlyAssetManager getter is deprecated and will be removed in a future release. Please use `assetManager` from `dart:ui_web` instead", imageUrl: 'assets/images/Rectangle-30.png'))
        // home: NavigateApp()
        );
  }
}

class NavigateApp extends StatefulWidget {
  @override
  _NavigateAppState createState() => _NavigateAppState();
}

class _NavigateAppState extends State<NavigateApp> {
  int _currentIndex = 0; // Move _currentIndex here

  final List<Widget> viewContainer = [
    ProgressPage(),
    ShowPost(),
    ProfilePage(),
  ];

  void navigateToScreens(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: IndexedStack(
        index: _currentIndex,
        children: viewContainer,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: _currentIndex,
        onItemTapped: navigateToScreens, // Pass the callback function
      ),
    );
  }
}
