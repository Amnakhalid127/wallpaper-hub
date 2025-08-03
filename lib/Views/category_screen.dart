import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_hub/Views/search_screen.dart';
import 'package:wallpaper_hub/widgets/category_block.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                "Categories",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 20),
              buildCategoryBlock("nature.jpg", "Nature", context, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(category: "Nature"),
                  ),
                );
              }),
              buildCategoryBlock("food.jpg", "Food", context, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(category: "Food"),
                  ),
                );
              }),
              buildCategoryBlock("wild.jpg", "WildLife", context, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(category: "wildlife"),
                  ),
                );
              }),
              buildCategoryBlock("city.jpg", "Cities", context, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(category: "Cities"),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
