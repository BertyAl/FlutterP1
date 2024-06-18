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
      'date': '2024-07-01',
      'location': 'Stadium A',
      'artists': ['Artist 1', 'Artist 2', 'Artist 3']
    },
    {
      'title': 'Concert 2',
      'date': '2024-07-15',
      'location': 'Arena B',
      'artists': ['Artist 4', 'Artist 5']
    },
    {
      'title': 'Concert 3',
      'date': '2024-08-01',
      'location': 'Concert Hall C',
      'artists': ['Artist 6', 'Artist 7', 'Artist 8', 'Artist 9']
    },
    {
      'title': 'Concert 4',
      'date': '2024-08-20',
      'location': 'Open Air D',
      'artists': ['Artist 10', 'Artist 11']
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
