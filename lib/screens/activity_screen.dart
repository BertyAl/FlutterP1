import 'package:flutter/material.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan'),
        backgroundColor: Color(0xFFCDC6AE),
      ),
      body: ActivitiesList(),
    );
  }
}

class ActivitiesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8000,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ActivityItem(
            imagePath: 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//88/MTA-2901092/sosro_sosro-teh-botol-original-minuman-teh--450-ml-_full02.jpg',
            title: 'tukarkan botol mu',
            description: 'penguna dapat menukarkan botol kosongnya dengan satu teh botol 600ml',
          ),
          ActivityItem(
            imagePath: 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/3/1/a23bd3b4-a52b-466d-9167-344d1a7b9b57.jpg',
            title: 'mencari botol emas',
            description: 'temukan botol spesial yang terdapat di area kuliner sosro',
          ),
          ActivityItem(
            imagePath: 'https://image.made-in-china.com/202f0j00LPAqenGslEoj/Bamboo-Thermos-Cup-Double-Layer-Inner-Stainless-Steel-304-Insulated-Bottle-Tumbler-Vacuum-Flask-Thermal-Coffee-Tea-Mug.webp',
            title: 'yang terbaik atau tidak sama sekali',
            description: 'Didapatkan dari mengumpulkan lima botol spesial dan melakukan draw',
          ),
        ],
      ),
    );
  }
}

class ActivityItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;

  const ActivityItem({
    required this.imagePath,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  _ActivityItemState createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  bool redeemed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(widget.title),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Image.network(widget.imagePath,
                            width: 100, height: 100, fit: BoxFit.cover),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                widget.description.length > 100
                                    ? '${widget.description.substring(0, 100)}...'
                                    : widget.description,
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: redeemed
                  ? [
                      TextButton(
                        child: Text('Item telah ditukarkan'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ]
                  : [
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('tukar hadiah'),
                        onPressed: () {
                          setState(() {
                            redeemed = true;
                          });
                          Navigator.of(context).pop(); // Automatically close the dialog
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('berhasil melakukan penukaran!'),
                            ),
                          );
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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.imagePath,
                    width: 100, height: 100, fit: BoxFit.cover),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.description.length > 100
                            ? '${widget.description.substring(0, 100)}...'
                            : widget.description,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
