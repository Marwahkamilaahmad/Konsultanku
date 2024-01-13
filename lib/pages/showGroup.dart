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
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: groupNames.length + 1, // Tambahkan 1 untuk AddGroupBox
        itemBuilder: (context, index) {
          if (index < groupNames.length) {
            // Jika indeks kurang dari panjang daftar grup
            return GestureDetector(
              onTap: () {
                // Aksi ketika GroupBox diklik
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    GroupBox(
                      groupName: groupNames[index],
                      iconData: Icons.group,
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Jika indeks adalah panjang daftar grup, tampilkan AddGroupBox
            return GestureDetector(
              onTap: () {
                // Aksi ketika AddGroupBox diklik
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Create Team'),
                      content: Text('Are you sure want to create a new team?'),
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
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: AddGroupBox(),
              ),
            );
          }
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
      width: 300.0, // Set the width as needed
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            groupName,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Icon(
            iconData,
            size: 40.0,
            color: Color.fromARGB(255, 177, 190, 215),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Join Team'),
                      content: Text('Are you sure join this team ?'),
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
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                   Color.fromRGBO(101, 98, 253, 1),
                ),
              ),
              child: Text(
                "join team",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddGroupBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0, // Set the width as needed
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Team",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20.0),
          Icon(
            Icons.add,
            size: 40.0,
            color: Color.fromRGBO(101, 98, 253, 1),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
