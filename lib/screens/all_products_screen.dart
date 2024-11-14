import 'package:flutter/material.dart';
import 'package:jamparing_aplikasi/models/product_model.dart'; // Pastikan untuk mengimpor file yang berisi kelas Product dan daftar produk

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.image, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(product.title),
            subtitle: Text("Rp${product.price}"),
          );
        },
      ),
    );
  }
}
