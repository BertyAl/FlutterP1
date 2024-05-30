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
        centerTitle: true ,
      ),

        body: const Center(
          child: Text(
            'Hello, this is your ticket!',
            style: TextStyle(fontSize: 24),
          ),
      ),
        backgroundColor: Colors.white,
      ),
    );
  }
}