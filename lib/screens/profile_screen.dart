import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: main1,
          title: const Text('Profile Screen'),
          centerTitle: true ,
        ),

        body: const Center(
          child: Text(
            'Hello, Profile!',
            style: TextStyle(fontSize: 24),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}