import 'coffee_model.dart';

class FavoriteCoffee {
  static final List<CoffeeModel> _favorites = [];

  static List<CoffeeModel> get favorites => _favorites;

  static void toggleFavorite(CoffeeModel coffee) {
    coffee.isFavorite = !coffee.isFavorite;
    if (coffee.isFavorite) {
      _favorites.add(coffee);
    } else {
      _favorites.remove(coffee);
    }
  }
}
