import 'package:flutter/material.dart';
import 'package:konsultanku/pages/identityPage.dart';
import 'package:konsultanku/pages/userActivityPage.dart';
import 'package:konsultanku/pages/userPostPage.dart';
import 'package:konsultanku/widget/userProfile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selected = 0;
  bool click = false;
  List<Widget> userPages = [
    IdentityPage(),
    UserPost(),
    UserActivity(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserProfile(size),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Marwah Kamila Ahmad",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Student",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pin_rounded),
                      Text(
                        "City, America",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
            UserEvents(onTab: (index) {
              setState(() {
                selected = index;
                click = !click;
              });
            }),
            Expanded(
              child: SingleChildScrollView(
                child: userPages[selected],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserEvents extends StatelessWidget {
  final Function(int) onTab;

  const UserEvents({Key? key, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: LinearBorder.bottom(
                    side: BorderSide(color: Colors.black)), // Warna garis bawah
              ),
              onPressed: () => onTab(0),
              child: Text("Identity"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: LinearBorder.bottom(
                    side: BorderSide(color: Colors.black)), // Warna garis bawah
              ),
              onPressed: () => onTab(1),
              child: Text("Post"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: LinearBorder.bottom(
                    side: BorderSide(
                        color: onTab == false
                            ? const Color.fromARGB(0, 0, 0, 0)
                            : Colors.black)), // Warna garis bawah
              ),
              onPressed: () => onTab(2),
              child: Text("Activity"),
            ),
          ),
        ),
      ],
    );
  }
}
