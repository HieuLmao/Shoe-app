import 'package:flutter/material.dart';

class Cart {
  final String imageUrl;
  final String name;
  final String id;
  final String price;
  late int quantity;

  Cart({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartProvider extends ChangeNotifier {
  final Map<String, Cart> _cartList = {};
  Map<String, Cart> get cartList => {..._cartList};
  void addItem(String id, String name, String price, String imageUrl) {
    if (_cartList.containsKey(id)) {
      _cartList.update(
        id,
        (value) => Cart(
            id: value.id,
            imageUrl: value.imageUrl,
            name: value.name,
            price: value.price,
            quantity: value.quantity + 1),
      );
    } else {
      _cartList.putIfAbsent(
          id,
          () => Cart(
              id: id,
              imageUrl: imageUrl,
              name: name,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  int get total {
    var total = 0;
    _cartList.forEach((key, value) {
      total += int.parse(value.price) * (value.quantity);
    });
    return total;
  }

  void addQuantity(Cart cart) {
    cart.quantity++;
    notifyListeners();
  }

  void subQuantity(Cart cart) {
    cart.quantity--;
    if (cart.quantity < 1) {
      cart.quantity = 1;
    }
    notifyListeners();
  }

  void pay() {
    _cartList.clear();
    notifyListeners();
  }

  void deleteCartItem(String id) {
    _cartList.remove(id);
    notifyListeners();
  }
}
