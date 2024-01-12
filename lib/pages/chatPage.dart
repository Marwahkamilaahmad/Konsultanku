import 'package:flutter/material.dart';

class User {
  String name;
  String id;
  String email;
  String imageUrl;

  User({this.name = "", this.email = "", this.id = "", this.imageUrl = ""});
}

class ChatPage extends StatefulWidget {
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<User> usersList = [
    User(name: "Kenshi Yamaguchi", email: "kenshi-why@gmail.com", id: "115642", imageUrl:  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD1oYHOkWvRtUd65uGKIQPyMl2aFwBaP0d6g&usqp=CAU"),
    User(name: "alya kusumo", email: "alya-k@gmail.com", id: "622435", imageUrl: "https://images.soco.id/374-c7b20894fbc6b8fc71b49fd3541e67e7.jpg.jpeg")
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
                    // backgroundColor: Color.fromARGB(255, 37, 37, 160),
                    backgroundImage: NetworkImage(usersList[index].imageUrl),
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
