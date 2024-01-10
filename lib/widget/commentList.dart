import 'dart:html';
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';

class CommentListWidget extends StatefulWidget {
  final Post post;
  final CommentPost user;

  const CommentListWidget({Key? key, required this.post, required this.user})
      : super(key: key);

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentListWidget> {
  bool isCollaborating = false;

  @override
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
            backgroundColor: Colors.pink,
          ),
          title: Text("widget.post.username"),
          subtitle: Text("this is comment after sent"),
          trailing: TextButton(
              onPressed: () {
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
                            // Lakukan aksi jika user memilih "No"
                            Navigator.of(context).pop(false); // Tutup dialog
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Lakukan aksi jika user memilih "Yes"
                            Navigator.of(context).pop(true);
                            setState(() {
                              isCollaborating = true;
                              widget.user.solved = true;
                            });
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(widget.user.solved ? "on collab" : "collab"))),
    );
  }
}
