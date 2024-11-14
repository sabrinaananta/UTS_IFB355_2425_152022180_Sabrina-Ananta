import 'package:flutter/material.dart';
import 'package:jamparing_aplikasi/models/product.dart';
import 'package:jamparing_aplikasi/pages/CheckoutPage.dart';
import 'package:intl/intl.dart'; // Tambahkan package intl

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  // Option states
  String selectedTemperature = 'Cold';
  String selectedSize = 'Regular';
  String selectedSugar = 'Normal Sugar';
  String selectedIce = 'Normal Ice';
  bool includeToppings = false;
  bool includeWhippedCream = false;
  String notes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.product.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.description,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Rp ${NumberFormat("#,##0", "id_ID").format(widget.product.price)}',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  // Menampilkan pilihan berdasarkan kategori produk
                  if (widget.product.category == 'Coffee' || widget.product.category == 'Non Coffee') ...[
                    const Text('Temperature'),
                    Column(
                      children: ['Cold', 'Hot'].map((temp) {
                        return RadioListTile<String>(
                          title: Text(temp),
                          value: temp,
                          groupValue: selectedTemperature,
                          onChanged: (value) {
                            setState(() {
                              selectedTemperature = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const Text('Size'),
                    Column(
                      children: ['Regular', 'Large'].map((size) {
                        return RadioListTile<String>(
                          title: Text(size),
                          value: size,
                          groupValue: selectedSize,
                          onChanged: (value) {
                            setState(() {
                              selectedSize = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const Text('Sugar Level'),
                    Column(
                      children: ['Normal Sugar', 'Less Sugar', 'No Sugar'].map((sugar) {
                        return RadioListTile<String>(
                          title: Text(sugar),
                          value: sugar,
                          groupValue: selectedSugar,
                          onChanged: (value) {
                            setState(() {
                              selectedSugar = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const Text('Ice Level'),
                    Column(
                      children: ['Normal Ice', 'Less Ice', 'No Ice'].map((ice) {
                        return RadioListTile<String>(
                          title: Text(ice),
                          value: ice,
                          groupValue: selectedIce,
                          onChanged: (value) {
                            setState(() {
                              selectedIce = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    const Text('Additional Options'),
                    CheckboxListTile(
                      title: const Text('Include Toppings'),
                      value: includeToppings,
                      onChanged: (bool? value) {
                        setState(() {
                          includeToppings = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Include Whipped Cream'),
                      value: includeWhippedCream,
                      onChanged: (bool? value) {
                        setState(() {
                          includeWhippedCream = value!;
                        });
                      },
                    ),
                  ]
                  else if (widget.product.category == 'Snack') ...[
                    const Text('Notes'),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          notes = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Add special instructions...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.black),
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(Icons.add_circle_outline, color: Colors.black),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // Warna coklat
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutPage(
                            productTitle: widget.product.title,
                            quantity: quantity,
                            totalPrice: widget.product.price * quantity,
                            productImage: widget.product.image,
                            selectedTemperature: selectedTemperature,
                            selectedSize: selectedSize,
                            selectedSugar: selectedSugar,
                            selectedIce: selectedIce,
                            includeToppings: includeToppings,
                            includeWhippedCream: includeWhippedCream,
                            notes: notes,
                            isSnack: widget.product.category == 'Snack', // Menambahkan parameter isSnack
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white), // Font warna putih
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
