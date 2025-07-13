import 'package:coffee_shop/coffee_model.dart';
import 'package:coffee_shop/colors.dart';
import 'package:coffee_shop/common_button.dart';
import 'package:coffee_shop/favorite.dart';
import 'package:coffee_shop/order.dart';
import 'package:coffee_shop/order_service.dart';
//import 'package:coffee_shop/favorite.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final CoffeeModel coffee;
  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  String selectedIndex = 'M';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xbackgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 0, bottom: 15),
            decoration: const BoxDecoration(
              color: Color(0xFF313131),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: Colors.white,
                    iconSize: 24,
                  ),
                  const Text(
                    "Detail",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        FavoriteCoffee.toggleFavorite(widget.coffee);
                      });
                    },
                    icon: Icon(
                      widget.coffee.isFavorite ? Iconsax.heart5 : Iconsax.heart,
                      color:
                          widget.coffee.isFavorite ? Colors.red : Colors.white,
                    ),
                    iconSize: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Hero(
                      tag: widget.coffee.image,
                      child: Image.asset(
                        widget.coffee.image,
                        width: double.infinity,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.coffee.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.coffee.type,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: xsecondaryColor,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/star.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "${widget.coffee.rate}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      " (${widget.coffee.review})",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: xsecondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                "assets/bike.png",
                                "assets/bean.png",
                                "assets/milk.png",
                              ].map((e) {
                                return Container(
                                  margin: EdgeInsets.only(left: 12),
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    e,
                                    height: 22,
                                    width: 22,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ReadMoreText(
                        widget.coffee.description,
                        trimLength: 125,
                        trimMode: TrimMode.Length,
                        trimCollapsedText: "Read More",
                        trimExpandedText: "Read Less",
                        style: TextStyle(
                          fontSize: 15,
                          color: xsecondaryColor,
                        ),
                        moreStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: xprimaryColor,
                        ),
                        lessStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: xprimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Size",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: ['S', '', 'M', '', 'L'].map((e) {
                          if (e == "") return const SizedBox(width: 20);
                          bool isSelected = selectedIndex == e;
                          return Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = e;
                              });
                            },
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? xprimaryColor.withOpacity(0.1)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isSelected
                                        ? xprimaryColor
                                        : Colors.black12,
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(e,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isSelected
                                          ? xprimaryColor
                                          : Colors.black,
                                    ))),
                          ));
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            )),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Price",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: xsecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    " \$${widget.coffee.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: xprimaryColor,
                    ),
                  ),
                ],
              ),
            ),
           SizedBox(
              width: 250,
              child: CommonButton(title: "Buy Now",
               onTab: () {
               OrderService.addOrder(widget.coffee);
               Navigator.pop(context);
               },
            ),
           ),
          ],
        ),
      ),
    );
  }
}
