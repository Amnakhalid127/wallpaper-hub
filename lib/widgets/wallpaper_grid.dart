import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Models/pexel_api_model.dart';
import 'package:wallpaper_hub/Views/wallpaper_screen.dart';

Widget WallpaperGrid(List<PexelApiModel> photosList, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0, // Reduced spacing
      children: photosList.map((PexelApiModel photoModel) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WallpaperScreen(photoModel: photoModel),
              ),
            );
          },
          child: Hero(
            tag: photoModel.src!.portrait!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: photoModel.src!.portrait!,
                  fit: BoxFit.cover, // Changed from contain to cover
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey[400],
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
