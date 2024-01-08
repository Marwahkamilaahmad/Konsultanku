import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:konsultanku/widget/appBar.dart';

class Post {
  final String username;
  final String content;
  final String imageUrl;
  bool isLiked;
  int likeCount;
  bool isCommenting;
  int commentCount;

  Post({
    required this.username,
    required this.content,
    required this.imageUrl,
    this.isLiked = false,
    this.likeCount = 0,
    this.commentCount = 0,
    this.isCommenting = false,
  });
}

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius as needed
          side: BorderSide(
            color: Color.fromARGB(
                255, 203, 203, 203), // Set the color of the border
            width: 1.0, // Set the width of the border
          ),
        ),
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "go to profile",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.purple,
                      textColor: Colors.white,
                    );
                  },
                  icon: CircleAvatar(
                    // backgroundImage: AssetImage('assets/user_profile_image.png'),
                    backgroundColor: Colors.purple[200],
                  ),
                ),
                title: Text(widget.post.username),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.post.content),
              ),
              if (widget.post.imageUrl.isNotEmpty)
                // Image.network(
                //   // widget.post.imageUrl,
                //   // fit: BoxFit.fill,
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.post.isLiked = !widget.post.isLiked;
                          if (widget.post.isLiked) {
                            widget.post.likeCount++;
                          } else {
                            widget.post.likeCount--;
                          }
                        });
                      },
                      icon: Icon(
                        widget.post.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.post.isLiked ? Colors.red : null,
                      ),
                    ),
                    Text(
                        '${widget.post.likeCount} Suka'), // Text widget for 'Like'
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.post.isCommenting = !widget.post.isCommenting;
                        });
                      },
                      icon: Icon(Icons.comment),
                    ),
                    Text(
                        '${widget.post.commentCount} Komentar'), // Text widget for 'Comment'
                  ],
                ),
              SizedBox(
                height: 16,
              ),
              Divider(color: Colors.grey),
              if (widget.post.isCommenting)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a  comment',
                    ),
                  ),
                ),
              if (widget.post.isCommenting)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text('sent'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Ubah nilai radius sesuai keinginan Anda
                        ),
                      )),
                ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    side: BorderSide(
                      color: Color.fromARGB(
                          255, 203, 203, 203), // Set the color of the border
                      width: 1.0, // Set the width of the border
                    ),
                  ),
                  color: const Color.fromARGB(224, 255, 255, 255),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink,
                    ),
                    title: Text(widget.post.username),
                    subtitle: Text("this is comment after sent"),
                  ),
                ),
              ),
              SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
