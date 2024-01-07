import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    return Card(
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
                padding: const EdgeInsets.all(8.0),
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
                    icon: Icon(
                      widget.post.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.post.isLiked ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        if (widget.post.isLiked) {
                          widget.post.likeCount--;
                        } else {
                          widget.post.likeCount++;
                        }
                        widget.post.isLiked = !widget.post.isLiked;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
                      setState(() {
                        widget.post.isCommenting = !widget.post.isCommenting;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.post.likeCount} likes'),
                    Text('${widget.post.commentCount} comments'),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
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
              )
            ],
          ),
        ));
  }
}
