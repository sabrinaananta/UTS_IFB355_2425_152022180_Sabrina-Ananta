import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jamparing_aplikasi/models/product_model.dart';
import 'package:jamparing_aplikasi/widgets/category.dart';
import 'package:jamparing_aplikasi/widgets/product_cart.dart';
import 'package:jamparing_aplikasi/widgets/widget_support.dart';

const kcontentColor = Colors.grey;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSlide = 0;
  String selectedCategory = "All"; // Tambahkan state untuk kategori yang dipilih

  // Fungsi untuk menangani pemilihan kategori
  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // Filter produk berdasarkan kategori yang dipilih
  List<Product> get filteredProducts {
    if (selectedCategory == "All") {
      return products;
    }
    return products.where((product) => product.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(now);

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/banner.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: AppWidget.HeadlineTextFieldStyle().copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Have A Nice Day!",
                  style: AppWidget.LightlineTextFieldStyle().copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
                ImageSlider(
                  currentSlide: currentSlide,
                  onChange: (index) {
                    setState(() {
                      currentSlide = index;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Categories(onCategorySelected: onCategorySelected),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCart(product: filteredProducts[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlide;

  const ImageSlider({super.key, required this.currentSlide, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  'assets/images/promo1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/promo2.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/promo3.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlide == index ? Colors.black : Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
