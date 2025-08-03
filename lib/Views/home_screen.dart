import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_hub/widgets/buildImg.dart';
import 'package:wallpaper_hub/widgets/build_animated_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  List wallpapers = [
    "assets/wall1.png",
    "assets/wall2.png",
    "assets/wall3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 12, left: 20, right: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Wallify",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(height: 7),
            CarouselSlider.builder(
              itemCount: wallpapers.length,
              itemBuilder: (context, index, realIndex) {
                final res = wallpapers[index];
                return buildImage(res, index, context);
              },
              options: CarouselOptions(
                autoPlay: true,
                height: MediaQuery.of(context).size.height / 1.4,

                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Center(child: buildIndicator(activeIndex, 3)),
          ],
        ),
      ),
    );
  }
}
