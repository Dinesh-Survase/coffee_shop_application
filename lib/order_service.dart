import 'coffee_model.dart';

class OrderService {
  static final List<CoffeeModel> _orders = [];
  static List<CoffeeModel> get orders => _orders;
  static void addOrder(CoffeeModel coffee) {
    _orders.add(coffee);
  }

  static void clearOrder() {
    _orders.clear();
  }
}
