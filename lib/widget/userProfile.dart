import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';

// Stack UserProfile(Size size) {
//   return Stack(
//     children: [
//       Container(
//         width: size.width,
//         height: 150,
//         color: Colors.transparent,
//         padding: EdgeInsets.only(bottom: 150 / 2.2),
//         child: Container(
//           width: size.width,
//           height: 100,
//         ),
//       ),
//       Positioned(
//         top: 180 / 4,
//         left: size.width / 2.4,
//         child: Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: Colors.white, width: 3),
//               shape: BoxShape.circle),
//           child: CircleAvatar(
//             backgroundColor: Color.fromARGB(255, 208, 160, 160),
//           ),
//         ),
//       ),
//     ],
//   );
// }

class UserProfile extends StatelessWidget {
  final Size size;

  const UserProfile(this.size);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 130,
          color: Colors.transparent,
          padding: EdgeInsets.only(bottom: 150 / 2.2),
          child: Container(
            width: size.width,
            height: 100,
          ),
        ),
        Positioned(
          top: 10,
          left: (size.width - 100) / 2,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 208, 160, 160),
            ),
          ),
        ),
      ],
    );
  }
}
