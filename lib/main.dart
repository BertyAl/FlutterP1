import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';
import 'package:flutter_project1/homepage.dart';  // Make sure the path is correct
import 'package:flutter_project1/responsive/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),// You can use your custom color
        canvasColor: Colors.white,
      ),
      home: SimpleBottomNavigation(),
    );
  }
}