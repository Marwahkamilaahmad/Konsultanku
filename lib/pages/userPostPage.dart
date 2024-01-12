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
      content: 'Halo semuanya, saya dari ALFAGA sedang mencari bantuan untuk membuat website produk kami. Saat ini, kami mengalami kendala karena kurangnya penguasaan teknologi. Kami percaya bahwa memiliki website dapat membantu memperluas jangkauan produk kami dan meningkatkan kehadiran online',
      imageUrl: "https://i.mydramalist.com/jV1Awf.jpg",
      tag: 'branding',
      solved: true,
    ),
    Post(
      username: 'You',
      content: 'Kami mencari saran, panduan, atau bantuan dari rekan-rekan UMKM yang memiliki pengalaman atau keahlian dalam Pemahaman dan penerapan teknologi dalam manajemen bisnis UMKM.Rekomendasi aplikasi atau platform yang dapat membantu dalam meningkatkan efisiensi operasional.Pelatihan atau sumber daya yang dapat membantu tim kami meningkatkan keterampilan teknologi',
      imageUrl: "https://i.mydramalist.com/jV1Awf.jpg",
      tag: 'management',
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
