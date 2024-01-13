import 'package:flutter/material.dart';

class HorizontalGroupList extends StatefulWidget {
  @override
  _HorizontalGroupListState createState() => _HorizontalGroupListState();
}

class _HorizontalGroupListState extends State<HorizontalGroupList> {
  List<String> groupNames = ["Group 1", "Group 2", "Group 3", "Group 4"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: groupNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Kolaborasi'),
                    content:
                        Text('Apakah Anda ingin berkolaborasi dengan user?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // Tutup dialog
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Lakukan aksi jika user memilih "Yes"
                          Navigator.of(context).pop(true);
                          setState(() {});
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:4),
              child: GroupBox(
                groupName: groupNames[index],
                iconData: Icons.group,
              ),
            ),
          );
        },
      ),
    );
  }
}

class GroupBox extends StatelessWidget {
  final String groupName;
  final IconData iconData;

  GroupBox({required this.groupName, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0, // Set the width as needed
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 40.0,
            color: Colors.blue,
          ),
          SizedBox(height: 8.0),
          Text(
            groupName,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
