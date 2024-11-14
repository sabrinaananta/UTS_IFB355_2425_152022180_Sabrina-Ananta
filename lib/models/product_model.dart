

import 'package:flutter/material.dart';

class Product {
  final String title;
  final String image;
  final int price;
  final String category;
  
  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.category,
  
  });
}

// Daftar produk sampel
final List<Product> products = [
  Product(
    title: "Coffee Brown Sugar",
    image: "assets/images/coffee_brown_sugar.jpg",
    price: 28000,
    category: "Coffee",
   
  ),
  Product(
    title: "Coffee Caramel Latte",
    image: "assets/images/coffee_caramel_latte.jpg",
    price: 32000,
    category: "Coffee",
  
  ),
  Product(
    title: "Coffee Latte",
    image: "assets/images/coffee_latte.jpg",
    price: 30000,
    category: "Coffee",
    
  ),
  Product(
    title: "Ice Americano",
    image: "assets/images/americano.jpg",
    price: 18000,
    category: "Coffee",
    
  ),
  Product(
    title: "Matcha Latte",
    image: "assets/images/matcha_latte.jpg",
    price: 32000,
    category: "Non Coffee",
   
  ),
  Product(
    title: "Chocolate",
    image: "assets/images/chocolate.jpg",
    price: 22000,
    category: "Non Coffee",
   
  ),
  Product(
    title: "Ice Tea",
    image: "assets/images/tea.jpg",
    price: 15000,
    category: "Non Coffee",
    
  ),
  Product(
    title: "Sparkling Water",
    image: "assets/images/sparkling.jpg",
    price: 12000,
    category: "Non Coffee",
    
  ),
  Product(
    title: "Croissant",
    image: "assets/images/croissant.jpg",
    price: 10000,
    category: "Snack",
    
  ),
  Product(
    title: "Cookies",
    image: "assets/images/cookies.jpg",
    price: 12000,
    category: "Snack",
   
  ),
  Product(
    title: "Donut",
    image: "assets/images/donut.jpg",
    price: 15000,
    category: "Snack",
    
  ),
  Product(
    title: "Macaron",
    image: "assets/images/macaron.jpg",
    price: 20000,
    category: "Snack",
    
  ),
];
