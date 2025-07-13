import 'package:coffee_shop/coffee_detail.dart';
import 'package:flutter/material.dart';
import 'coffee_model.dart';
import 'coffee_categories.dart';
import 'colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<CoffeeModel> get filteredCoffee {
    if (selectedIndex == 0) {
      return listOfCoffee;
    } else {
      return listOfCoffee
          .where((coffee) =>
              coffee.category.toLowerCase() ==
              coffeeCategories[selectedIndex].toLowerCase())
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              height: 280,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF111111),
                    Color(0xFF313131),
                  ],
                ),
              ),
            ),
            headerParts(),
          ],
        ),
        const SizedBox(height: 25),
        categorySelection(),
        const SizedBox(height: 15),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredCoffee.length,
          itemBuilder: (context, index) {
            final coffee = filteredCoffee[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CoffeeDetailScreen(coffee: coffee),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                          tag: coffee.image,
                          child: Image.asset(
                            coffee.image,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      coffee.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text("\$${coffee.price.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget categorySelection() {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: coffeeCategories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 25 : 10,
                right: index == coffeeCategories.length - 1 ? 25 : 0,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? xprimaryColor
                    : xsecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                coffeeCategories[index],
                style: TextStyle(
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 16,
                  color: selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Location", style: TextStyle(color: xsecondaryColor)),
              Row(
                children: [
                  const Text(
                    "Maharashtra, India",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.keyboard_arrow_down_rounded,
                      color: xsecondaryColor),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff2a2a2a),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset("assets/se.png",
                          color: Colors.white, height: 30),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "Search coffee",
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.white54),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 60,
                width: 55,
                decoration: BoxDecoration(
                  color: xprimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 25),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/ba.png",
              width: double.infinity,
              height: 210,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
