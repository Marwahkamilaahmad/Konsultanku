import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:konsultanku/pages/feedspage.dart';

class FeedsWidget extends StatefulWidget {
  final Post post;

  const FeedsWidget({Key? key, required this.post}) : super(key: key);

  @override
  _FeedsWidgetState createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  int commentCount = comments.length;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
        side: BorderSide(
          color:
              Colors.transparent, // Set the color of the border
          width: 1.0, // Set the width of the border
        ),
      ),
      shadowColor: Colors.blue,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          if (widget.post.tag == 'keuangan' && widget.post.solved != true)
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
                  backgroundImage: NetworkImage(widget.post.imageUrl),
                ),
              ),
              title: Text(widget.post.username),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          if (widget.post.tag == 'management' && widget.post.solved != true)
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
                  backgroundImage: NetworkImage(widget.post.imageUrl),
                ),
              ),
              title: Text(widget.post.username),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          if (widget.post.tag == 'pemasaran' && widget.post.solved != true)
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
                  backgroundImage: NetworkImage(widget.post.imageUrl),
                ),
              ),
              title: Text(widget.post.username),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  backgroundImage: NetworkImage(widget.post.imageUrl),
                ),
              ),
              title: Text(widget.post.username),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                Text('${commentCount} Komentar'), // Text widget for 'Comment'
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
