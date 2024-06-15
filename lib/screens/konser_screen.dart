import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';


class KonserScreen extends StatefulWidget {
  const KonserScreen({super.key});

  @override
  _KonserScreenState createState() => _KonserScreenState();
}

class _KonserScreenState extends State<KonserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('This is Konser Page!'),
      ),
    );
  }
}