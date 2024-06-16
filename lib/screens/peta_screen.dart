import 'package:flutter/material.dart';


class PetaScreen extends StatefulWidget {
  const PetaScreen({super.key});

  @override
  _PetaScreenState createState() => _PetaScreenState();
}

class _PetaScreenState extends State<PetaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('This is Peta Page!'),
      ),
    );
  }
}