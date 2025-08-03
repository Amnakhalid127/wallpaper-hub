import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildIndicator(int index, int count) {
  return AnimatedSmoothIndicator(
    activeIndex: index,
    count: count,
    effect: SlideEffect(
      dotWidth: 15,
      dotHeight: 15,
      activeDotColor: Colors.blue,
    ),
  );
}
