import 'package:flutter/material.dart';
import 'coffee_model.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<CoffeeModel> coffeeOffers = [
    CoffeeModel(
      image: 'assets/machiato.jpg',
      name: 'Machiato',
      type: 'Hot',
      rate: 4.5,
      review: 210,
      description: 'Smooth espresso with cramel and milk.',
      price: 4.99,
      category: 'Hot',
    ),
    CoffeeModel(
      image: 'assets/latte.jpeg',
      name: 'Latte',
      type: 'Cold',
      rate: 4.2,
      review: 180,
      description: 'Chillde espresso with fresh milk and ice.',
      price: 5.49,
      category: 'Cold',
    ),
    CoffeeModel(
      image: 'assets/americano.jpg',
      name: 'Americano',
      type: 'Hot',
      rate: 4.8,
      review: 240,
      description: "Rich espresso with hot water for a bold,smooth taste.",
      price: 5.50,
      category: 'Hot',
    ),
    CoffeeModel(
     image: 'assets/cappuccino.jpg',
      name: 'Cappuccino',
      type: "Hot",
      rate: 4.7,
      review: 310,
      description: 'A perfect balance of espresso,steamed milk, and foam.',
      price: 5.99,
      category: 'Hot',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF313131),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Special Coffee Offers",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: coffeeOffers.length,
        itemBuilder: (context, index) {
          final coffee = coffeeOffers[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [Colors.brown.shade50, Colors.brown.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.95),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        coffee.image,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "🔥 40% OFF",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffee.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A3F35),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        coffee.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${coffee.rate} (${coffee.review} reviews)",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[700],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "\$${coffee.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6A4E42),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
