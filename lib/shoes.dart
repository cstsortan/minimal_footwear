class Shoe {
  final String image;
  final String name;
  final double price;

  Shoe(this.image, this.name, this.price);
}

final List<Shoe> shoes = [
  Shoe('assets/shoes/black_shoe.jpg', 'Black Shoe', 50.0),
  Shoe('assets/shoes/black_white_shoe.jpg', 'Black and White Shoe', 54.0),
  Shoe('assets/shoes/colorful_shoe.jpg', 'Colorful Shoe', 64.0),
  Shoe('assets/shoes/white_shoe.jpg', 'White Shoe', 73.0),
];