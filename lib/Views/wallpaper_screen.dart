import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Models/pexel_api_model.dart';

class WallpaperScreen extends StatelessWidget {
  final PexelApiModel photoModel;
  const WallpaperScreen({super.key, required this.photoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CachedNetworkImage(
          imageUrl: photoModel.src!.portrait!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
