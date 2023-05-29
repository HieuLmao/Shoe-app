import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/styles/styles.dart';
import 'package:shoe_app/widgets/appbar.dart';
import 'package:shoe_app/widgets/items/cart_item.dart';

import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<CartProvider>(context);
    return AppBarWidget(
      leadingIcon: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Ionicons.arrow_back,
          color: black,
        ),
      ),
      title: 'Cart Page',
      trailingIcon: Icon(
        Ionicons.menu,
        color: black,
      ),
      bottomBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Price',
                    style: textGrey,
                  ),
                  Text(
                    '\$${response.total}',
                    style: heading,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: response.cartList.isEmpty
                                ? const Text('Cart is empty')
                                : const Text('Successfully !'),
                          ));
                  response.pay();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 70, vertical: meidum),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(sx), color: black),
                  child: Text(
                    'Pay',
                    style: textWhite,
                  ),
                ),
              ),
            ],
          )),
      child: response.cartList.isEmpty
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Image.network(
                  'https://eherbalmarket.vn/assets/images/no-cart.png'),
            )
          : SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(small),
                  itemBuilder: (context, index) {
                    Cart cart = response.cartList.values.toList()[index];
                    return CartItem(
                      imageUrl: cart.imageUrl,
                      name: cart.name,
                      price: cart.price,
                      quantity: cart.quantity,
                      onAdd: () {
                        response.addQuantity(cart);
                      },
                      onSub: () {
                        response.subQuantity(cart);
                      },
                    );
                  },
                  itemCount: response.cartList.length,
                ),
              ),
            ),
    );
  }
}
