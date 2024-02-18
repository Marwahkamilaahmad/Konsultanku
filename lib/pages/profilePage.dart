import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';
import 'package:konsultanku/pages/identityPage.dart';
import 'package:konsultanku/pages/userActivityPage.dart';
import 'package:konsultanku/pages/userPostPage.dart';
import 'package:konsultanku/widget/userProfile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selected = 0;
  int click = 0;
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
                    "ALDINI MUKTI",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                        size: 18,
                      ),
                      Icon(Icons.star, color: Colors.yellow[600], size: 18),
                      Icon(Icons.star, color: Colors.yellow[600], size: 18),
                      Icon(Icons.star, color: Colors.yellow[600], size: 18),
                      Icon(Icons.star, color: Colors.yellow[600], size: 18),
                    ],
                  ),
                  Text(
                    "MSME",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.mapPin,
                        size: 14,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "City, Jakarta",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  // ------------------------------------------------------------------
                  // if(student)
                  // SizedBox(height: 4),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "4",
                  //       style: TextStyle(fontSize: 24, color: Colors.amber),
                  //     ),
                  //     Text("Solved"),
                  //   ],
                  // )
                ],
              ),
            ),
            UserEvents(
                selectedTab: click,
                onTab: (index, clicked) {
                  setState(() {
                    selected = index;
                    click = clicked;
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
  final Function(int, int) onTab;
  final int selectedTab;

  Color getBorderColor(int tabIndex) {
    return tabIndex == selectedTab ? Colors.blue : Colors.black;
  }

  const UserEvents({Key? key, required this.onTab, required this.selectedTab})
      : super(key: key);

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
                    side: BorderSide(
                        color: getBorderColor(0))), // Warna garis bawah
              ),
              onPressed: () => onTab(0, 0),
              child: Text("Identity"),
            ),
          ),
        ),

// MSMEE

        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: OutlinedButton(
        //       style: OutlinedButton.styleFrom(
        //         shape: LinearBorder.bottom(
        //             side: BorderSide(
        //                 color: getBorderColor(1))), // Warna garis bawah
        //       ),
        //       onPressed: () => {onTab(1, 1)},
        //       child: Text("Post"),
        //     ),
        //   ),
        // ),






        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: LinearBorder.bottom(
                    side: BorderSide(
                        color: getBorderColor(0))), // Warna garis bawah
              ),
              onPressed: () => onTab(2, 2),
              child: Text("Activity"),
            ),
          ),
        ),
      ],
    );
  }
}
