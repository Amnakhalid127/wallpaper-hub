import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Views/category_screen.dart';
import 'package:wallpaper_hub/Views/home_screen.dart';
import 'package:wallpaper_hub/Views/search_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentTab = 0;
  late List<Widget> pages;
  late HomeScreen home;
  late CategoryScreen category;
  late SearchScreen search;
  late Widget current;

  @override
  void initState() {
    home = HomeScreen();
    search = SearchScreen(category: "nature");
    category = CategoryScreen();
    pages = [home, search, category];
    current = HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 35,
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 84, 87, 93),
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.search_outlined, color: Colors.white),
          Icon(Icons.category, color: Colors.white),
        ],
      ),
      body: pages[currentTab],
    );
  }
}
