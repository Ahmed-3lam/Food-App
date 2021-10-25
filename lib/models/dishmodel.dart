import 'package:flutter/material.dart';

class DishModel extends ChangeNotifier {
  DishModel({
    required this.resturantName,
    required this.name,
    required this.image,
    required this.starCount,
    required this.viewCount,
  });
  final String name, image, resturantName;
  final double starCount;
  final int viewCount;
}
