import 'package:flutter/material.dart';
import 'package:jamparing_aplikasi/models/product.dart';
import 'package:jamparing_aplikasi/models/product_data.dart';
import 'package:jamparing_aplikasi/pages/ProductDetailPage.dart';
import 'package:intl/intl.dart';  // Importing intl package

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // Variabel untuk menyimpan kategori yang sedang dipilih
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Categories buttons
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Coffee button
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Coffee';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Coffee',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                // Non-Coffee button
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 150,
                    minHeight: 50,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Non-Coffee';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Non-Coffee',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                // Snacks button
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Snacks';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Snacks',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Product list based on selected category
            Expanded(
              child: ListView(
                children: [
                  if (selectedCategory == 'All' || selectedCategory == 'Coffee')
                    ...[
                      const Text(
                        'COFFEE',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ...products
                          .where((product) => product.category == 'Coffee')
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    ],
                  if (selectedCategory == 'All' || selectedCategory == 'Non-Coffee')
                    ...[
                      const SizedBox(height: 20),
                      const Text(
                        'NON-COFFEE',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ...products
                          .where((product) => product.category == 'Non Coffee')
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    ],
                  if (selectedCategory == 'All' || selectedCategory == 'Snacks')
                    ...[
                      const SizedBox(height: 20),
                      const Text(
                        'SNACKS',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ...products
                          .where((product) => product.category == 'Snack')
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp ${NumberFormat("#,##0", "id_ID").format(product.price)}',  // Indonesian Rupiah format
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
