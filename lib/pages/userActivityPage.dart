import 'package:flutter/material.dart';

class Activity {
  final String id;
  final String studentId;
  final String keterangan;

  Activity(
      {required this.id, required this.studentId, required this.keterangan});
}

class UserActivity extends StatefulWidget {
  @override
  _UserActivityState createState() => _UserActivityState();
}

class _UserActivityState extends State<UserActivity> {
  final List<Activity> cobaActive = [
    Activity(id: "id", studentId: "studentId", keterangan: "keterangan")
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Text(cobaActive[0].id),
        Text(cobaActive[0].keterangan),
      ],
    ));
  }
}
