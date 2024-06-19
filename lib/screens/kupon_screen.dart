import 'package:flutter/material.dart';

import '../utils/colors.dart';

class KuponScreen extends StatefulWidget {
  const KuponScreen({super.key});

  @override
  _KuponScreenState createState() => _KuponScreenState();
}

class _KuponScreenState extends State<KuponScreen> {
  final TextEditingController _controller = TextEditingController();
  String _rewardMessage = '';

  void _checkVoucher() {
    setState(() {
      if (_controller.text == 'FLUTTER') {
        _rewardMessage = 'Congratulations! You got a 50% discount!';
      } else {
        _rewardMessage = 'Invalid voucher code. Please try again.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher'),
        backgroundColor: main1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Masukkan Kode Redeem Voucher",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter voucher code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkVoucher,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: upper1,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _rewardMessage,
              style: TextStyle(
                color: _rewardMessage.contains('Congratulations')
                    ? Colors.green
                    : Colors.red,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

