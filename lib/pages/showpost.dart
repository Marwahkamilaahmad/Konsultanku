import 'dart:html';

import 'package:flutter/material.dart';
import 'package:konsultanku/pages/createPost.dart';
import 'package:konsultanku/pages/feedspage.dart';
import 'package:konsultanku/pages/showGroup.dart';
import 'package:konsultanku/pages/viewfeeds.dart';

class ShowPost extends StatefulWidget {
  @override
  _ShowPostState createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  final List<Post> posts = [
    Post(
      username: 'Aldini Mukti',
      content:
          'Halo semuanya, saya dari ALFAGA sedang mencari bantuan untuk membuat website produk kami. Saat ini, kami mengalami kendala karena kurangnya penguasaan teknologi. Kami percaya bahwa memiliki website dapat membantu memperluas jangkauan produk kami dan meningkatkan kehadiran online',
      imageUrl: "https://i.mydramalist.com/jV1Awf.jpg",
      tag: 'pemasaran',
      likeCount: 45,
      solved: false,
    ),
    Post(
      username: 'Jia Chou',
      content:
          'Kami mencari saran, panduan, atau bantuan dari rekan-rekan UMKM yang memiliki pengalaman atau keahlian dalam Pemahaman dan penerapan teknologi dalam manajemen bisnis UMKM.Rekomendasi aplikasi atau platform yang dapat membantu dalam meningkatkan efisiensi operasional.Pelatihan atau sumber daya yang dapat membantu tim kami meningkatkan keterampilan teknologi',
      imageUrl:
          "https://images.soco.id/374-c7b20894fbc6b8fc71b49fd3541e67e7.jpg.jpeg",
      tag: 'management',
      likeCount: 23,
    ),
    Post(
      username: 'User4',
      content: 'Post content 2',
      imageUrl: 'assets/images/image2.jpg',
      tag: 'pemasaran',
    ),
    Post(
      username: 'User5',
      content: 'Post content 2',
      imageUrl: 'assets/images/image2.jpg',
      tag: 'branding',
    ),
    Post(
      username: 'User6',
      content: 'Post content 2',
      imageUrl: 'assets/images/image2.jpg',
      tag: 'management',
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
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
                        HorizontalGroupList(),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePost()),
          );
        },
        child: Icon(Icons.edit_outlined),
      ),
    );
  }
}
