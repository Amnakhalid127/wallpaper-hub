import 'package:flutter/material.dart';
import 'package:wallpaper_hub/widgets/custom_navigation_bar.dart';

void main() {
  runApp(WallpaperHub());
}

class WallpaperHub extends StatelessWidget {
  const WallpaperHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Hub',
      debugShowCheckedModeBanner: false,
      home: CustomNavigationBar(),
    );
  }
}
