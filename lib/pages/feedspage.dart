import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:konsultanku/widget/appBar.dart';
import 'package:konsultanku/widget/commentList.dart';
import 'package:konsultanku/pages/showpost.dart';

class Post {
  final String username;
  final String content;
  final String imageUrl;
  final String tag;
  bool isLiked;
  int likeCount;
  bool isCommenting;
  int commentCount;
  bool solved;

  Post({
    this.username = "",
    this.content = "",
    this.tag = "",
    this.imageUrl = "",
    this.isLiked = false,
    this.likeCount = 0,
    this.commentCount = 0,
    this.isCommenting = false,
    this.solved = false,
  });
}

class CommentPost {
  final String username;
  final String comment;
  final String imageUrl;
  final String whatsapp;
  bool solved;

  CommentPost({
    required this.username,
    required this.comment,
    required this.whatsapp,
    this.solved = false,
    this.imageUrl = "",
  });
}

final List<CommentPost> comments = [
  CommentPost(
      username: "Kenshi Yamaguchi",
      comment: "Saya tertarik dengan permasalahan yang di tawarkan oleh anda",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD1oYHOkWvRtUd65uGKIQPyMl2aFwBaP0d6g&usqp=CAU",
      whatsapp: "62895406803388",
      solved: false),
  CommentPost(
      username: "Minzi Yonezu",
      comment:
          "Saya ingin membantu permasalahan anda. boleh kolaborasi bersama ?",
      imageUrl:
          "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/01/09/1577281958.jpg",
      whatsapp: "6289687108506",
      solved: false),
];

class PostWidget extends StatefulWidget {
  final Post post;
  final CommentPost? comment;

  const PostWidget({Key? key, required this.post, this.comment})
      : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

// int commentCount = 0;

class _PostWidgetState extends State<PostWidget> {
  int commentCount = comments.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Stack(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Rectangle-30.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
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
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        if (widget.post.tag == 'keuangan' &&
                            widget.post.solved != true)
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
                                // backgroundColor: Colors.purple[200],
                                backgroundImage:
                                    NetworkImage(widget.post.imageUrl),
                              ),
                            ),
                            title: Text(widget.post.username),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 45, 52, 146),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text(
                                widget.post.tag,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white, // Warna teksnya
                                ),
                              ),
                            ),
                          ),
                        if (widget.post.tag == 'management' &&
                            widget.post.solved != true)
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
                                // backgroundColor: Colors.purple[200],
                                backgroundImage:
                                    NetworkImage(widget.post.imageUrl),
                              ),
                            ),
                            title: Text(widget.post.username),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 146, 45, 45),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text(
                                widget.post.tag,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white, // Warna teksnya
                                ),
                              ),
                            ),
                          ),
                        if (widget.post.tag == 'pemasaran' &&
                            widget.post.solved != true)
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
                                // backgroundColor: Colors.purple[200],
                                backgroundImage:
                                    NetworkImage(widget.post.imageUrl),
                              ),
                            ),
                            title: Text(widget.post.username),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 146, 99, 45),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text(
                                widget.post.tag,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white, // Warna teksnya
                                ),
                              ),
                            ),
                          ),
                        if (widget.post.solved != false)
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
                                // backgroundColor: Colors.purple[200],
                                backgroundImage:
                                    NetworkImage(widget.post.imageUrl),
                              ),
                            ),
                            title: Text(widget.post.username),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 66, 66, 66),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text(
                                "on progress task",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white, // Warna teksnya
                                ),
                              ),
                            ),
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
                                  color:
                                      widget.post.isLiked ? Colors.red : null,
                                ),
                              ),
                              Text(
                                  '${widget.post.likeCount} Suka'), // Text widget for 'Like'
                              if (widget.post.solved == false)
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.post.isCommenting =
                                          !widget.post.isCommenting;
                                    });
                                  },
                                  icon: Icon(Icons.comment),
                                ),
                              if (widget.post.solved == true)
                                IconButton(
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.comment),
                                ),
                              Text(
                                  '${commentCount} Komentar'), // Text widget for 'Comment'
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
                                onPressed: () {
                                  setState(() {
                                    // widget.post.commentCount += 1;
                                  });
                                },
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("komentar"),
                        ),
                        SizedBox(
                          height: 8,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: comments.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {},
                                  child: CommentListWidget(
                                    user: comments[index],
                                    post: widget.post,
                                  ));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
