class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image
  });
}

final List<Category> categories = [
  Category(
    title: "Coffee", 
    image: "assets/images/coffee.png",
    ),
  Category(
    title: "Non Coffee", 
    image: "assets/images/noncoffee.png",
    ),
  Category(
    title: "Snack",
    image: "assets/images/snack.png",
    ),
];