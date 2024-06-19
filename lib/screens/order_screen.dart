import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';
import 'package:flutter_project1/responsive/navbar.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}
class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
final List<Product> products = [
  Product(name: 'Tiket Masuk (Tanpa Konser)', price: 40.000, imageUrl: 'https://awsimages.detik.net.id/visual/2023/06/15/pengunjung-memadati-jakarta-fair-kemayoran-jfk-2023-di-jiexpo-kemayoran-jakarta-rabu-1462023-cnbc-indonesiafaisal-rahman-4_169.jpeg?w=650'),
  Product(name: 'Tiket Masuk + Konser REGULER', price: 80.000, imageUrl: 'https://dewatiket.id/blog/wp-content/uploads/2023/06/Jadwal-Konser-Jakarta-Fair-2023-1068x601.jpg'),
  Product(name: 'Tiket Masuk + Konser VIP', price: 100.000, imageUrl: 'https://dewatiket.id/blog/wp-content/uploads/2023/06/Jadwal-Konser-Jakarta-Fair-2023-1068x601.jpg'),
  Product(name: 'Tiket VIP + REGULER', price: 450.000, imageUrl: 'https://image.popmama.com/content-images/post/20230621/untitled-design-46png-9c5899f6a793427c9b78e61f123e678a.png?width=600&height=auto'),
];

class ProductList extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onAddToCart;

  ProductList({required this.products, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: Image.network(product.imageUrl),
          title: Text(product.name),
          subtitle: Text('\Rp.${product.price.toString()}00'),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: upper1,
            ),
            onPressed: () => onAddToCart(product),

            child: Text('Pesan'),

          ),
        );
      },
    );
  }
}

class _OrderScreenState extends State<OrderScreen> {
  List<Product> cart = [];

  void _addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleBottomNavigation()), // Ensure HomePage is imported
      );
      return false;
    },
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: main1,
        title: Text('Pesanan'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ProductList(
        products: products,
        onAddToCart: _addToCart,
      ),
      backgroundColor: Colors.white,
    ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main1,
        title: Text('Keranjang'),
        actions: [
          IconButton(
            icon: Icon(Icons.payment),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CartPage(cart: cart),
              //   ),
              // );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            leading: Image.network(product.imageUrl),
            title: Text(product.name),
            subtitle: Text('\Rp.${product.price.toString()}00'),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}