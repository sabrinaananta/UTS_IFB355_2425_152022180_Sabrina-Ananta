import 'package:flutter/material.dart';
import '../models/category.dart';

class Categories extends StatelessWidget {
  final Function(String) onCategorySelected;

  const Categories({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Sesuaikan tinggi sesuai kebutuhan
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories.map((category) {
          return GestureDetector(
            onTap: () => onCategorySelected(category.title),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(category.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
  category.title,
  style: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  maxLines: 2, 
  overflow: TextOverflow.ellipsis,
  softWrap: true, 
),

              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
