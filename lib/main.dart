import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/responsive/navbar.dart';
import 'package:flutter_project1/screens/splash_screen.dart';
import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: SplashScreen(),
    );
  }
}