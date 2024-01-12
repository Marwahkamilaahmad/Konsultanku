import 'package:flutter/material.dart';
import 'package:konsultanku/widget/activityList.dart';

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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cobaActive.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ActivityListWidget(),
              );
            },
          ),
        ),
      ],
    );
  }
}
