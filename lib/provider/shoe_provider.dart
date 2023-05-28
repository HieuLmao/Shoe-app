import 'package:flutter/material.dart';
import 'package:shoe_app/models/shoe.dart';
import 'package:shoe_app/provider/shoe_service.dart';

class ShoeProvider extends ChangeNotifier {
  final _service = ShoeService();
  List<Shoe> _shoes = [];
  final Map<String, Shoe> _cartList = {};
  Map<String, Shoe> get cartList => {..._cartList};

  List<Shoe> get shoes => _shoes;

  Future<void> getAllShoe() async {
    final response = await _service.getAll();
    _shoes = response;
    notifyListeners();
  }
}
