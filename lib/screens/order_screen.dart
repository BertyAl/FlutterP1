import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project1/utils/colors.dart';
import 'payment_screen.dart'; // Import the payment screen
import 'ticket_screen.dart'; // Import your Article class

class OrderScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _removeTicketFromCart(BuildContext context, String docId) async {
    final User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).collection('cart').doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pesanan dikeluarkan dari keranjang')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pengguna belum masuk')));
    }
  }

  void _navigateToPaymentScreen(BuildContext context) async {
    final User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot cartSnapshot = await _firestore.collection('users').doc(user.uid).collection('cart').get();
      List<Article> cartItems = cartSnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Article(
          title: data['title'] ?? 'Unknown Title',
          imageUrl: data['imageUrl'] ?? '',
          author: data['author'] ?? 'Unknown Author',
          price: data['price'] ?? 0,
        );
      }).toList();

      // Calculate total amount
      int totalAmount = 0;
      for (var item in cartItems) {
        totalAmount += item.price;
      }

      // Navigate to payment screen with total amount
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PaymentScreen(totalAmount: totalAmount),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pengguna Belum masuk')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: main1,
          title: const Text('Pesanan'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Pengguna Belum Masuk'),
        ),
        backgroundColor: Colors.white,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: main1,
        title: const Text('Pesanan'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users').doc(user.uid).collection('cart').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No items in cart'));
          }

          final cartItems = snapshot.data!.docs;

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              final data = item.data() as Map<String, dynamic>;
              final article = Article(
                title: data['title'] ?? 'Unknown Title',
                imageUrl: data['imageUrl'] ?? '',
                author: data['author'] ?? 'Unknown Author',
                price: data['price'] ?? 0,
              );
              return ListTile(
                leading: Image.network(article.imageUrl),
                title: Text(article.title),
                subtitle: Text(article.author),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await _removeTicketFromCart(context, item.id); // Pass context here
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: main1,
        onPressed: () => _navigateToPaymentScreen(context),
        child: Icon(Icons.payment),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String author;
  final int price;

  Article({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
