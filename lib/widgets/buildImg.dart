import 'package:flutter/material.dart';

Widget buildImage(String urlImage, int index, BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 1.5,
    width: MediaQuery.of(context).size.width,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(urlImage, fit: BoxFit.cover),
    ),
  );
}
