import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget SliderScreen(BuildContext context) {
  final List<String> slidersList = [
    'assets/images/Group 34213.png',
    'assets/images/Group 34213.png',
    'assets/images/Group 34213.png',
  ];

  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;
  final screenHeight = mediaQuery.size.height;

  return VxSwiper.builder(
    aspectRatio: 15 / 7,
    autoPlay: false,
    height: screenHeight * 0.25,
    itemCount: slidersList.length,
    enlargeCenterPage: true,
    itemBuilder: (context, index) {
      return Container(
        child: Image.asset(
          slidersList[index],
          fit: BoxFit.fill,
        )
            .box
            .rounded
            .clip(Clip.antiAlias)
            .margin(const EdgeInsets.symmetric(horizontal: 4))
            .make(),
      );
    },
  );
}
