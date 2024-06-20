import 'package:flutter/material.dart';
import 'package:flutter_project1/responsive/navbar.dart';
import 'package:flutter_project1/utils/colors.dart';

class PaymentScreen extends StatelessWidget {
  final int totalAmount;

  const PaymentScreen({Key? key, required this.totalAmount}) : super(key: key);

  void _processPayment(BuildContext context) {
    // Implement your payment processing logic here
    // This is where you would integrate with a payment gateway or service
    // For demonstration, we will just show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Payment Confirmation'),
          content: const Text('Payment Successful!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SimpleBottomNavigation()),
                      (route) => false,
                );
              },
              child: const Text('OK', style: TextStyle(color:Colors.black),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main1,
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Total Amount:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '\Rp. ${totalAmount.toStringAsFixed(3)}', // Display total amount
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () => _processPayment(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: upper1,
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              ),
              child: const Text(
                'Pay Now',
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
