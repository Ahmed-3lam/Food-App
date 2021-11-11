import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'homeservicebanner.dart';

class CarouselOfOffers extends StatelessWidget {
  const CarouselOfOffers({
    Key? key,
    required this.image,
  }) : super(key: key);

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CarouselSlider.builder(
        itemCount: image.length,
        options:
            CarouselOptions(height: 200, autoPlay: true, viewportFraction: 1),
        itemBuilder: (context, i, i2) => Padding(
          padding: const EdgeInsets.all(20),
          child: HomeServiceBanner(
            image: image[i],
          ),
        ),
      ),
    );
  }
}
