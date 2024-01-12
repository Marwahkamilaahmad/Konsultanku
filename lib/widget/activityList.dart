import 'package:flutter/material.dart';

class ActivityListWidget extends StatefulWidget {
  const ActivityListWidget({Key? key}) : super(key: key);

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityListWidget> {
  bool isCollaborating = false;
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
        side: BorderSide(
          color:
              Color.fromARGB(255, 203, 203, 203), // Set the color of the border
          width: 1.0, // Set the width of the border
        ),
      ),
      color: const Color.fromARGB(224, 255, 255, 255),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber,
          backgroundImage: NetworkImage("https://static.thenounproject.com/png/118540-200.png"),
        ),
        trailing: Text("1 hr ago"),
        title: Text("Colaboration"),
        subtitle: Text("now you were colaborate with user : Kenshi Yamaguchi"),
      ),
    );
  }
}
