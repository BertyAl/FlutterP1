import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';


class KuponScreen extends StatefulWidget {
  const KuponScreen({super.key});

  @override
  _KuponScreenState createState() => _KuponScreenState();
}

class _KuponScreenState extends State<KuponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('This is kupon Page!'),
      ),
    );
  }
}