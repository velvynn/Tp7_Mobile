import 'package:flutter/material.dart';
import 'package:pertemuan7/cart_model.dart';
import 'package:pertemuan7/cart_page.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  // Daftar produk beserta URL gambar dari internet
  final List<product> products = [
    product(
      'Minyak Goreng',
      'Minyak goreng tergoda',
      'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=150',
    ),
    product(
      'Terigu',
      'Terigu sepulih salju',
      'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=150',
    ),
    product(
      'Telur',
      'Telur dinosaurus',
      'https://images.unsplash.com/photo-1506976785307-8732e854ad03?w=150',
    ),
    product(
      'Gula',
      'Gula semanis kevin',
      'https://images.unsplash.com/photo-1581441363689-1f3c3c414635?w=150',
    ),
    product(
      'Kecap',
      'Kecap malika',
      'https://images.unsplash.com/photo-1598444146032-9223aaf1b945?w=150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Sembako'),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return Badge(
                  label: Text('${cart.totalItems}'),
                  isLabelVisible: cart.totalItems > 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            margin: const EdgeInsets.all(15),
            child: ListTile(
              // Menampilkan gambar dari internet
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.gambar,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 50);
                  },
                ),
              ),
              title: Text(item.nama),
              subtitle: Text(item.deskripsi),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).add(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item.nama} ditambahkan ke keranjang'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
              ),
            ),
          );
        },
      ),
    );
  }
}