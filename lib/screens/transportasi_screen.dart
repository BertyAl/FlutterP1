import 'package:flutter/material.dart';
import '../utils/colors.dart';

class TransportasiScreen extends StatefulWidget {
  const TransportasiScreen({super.key});

  @override
  _TransportasiScreenState createState() => _TransportasiScreenState();
}

class _TransportasiScreenState extends State<TransportasiScreen> {
  // Example pickup tram options
  final List<Map<String, String>> tramOptions = [
    {'type': 'Shuttle Bus', 'route': 'Main Hall - Rute A', 'time': '12:00',},
    {'type': 'Shuttle Bus', 'route': 'Main Hall - Rute B', 'time': '14:00',},
    {'type': 'Shuttle Bus', 'route': 'Main Hall - Rute C', 'time': '16:00',},
    {'type': 'Shuttle Bus', 'route': 'Main Hall - Rute D', 'time': '18:00',},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Operasi Shuttle Bus'),
        backgroundColor: main1,
      ),
      body: ListView.builder(
        itemCount: tramOptions.length,
        itemBuilder: (context, index) {
          final option = tramOptions[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.tram, color: main1), // Tram icon
              title: Text(option['type'] ?? ''),
              subtitle: Text(option['route'] ?? ''),
              trailing: Text(option['time']?? ''),
            ),
            color: upper1,
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
