import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan Privasi'),
        backgroundColor: main1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kebijakan Privasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Informasi yang kami kumpulkan:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- Nama dan informasi kontak.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Informasi tentang penggunaan aplikasi.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Penggunaan informasi:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Informasi yang kami kumpulkan digunakan untuk...',
              textAlign: TextAlign.justify,
            ),
            Text(
              'Kami tidak akan membagikan informasi pribadi Anda kepada pihak ketiga tanpa izin Anda.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
