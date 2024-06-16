import 'package:flutter/material.dart';


class TransportasiScreen extends StatefulWidget {
  const TransportasiScreen({super.key});

  @override
  _TransportasiScreenState createState() => _TransportasiScreenState();
}

class _TransportasiScreenState extends State<TransportasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('This is Transportasi Page!'),
      ),
    );
  }
}