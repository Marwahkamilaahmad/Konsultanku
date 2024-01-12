import 'package:flutter/material.dart';

class User {
  String name;
  String id;
  String email;

  User({this.name = "", this.email = "", this.id = ""});
}

class ChatPage extends StatefulWidget {
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<User> usersList = [
    User(name: "sandy", email: "sandy@gmail.com", id: "124"),
    User(name: "alya", email: "alya@gmail.com", id: "127")
  ];
  //  List<DocumentSnapshot> usersList;

  // void initState() {
  //   super.initState();
  //   _subscription = _collectionReference.snapshots().listen((datasnapshot) {
  //     setState(() {
  //       usersList = datasnapshot.documents;
  //       print("Users List ${usersList.length}");
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collaborator"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: usersList.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 37, 37, 160),
                  ),
                  title: Text(usersList[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(usersList[index].email,
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                  onTap: (() {}),
                ),
                Divider(
                  height: 3,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
