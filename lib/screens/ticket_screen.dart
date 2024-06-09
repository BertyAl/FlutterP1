import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: main1,
          title: const Text('Ticket Screen'),
          centerTitle: true,
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
                  margin:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
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
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text("${item.author} ",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall),
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
                                  onPressed: () {
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: upper1,
                                  ),
                                  child: const Text("Buy"),
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


  Article(
      {required this.title,
        required this.imageUrl,
        required this.author,
        });
}

final List<Article> _articles = [
  Article(
    title: "Tiket Masuk (Tanpa Konser)",
    author: "Mulai Dari Rp 40.000",
    imageUrl: "https://cms.disway.id/uploads/0d7d6a0384367d29dd860127a74005b6.jpg",

  ),
  Article(
      title: "Bundling Tiket Masuk + Konser REGULER",
      imageUrl: "https://dewatiket.id/blog/wp-content/uploads/2023/06/Jadwal-Konser-Jakarta-Fair-2023-1068x601.jpg",
      author: "Mulai Dari Rp 80.000",

  ),
  Article(
    title: "Bundling Tiket Masuk + Konser VIP",
    author: "Mulai Dari Rp 100.000",
    imageUrl: "https://dewatiket.id/blog/wp-content/uploads/2023/06/Jadwal-Konser-Jakarta-Fair-2023-1068x601.jpg",

  ),
  Article(
    title: "Tiket Paket Terusan (VIP & REGULER)",
    author: "Mulai Dari Rp 450.000",
    imageUrl: "https://image.popmama.com/content-images/post/20230621/untitled-design-46png-9c5899f6a793427c9b78e61f123e678a.png?width=600&height=auto ",
  ),
];