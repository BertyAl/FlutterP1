import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';


class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});

  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('This is Parking Page!'),
      ),
    );
  }
}