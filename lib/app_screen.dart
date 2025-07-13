import 'package:coffee_shop/colors.dart';
import 'package:coffee_shop/icon_model.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int indexMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[indexMenu]['destination'] as Widget,
      backgroundColor: xbackgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
            children: List.generate(menu.length, (index) {
          Map items = menu[index];
          bool isActive = indexMenu == index;
          return Expanded(
              child: InkWell(
            onTap: () {
              setState(() {
                indexMenu = index;
              });
            },
            child: SizedBox(
              height: 70,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(height: 20),
                Icon(
                  items['icon'],
                  color: isActive ? xprimaryColor : xsecondaryColor,
                  size: 25,
                ),
                if (isActive)
                  Container(
                      height: 5,
                      width: 15,
                      decoration: BoxDecoration(
                        color: xprimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ))
              ]),
            ),
          ));
        })),
      ),
    );
  }
}
