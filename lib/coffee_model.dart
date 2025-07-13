class CoffeeModel {
  final String image;
  final String name;
  final String type;
  final double rate;
  final int review;
  final String description;
  final double price;
  final String category;
  bool isFavorite;

  CoffeeModel({
    required this.image,
    required this.name,
    required this.type,
    required this.rate,
    required this.review,
    required this.description,
    required this.price,
    required this.category,
    this.isFavorite = false,
  });
}

List<CoffeeModel> listOfCoffee = [
  CoffeeModel(
    image: "assets/machiato.jpg",
    name: "Machiato",
    type: "Strong & Bold",
    rate: 4.5,
    review: 120,
    description: "Strong espresso with a dash of steamed milk.",
    price: 5.50,
    category: "Machiato",
  ),
  CoffeeModel(
      image: "assets/latte.jpeg",
      name: "Latte",
      type: "Milky & Smooth",
      rate: 4.2,
      review: 98,
      description: "A blend of espresso and steamed milk.",
      price: 4.00,
      category: "Latte"),
  CoffeeModel(
      image: "assets/americano.jpg",
      name: "Americano",
      type: "Classic & Simple",
      rate: 4.0,
      review: 110,
      description: "Espresso diluted with hot water.",
      price: 5.00,
      category: "Americano"),
  CoffeeModel(
    image: "assets/cappuccino.jpg",
    name: "Cappuccino",
    type: "Foamy & Rich",
    rate: 4.3,
    review: 130,
    description: "Espresso with steamed milk foam.",
    price: 5.20,
    category: "Cappuccino",
  ),
];
