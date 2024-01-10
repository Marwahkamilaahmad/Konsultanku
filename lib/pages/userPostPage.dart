import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';
import 'package:konsultanku/pages/viewfeeds.dart';

class UserPost extends StatefulWidget {

  @override
  _UserPostState createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
   final List<Post> posts = [
    Post(
      username: 'You',
      content: 'Post content 1',
      imageUrl: 'assets/images/image1.jpg',
      tag: 'management',
      solved: true,
    ),
    Post(
      username: 'You',
      content: 'Post content 2',
      imageUrl: 'assets/images/image2.jpg',
      tag: 'branding',
    ),];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostWidget(
                        post: posts[index],
                      ),
                    ),
                  );
                },
                child: FeedsWidget(post: posts[index]),
              );
            },
            
          ),
        ),
      ],
    );
  }
}
