import 'package:flutter/material.dart';
import 'package:jamparing_aplikasi/models/product_model.dart';
import 'package:jamparing_aplikasi/widgets/category.dart';

class ProductList extends StatefulWidget {
  final List<Product> allProducts;

  const ProductList({super.key, required this.allProducts});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String selectedCategory = "All";

  List<Product> get filteredProducts {
    if (selectedCategory == "All") {
      return widget.allProducts;
    }
    return widget.allProducts
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categories(onCategorySelected: onCategorySelected),
        Expanded(
          child: ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return ListTile(
                leading: Image.asset(product.image),
                title: Text(product.title),
                subtitle: Text('Rp ${product.price}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
