import 'package:flutter/material.dart';
import 'package:konsultanku/pages/feedspage.dart';
import 'package:konsultanku/pages/viewfeeds.dart';

class ShowPost extends StatefulWidget {
  @override
  _ShowPostState createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  final List<Post> posts = [
    Post(
      username: 'User1',
      content: 'Post content 1',
      imageUrl: 'assets/images/image1.jpg',
    ),
    Post(
      username: 'User3',
      content: 'Post content 2',
      imageUrl: 'assets/images/image2.jpg',
    ),
    Post(
      username: 'User4',
      content: 'Post content 2',
      imageUrl: 'assets/images/image2.jpg',
    ),
    Post(
      username: 'User5',
      content: 'Post content 2',
      imageUrl: 'assets/images/image2.jpg',
    ),
    Post(
      username: 'User6',
      content: 'Post content 2',
      imageUrl: 'assets/images/image2.jpg',
    ),
    // Add more posts as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: SizedBox(
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(Icons.search_outlined),
                    filled: true,
                    hintText: "search category",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/Rectangle-30.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
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
                                child: FeedsWidget(
                                  post: posts[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit_outlined),
      ),
    );
  }
}
