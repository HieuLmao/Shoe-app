import 'package:flutter/material.dart';

class Shoe extends ChangeNotifier {
  final int id;
  final String name;
  final String imageUrl;
  final String descreption;
  final String price;
  final String rating;
  bool isFav;

  Shoe(
      {required this.descreption,
      required this.rating,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      this.isFav = false});

  void setIsFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
