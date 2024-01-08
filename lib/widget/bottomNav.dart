import 'package:flutter/material.dart';
import 'package:konsultanku/main.dart';
// class BottomNavBarWidget extends StatefulWidget {
//   @override
//   _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
// }

// class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     int _selectedIndex = 0;
//     void _onItemTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//         navigateToScreens(index);
//       });
//     }

//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: "home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.business),
//           label: 'Business',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.school),
//           label: 'School',
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Color(0xFFAA292E),
//       onTap: _onItemTapped,
//     );
//   }
// }


class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const BottomNavBarWidget({
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.phone_in_talk_sharp),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFFAA292E),
      onTap: onItemTapped,
    );
  }
}