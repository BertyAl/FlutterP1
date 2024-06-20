import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_project1/utils/colors.dart';
import 'package:flutter_project1/screens/register_screen.dart';
import 'package:flutter_project1/screens/ticket_screen.dart';
import 'package:flutter_project1/screens/parking_screen.dart';
import 'package:flutter_project1/screens/transportasi_screen.dart';
import 'package:flutter_project1/screens/kupon_screen.dart';
import 'package:flutter_project1/screens/konser_screen.dart';
import 'package:flutter_project1/screens/peta_screen.dart';

class Homepages extends StatefulWidget {
  const Homepages({Key? key}) : super(key: key);

  @override
  _HomepagesState createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  late PageController _pageController;
  late Timer _timer;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        if (nextPage >= 3) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: main1,
          title: const Text('Halaman Utama'),
          leading: isLargeScreen
              ? null
              : IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: _ProfileIcon(),
              ),
            )
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              Container(
                height: 250,
                child: PageView(
                  controller: _pageController,
                  children: [
                    BannerItem(
                        'https://mmc.tirto.id/image/otf/640x0/2024/06/04/jakarta-fair-2024_ratio-16x9.jpg'),
                    BannerItem(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDFgBQRbyyFo5TzVcq-IBcWsWYAq9tzJaNAA&s'),
                    BannerItem(
                        'https://mmc.tirto.id/image/2024/04/03/jakarta-lebaran-fair-2024_ratio-16x9.jpg'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              CategoryList(),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              CategoryList1(),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              NewsList(), // Add the NewsList widget here
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _drawer() => Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: _menuItems
              .map(
                (item) => ListTile(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  title: Text(item),
                ),
              )
              .toList(),
        ),
      );
}

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];

enum Menu { itemOne, itemTwo, itemThree }

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      color: Colors.white,
      icon: const Icon(Icons.person),
      offset: const Offset(0, 40),
      onSelected: (Menu item) {
        switch (item) {
          case Menu.itemOne:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
            );
            break;
          case Menu.itemTwo:
            break;
          case Menu.itemThree:
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        const PopupMenuItem<Menu>(
          value: Menu.itemOne,
          child: Text('Login'),
        ),
      ],
    );
  }
}

class BannerItem extends StatelessWidget {
  final String imagePath;

  BannerItem(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Image.network(imagePath, fit: BoxFit.cover);
  }
}

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(
              'https://img.freepik.com/free-photo/old-used-brown-torn-ticket-stub-isolated_1101-3193.jpg?size=626&ext=jpg&ga=GA1.1.1395880969.1709769600&semt=ais',
              'Tiket'),
          CategoryItem(
              'https://asset.kompas.com/crops/4fVsd9xuwtYOuZQT1cw5ICawJog=/0x26:1000x693/750x500/data/photo/2017/12/20/3512715862.jpg',
              'Parkir'),
          CategoryItem(
              'https://c.alfagift.id/product/1/1_A12790040900_20240314131805179_base.jpg',
              'Kupon'),
        ],
      ),
    );
  }
}

class CategoryList1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(
              'https://www.langqing-ev.com/ImageHandler/0-0/UploadFiles/Images/electric-shuttle-bus-lqy140a.jpg',
              'Transportasi'),
          CategoryItem(
              'https://awsimages.detik.net.id/community/media/visual/2023/08/25/the-sounds-project_43.jpeg?w=700&q=90',
              'Konser'),
          CategoryItem(
              'https://i.ytimg.com/vi/nOjaWXRT5rA/maxresdefault.jpg', 'Peta'),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;

  CategoryItem(this.imagePath, this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Tiket':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TicketScreen()),
            );
            break;
          case 'Parkir':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ParkingScreen()),
            );
            break;
          case 'Kupon':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KuponScreen()),
            );
            break;
          case 'Transportasi':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransportasiScreen()),
            );
            break;
          case 'Konser':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KonserScreen()),
            );
            break;
          case 'Peta':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetaScreen()),
            );
            break;
          default:
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(imagePath, width: 110, height: 110),
            Material(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: upper1, // Change color as needed
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 15.0,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, 
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          NewsItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7S-wp1Nz4idIunu4SiPZXX86vub4rzblKAw&s',
              'League back to school',
              'Jakarta - Produsen sepatu kenamaan Indonesia, League, menawarkan promo Super Spesial  di ajang Jakarta Fair Kemayoran 2023. League memberikan diskon 50 persen untuk seluruh koleksi BACK TO SCHOOL dan ekstra diskon 15 persen.'),
          NewsItem(
              'https://eventguide.id/wp-content/uploads/2024/06/CSR1-1024x511.jpeg',
              'CSR jakartafair',
              'Dalam program CSR peduli anak, Jakarta Fair Kemayoran akan merangkul beberapa panti asuhan yang berbeda untuk menyelenggarakan kegiatan penuh interaksi yang menarik dengan anak-anak panti. Yang lebih istimewa, JFK juga akan melibatkan panti asuhan khusus untuk anak-anak difabel dalam program ini.Setelahnya, Jakarta Fair Kemayoran memiliki agenda rutin yang bekerja sama langsung dengan Palang Merah Indonesia (PMI), yakni kegiatan donor darah. Menyambut tahun ketujuhnya, program donor darah telah menjadi unggulan dalam CSR yang dinantikan oleh pengunjung JFK serta masyarakat sekitar.'),
          NewsItem(
              'https://jiexpo-bucket-1.s3.ap-southeast-3.amazonaws.com/img/staticpages/qzvnM18RghUkzQ7Fs1ou7oNcY6YCd5vMBTvhgTA0.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAW3MD6OHSJ7CO7SGB%2F20240620%2Fap-southeast-3%2Fs3%2Faws4_request&X-Amz-Date=20240620T150004Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Signature=94c52e0e841e32fb941c13644f5916e44038a4f2b81942c377cdbb3766775f9c',
              'semarak warna warni',
              'Parade karnaval di Jakarta Fair sudah menjadi salah satu atraksi yang ditunggu-tunggu oleh para pengunjung JFK setiap tahunnya. Tahun ini pun Semarak Warna Warni Karnaval akan diselenggarakan sebanyak tujuh kali selama berlangsungnya Jakarta Fair Kemayoran pada 12 Juni - 14 Juli 2024.'),
        ],
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  NewsItem(this.imagePath, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: SingleChildScrollView( // Ensures content is scrollable if it overflows
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(imagePath, fit: BoxFit.cover),
                    SizedBox(height: 15),
                    Text(description),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          child: Column(
            children: [
              Image.network(imagePath,
                  width: double.infinity, height: 150, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description.length > 100
                      ? '${description.substring(0, 100)}...'
                      : description,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}