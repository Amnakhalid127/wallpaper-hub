import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_hub/Models/pexel_api_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_hub/Constants/api_urls.dart';
import 'package:wallpaper_hub/widgets/wallpaper_grid.dart';

class SearchScreen extends StatefulWidget {
  final String category;
  SearchScreen({super.key, required this.category});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearch = false;
  bool isLoading = false;
  List<PexelApiModel> photos = [];

  getSearchWallpaper(String search) async {
    if (search.trim().isEmpty) return;

    setState(() {
      isLoading = true;
      photos.clear(); // Clear previous results
    });

    try {
      final response = await http.get(
        Uri.parse(
          "https://api.pexels.com/v1/search?query=${search.trim()}&per_page=30", // Removed space
        ),
        headers: {"Authorization": ApiUrls.authAPI},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData["photos"] != null) {
          jsonData["photos"].forEach((element) {
            PexelApiModel pexelApiModel = PexelApiModel.fromMap(element);
            photos.add(pexelApiModel);
          });
        }

        setState(() {
          isSearch = true;
          isLoading = false;
        });
      } else {
        // Handle error
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Failed to load wallpapers")));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.category;
    // Automatically search for the category when screen loads
    if (widget.category.isNotEmpty) {
      getSearchWallpaper(widget.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 7, right: 7),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Search Wallpaper",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 14,
                ),
                child: TextField(
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  onSubmitted: (value) {
                    if (value.trim().isNotEmpty) {
                      getSearchWallpaper(value.trim());
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Search for a Wallpaper...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    fillColor: Color(0xffececf8),
                    suffixIcon: isLoading
                        ? Padding(
                            padding: EdgeInsets.all(12),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        : isSearch
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isSearch = false;
                                photos.clear();
                                _searchController.clear();
                              });
                            },
                            child: Icon(Icons.close, color: Colors.black),
                          )
                        : GestureDetector(
                            onTap: () {
                              String searchText = _searchController.text.trim();
                              if (searchText.isNotEmpty) {
                                getSearchWallpaper(searchText);
                              }
                            },
                            child: Icon(
                              Icons.search_outlined,
                              color: Colors.black,
                            ),
                          ),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : photos.isEmpty && isSearch
                    ? Center(
                        child: Text(
                          "No wallpapers found",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : WallpaperGrid(photos, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
