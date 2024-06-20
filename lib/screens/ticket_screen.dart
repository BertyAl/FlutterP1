import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project1/utils/colors.dart';
import 'order_screen.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _addTicketToCart(Article article) async {
    final User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).collection('cart').add(article.toMap());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ticket added to cart')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not signed in')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: main1,
          title: const Text('Opsi Tiket'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderScreen()),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _articles[index];
                return Container(
                  height: 155,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text("${item.author} ", style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...[
                                  Icons.bookmark_border_rounded,
                                  Icons.share,
                                ].map((e) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Icon(e, size: 16),
                                    ),
                                  );
                                }).toList(),
                                TextButton(
                                  onPressed: () async {
                                    await _addTicketToCart(item);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: upper1,
                                  ),
                                  child: const Text("Beli"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.imageUrl),
                            )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String author;
  final int price;

  Article({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}

final List<Article> _articles = [
  Article(
    title: "Tiket Masuk (Tanpa Konser)",
    author: "Mulai Dari Rp 40.000",
    imageUrl: "https://awsimages.detik.net.id/visual/2023/06/15/pengunjung-memadati-jakarta-fair-kemayoran-jfk-2023-di-jiexpo-kemayoran-jakarta-rabu-1462023-cnbc-indonesiafaisal-rahman-4_169.jpeg?w=650",
    price: 40,
  ),
  Article(
    title: "Bundling Tiket Masuk + Konser REGULER",
    imageUrl: "https://dewatiket.id/blog/wp-content/uploads/2023/06/Jadwal-Konser-Jakarta-Fair-2023-1068x601.jpg",
    author: "Mulai Dari Rp 80.000",
    price: 80,
  ),
  Article(
    title: "Bundling Tiket Masuk + Konser VIP",
    author: "Mulai Dari Rp 100.000",
    imageUrl: "https://dewatiket.id/blog/wp-content/uploads/2023/06/Jadwal-Konser-Jakarta-Fair-2023-1068x601.jpg",
    price: 100,
  ),
  Article(
    title: "Tiket Paket Terusan (VIP & REGULER)",
    author: "Mulai Dari Rp 450.000",
    imageUrl: "https://image.popmama.com/content-images/post/20230621/untitled-design-46png-9c5899f6a793427c9b78e61f123e678a.png?width=600&height=auto ",
    price: 450,
  ),
];
