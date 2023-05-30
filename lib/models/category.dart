import 'package:flutter/material.dart';

class Category extends ChangeNotifier {
  final String name;
  bool isSelect;
  Category({
    required this.name,
    this.isSelect = false,
  });

  void setIsSelect() {
    isSelect = !isSelect;
    notifyListeners();
  }
}

List categories = [
  'nike',
  'adidas',
  'puma',
  'converse',
  'jordan',
];
