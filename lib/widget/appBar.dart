import 'package:flutter/material.dart';

AppBar appBarWidget() {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Text("Konsultanku"),
    actions: <Widget>[
      IconButton(
        onPressed: () {
        },
        icon: Icon(Icons.account_circle_sharp),
        color: Color(0xFF323232),
      ),
    ],
  );
}
