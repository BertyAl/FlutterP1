import 'package:flutter/material.dart';

import '../utils/colors.dart';

class KonserScreen extends StatefulWidget {
  const KonserScreen({super.key});

  @override
  _KonserScreenState createState() => _KonserScreenState();
}

class _KonserScreenState extends State<KonserScreen> {
  // Example concert data
  final List<Map<String, dynamic>> concerts = [
    {
      'title': 'Concert 1',
      'date': '2024-06-19',
      'location': 'Rabu',
      'artists': ['Fiersa Besari', 'Rachun']
    },
    {
      'title': 'Concert 2',
      'date': '2024-06-20',
      'location': 'Kamis',
      'artists': ['Gildcoustic', 'MR.jono joni']
    },
    {
      'title': 'Concert 3',
      'date': '2024-06-21',
      'location': 'Jumat',
      'artists': ['The Adams', 'The Sigit', 'The Upstairs']
    },
    {
      'title': 'Concert 4',
      'date': '2024-06-22',
      'location': 'Sabtu',
      'artists': ['Fourtwnty', 'Enau','2/15 Band']
    },
    {
      'title': 'Concert 5',
      'date': '2024-06-23',
      'location': 'Minggu',
      'artists': ['Tipe-X', 'Monkey Boots','Feel High']
    },
    {
      'title': 'Concert 6',
      'date': '2024-06-24',
      'location': 'Senin',
      'artists': ['OOM LEO Berkaraoke ft Ari Lesmana']
    },
    {
      'title': 'Concert 7',
      'date': '2024-06-25',
      'location': 'Selasa',
      'artists': ['Weird Genius', 'Hura Hura Club','Anisya']
    },
    {
      'title': 'Concert 8',
      'date': '2024-06-26',
      'location': 'Rabu',
      'artists': ['Pamungkas', 'The Rain','League Anniversary']
    },
    {
      'title': 'Concert 9',
      'date': '2024-06-27',
      'location': 'Kamis',
      'artists': ['Maliq D Essentials', 'Roots Weiler']
    },
    {
      'title': 'Concert 10',
      'date': '2024-06-28',
      'location': 'Jumat',
      'artists': ['Raisa', 'Mahardias','MVVL']
    },
    {
      'title': 'Concert 11',
      'date': '2024-06-29',
      'location': 'Sabtu',
      'artists': ['NDX AKA', 'Close to Breath']
    },
    {
      'title': 'Concert 12',
      'date': '2024-06-30',
      'location': 'Minggu',
      'artists': ['Slank', 'Respect','The Tambel']
    },
  ];

  void _buyTicket(String concertTitle) {
    // Logic for buying ticket
    // For now, we'll just show a simple dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Buy Ticket'),
          content: Text('You have selected $concertTitle.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konser'),
        backgroundColor: main1,
      ),
      body: ListView.builder(
        itemCount: concerts.length,
        itemBuilder: (context, index) {
          final concert = concerts[index];
          return Card(
            color: upper1,
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    concert['title'] ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('${concert['date'] ?? ''} - ${concert['location'] ?? ''}'),
                  SizedBox(height: 10),
                  Text(
                    'Artists:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  ...concert['artists'].map<Widget>((artist) => Text(artist)).toList(),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _buyTicket(concert['title'] ?? ''),
                    child: Text('Buy Ticket',
                      style: TextStyle(
                      color: Colors.black
                    ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lower1,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
