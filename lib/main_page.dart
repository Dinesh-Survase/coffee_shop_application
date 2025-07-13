import 'package:coffee_shop/notifications.dart';
import 'package:coffee_shop/order.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'favorite_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;

  final List<Widget> _screens = [
    const Home(),
    const FavoriteScreen(),
    const OrderScreen(),
    NotificationScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.notifications,
  ];

  final List<String> _labels = [
    "Home",
    "Favorites",
    "Orders",
    "Notifications",
  ];

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      _icons.length,
      (_) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );

    _animations = _controllers
        .map((controller) => Tween<double>(begin: 1.0, end: 1.2).animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.easeInOut,
              ),
            ))
        .toList();

    _controllers[_selectedIndex].forward();
  }

  @override
  void _onItemTapped(int index) {
    setState(() {
      _controllers[_selectedIndex].reverse();
      _selectedIndex = index;
      _controllers[_selectedIndex].forward();
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: List.generate(_icons.length, (index) {
          return BottomNavigationBarItem(
            icon: ScaleTransition(
              scale: _animations[index],
                child: Icon(_icons[index],size: 28),
            ),
            label: _labels[index],
          );
        }),
      ),
    );
  }
}
