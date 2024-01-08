import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedsWidget extends StatefulWidget {
  final Post post;

  const FeedsWidget({Key? key, required this.post}) : super(key: key);

  @override
  _FeedsWidgetState createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
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
      shadowColor: Colors.grey,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
          Divider(color: Colors.grey),
          if (widget.post.imageUrl.isNotEmpty)
            // Image.network(
            //   widget.post.imageUrl,
            //   fit: BoxFit.fill,
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
                Text('${widget.post.likeCount} Suka'), // Text widget for 'Like'
                IconButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PostWidget(post: posts),))
                  },
                  icon: Icon(Icons.comment),
                ),
                Text(
                    '${widget.post.commentCount} Komentar'), // Text widget for 'Comment'
              ],
            ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
