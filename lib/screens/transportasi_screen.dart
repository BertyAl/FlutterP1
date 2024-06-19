import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TransportasiScreen extends StatefulWidget {
  const TransportasiScreen({super.key});

  @override
  _TransportasiScreenState createState() => _TransportasiScreenState();
}

class _TransportasiScreenState extends State<TransportasiScreen> {
  // Example transportation options
  final List<Map<String, String>> transportationOptions = [
    {'type': 'Transjakarta', 'route': 'Rute: Tangerang'},
    {'type': 'Kereta Api', 'route': 'Rute: Bogor'},
    {'type': 'Kereta Api', 'route': 'Rute: Bogor'},
    {'type': 'Kereta Api', 'route': 'Rute: Bogor'},
    {'type': 'Kereta Api', 'route': 'Rute: Bogor'},
    {'type': 'Taxi', 'route': 'Rute: Tanah Abang'},
    {'type': 'Taxi', 'route': 'Rute: Tanah Abang'},
    {'type': 'Taxi', 'route': 'Rute: Tanah Abang'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opsi Transportasi'),
        backgroundColor: main1,
      ),
      body: ListView.builder(
        itemCount: transportationOptions.length,
        itemBuilder: (context, index) {
          final option = transportationOptions[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.directions_bus), // You can change the icon based on transportation type
              title: Text(option['type'] ?? ''),
              subtitle: Text(option['route'] ?? ''),
            ),
            color: upper1,
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}


