import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home.dart';

class CheckoutPage extends StatelessWidget {
  final String productTitle;
  final int quantity;
  final double totalPrice;
  final String productImage;
  final String selectedTemperature;
  final String selectedSize;
  final String selectedSugar;
  final String selectedIce;
  final bool includeToppings;
  final bool includeWhippedCream;
  final String notes;
  final bool isSnack; // Menambahkan parameter isSnack untuk menentukan jenis produk

  const CheckoutPage({
    super.key,
    required this.productTitle,
    required this.quantity,
    required this.totalPrice,
    required this.productImage,
    required this.selectedTemperature,
    required this.selectedSize,
    required this.selectedSugar,
    required this.selectedIce,
    required this.includeToppings,
    required this.includeWhippedCream,
    required this.notes,
    required this.isSnack, // Menambahkan parameter isSnack
  });

  @override
  Widget build(BuildContext context) {
    double shippingFee = 3.25;
    double tax = 5.91;
    double finalTotal = totalPrice + shippingFee + tax;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            // Cart items
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem(
                    productTitle,
                    totalPrice,
                    quantity,
                    productImage,
                    selectedTemperature,
                    selectedSize,
                    selectedSugar,
                    selectedIce,
                    includeToppings,
                    includeWhippedCream,
                    notes,
                    isSnack, // Menambahkan parameter isSnack
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Price summary
            _buildSummarySection(totalPrice, shippingFee, tax, finalTotal),
            const SizedBox(height: 16),
            // Checkout button with style changes
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Tombol berwarna coklat
                  foregroundColor: Colors.white, // Font berwarna putih
                  padding: const EdgeInsets.symmetric(vertical: 14), // Menambah padding agar lebih besar
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Tombol dengan sudut melengkung
                  ),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600), // Ukuran font lebih besar dan bold
                ),
                onPressed: () {
                  _showSuccessDialog(context, finalTotal);
                },
                child: const Text('Process to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
    String productTitle,
    double totalPrice,
    int quantity,
    String productImage,
    String selectedTemperature,
    String selectedSize,
    String selectedSugar,
    String selectedIce,
    bool includeToppings,
    bool includeWhippedCream,
    String notes,
    bool isSnack, // Menambahkan parameter isSnack
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(productImage, width: 80, height: 80),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Quantity: $quantity'),
                  if (!isSnack) ...[
                    Text('Temperature: $selectedTemperature'),
                    Text('Size: $selectedSize'),
                    Text('Sugar: $selectedSugar'),
                    Text('Ice: $selectedIce'),
                  ],
                  if (includeToppings) const Text('Includes Toppings'),
                  if (includeWhippedCream) const Text('Includes Whipped Cream'),
                  if (notes.isNotEmpty) Text('Notes: $notes'),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Rp ${NumberFormat("#,##0", "id_ID").format(totalPrice)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection(double totalPrice, double shippingFee, double tax, double finalTotal) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Order Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildSummaryRow('Subtotal', totalPrice),
            _buildSummaryRow('Shipping', shippingFee),
            _buildSummaryRow('Tax', tax),
            const Divider(),
            _buildSummaryRow('Total', finalTotal, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, double value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        Text(
          'Rp ${NumberFormat("#,##0", "id_ID").format(value)}',
          style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context, double finalTotal) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.check, color: Colors.white, size: 50),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Payment Successful',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total: Rp ${NumberFormat("#,##0", "id_ID").format(finalTotal)}',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white, // Menetapkan warna teks menjadi putih
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                      (route) => false, // Remove all previous routes
                    );
                  },
                  child: const Text('OK'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
