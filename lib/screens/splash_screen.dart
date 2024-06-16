import 'package:flutter/material.dart';
import 'package:flutter_project1/screens/login_screen.dart';
import 'package:flutter_project1/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Duration for the splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to your main screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: upper1, // Customize the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 250, width: 250), // Your logo image
            SizedBox(height: 20),
            CircularProgressIndicator(), // Optional loading indicator
          ],
        ),
      ),
    );
  }
}
