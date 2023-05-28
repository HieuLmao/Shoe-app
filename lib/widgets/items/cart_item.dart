import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoe_app/styles/styles.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final int quantity;
  final Function() onAdd;
  final Function() onSub;

  const CartItem({
    super.key,
    required this.onAdd,
    required this.onSub,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sx),
      margin: EdgeInsets.only(bottom: meidum),
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(sx),
          boxShadow: [
            BoxShadow(
              color: white,
              offset: Offset(-5, -5),
              blurRadius: 3,
            ),
            BoxShadow(
              color: grey,
              offset: Offset(5, 5),
              blurRadius: 5,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name',
                style: heading,
              ),
              Text(
                '\$$price',
                style: heading,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: GestureDetector(
                      onTap: onAdd,
                      child: Icon(
                        Ionicons.add,
                        color: white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: meidum,
                    child: Center(child: Text('$quantity')),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: GestureDetector(
                      onTap: onSub,
                      child: Icon(
                        Icons.remove,
                        color: white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            height: 130,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sx),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
