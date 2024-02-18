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
          "Sejak usaha berdiri saya memperoleh penjualan yang tergolong masih rendah dibandingkan kompetitor saya. Penjualan yang rendah ini disebabkan karena rendahnya kemampuan pemasaran yang usaha kami miliki dan lemahnya pengelolaan media sosial. Selain itu, kesulitan lain adalah di bidang produksi dimana saya kesulitan memperoleh bahan baku yang konsisten dengan yang saya beli sebelumnya. Hal ini menjadi tantangan karena baik pelanggan lama maupun pelanggan baru cenderung mencari produk yang sudah terjual di masa lalu karena suka dengan model dan material yang dibuat (pelanggan lama biasanya mendapatkan rekomendasi dengan word of mouth strategy). Masalahnya adalah saya kesulitan untuk menemukan material dan bahan baku yang sudah habis ke supplier",
      imageUrl: "https://i.mydramalist.com/jV1Awf.jpg",
      tag: 'pemasaran',
      likeCount: 45,
      solved: false,
    ),
    Post(
      username: 'Jia Chou',
      content:
          "Dalam 2 tahun terakhir, penjualan saya (penjual soto ayam) terus mengalami peningkatan. Meskipun saya hanya bermodalkan gerobak, mayoritas pelanggan menyebutkan bahwa mereka menyukai soto yang saya jual karena terasa seperti masakan rumahan. Beberapa hari terakhir, anak saya mendorong saya untuk membuka outlet baru. Namun, ada beberapa keterbatasan yang menjadi concern saya:\n"
          "1. Bagaimana control quality nya agar menghasilkan soto ayam dan layanan yang konsisten?\n"
          "2. Apakah saya perlu menyewa ruko dan memperkuat branding bisnis ini dengan kehigienisannya atau tetap mempertahankan penggunaan gerobak dan pelanggan makan dengan duduk lesehan saja? Bagaimana cost benefit analysis nya dan mana yang paling profitable? Menaikkan harga karena ada penambahan biaya tetapi ada peningkatan citra brand atau tetap dengan model lama saja?",
      imageUrl:
          "https://images.soco.id/374-c7b20894fbc6b8fc71b49fd3541e67e7.jpg.jpeg",
      tag: 'management',
      likeCount: 23,
    ),
    Post(
      username: 'User4',
      content:
          "Saat ini, di industri teksil, pasar ini sangat terfragmentasi dan highly competitive (dampak: harga sangat murah dan pelaku umkm tidak bisa mengikuti penurunan harga karena apabila harga diturunkan, mereka tidak memperoleh profit atau mungkin dapat dengan jumlah yang tidak menguntungkan). Contoh pertanyaan case:\n"
          "1. Apakah melayani industri ini masih menguntungkan atau tidak? Apabila iya, apa langkah yang seharusnya diambil? Apakah melayani pada segmen khusus dan terdiferensiasi (market focus strategy) akan efektif?\n"
          "2. Bagaimana strategi untuk menurunkan cost agar dapat menyesuaikan penurunan harga yang ada di pasar?",
      imageUrl: 'assets/images/image2.jpg',
      tag: 'keuangan',
    ),
    Post(
      username: 'User5',
      content: "saya ingin bisa menjalankan usaha dengan laporan keuangan yang baik dan tertata rapi sehingga lebih mudah dari segi managemnet dan lebih terang",
      imageUrl: 'assets/images/image2.jpg',
      tag: 'keuangan',
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
                        SizedBox(
                          height: 6,
                        ),

                        // student ------------------------------------------------------

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: HorizontalGroupList(),
                        ),


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
        backgroundColor: Color.fromARGB(255, 231, 225, 255),
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
