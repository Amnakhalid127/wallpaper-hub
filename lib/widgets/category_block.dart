import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCategoryBlock(
  String img,
  String text,
  BuildContext context,
  VoidCallback onTap,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    width: MediaQuery.of(context).size.width,
    height: 175,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            img,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 175,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
