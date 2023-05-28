import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/models/cart.dart';
import 'package:shoe_app/models/shoe.dart';
import 'package:shoe_app/screens/detail_page.dart';
import 'package:shoe_app/styles/styles.dart';

class ShoeItem extends StatelessWidget {
  const ShoeItem({super.key});

  // final Function()? addToCart;
  // final String imageUrl;
  // final int id;
  // final String descreption;
  // final String price;
  // final String name;
  // final String rating;
  // const ShoeItem({
  //   super.key,
  //   required this.rating,
  //   required this.name,
  //   required this.imageUrl,
  //   required this.id,
  //   required this.descreption,
  //   required this.price,
  // });

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<Shoe>(context, listen: false);
    final addToCart = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routesName,
            arguments: response);
      },
      child: Container(
        height: 280,
        width: MediaQuery.of(context).size.width * 0.94,
        padding: EdgeInsets.all(sx),
        margin: EdgeInsets.only(right: meidum),
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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(sx),
                    image: DecorationImage(
                        image: NetworkImage(response.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                Consumer<Shoe>(
                  builder: (context, value, child) => Positioned(
                    top: small,
                    right: small,
                    child: GestureDetector(
                      onTap: () {
                        value.setIsFav();
                      },
                      child: Container(
                        padding: EdgeInsets.all(small),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: white,
                        ),
                        child: value.isFav
                            ? Icon(
                                Ionicons.heart,
                                color: heartColor,
                              )
                            : Icon(
                                Ionicons.heart,
                                color: grey,
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: large,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Review',
                            style: textGrey,
                          ),
                          SizedBox(
                            width: sx,
                          ),
                          Row(
                            children: [
                              Text(
                                response.rating,
                                style: textGrey,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Icon(
                                  Ionicons.star,
                                  color: startColor,
                                  size: meidum,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        '\$${response.price}',
                        style: heading,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      addToCart.addItem(response.id.toString(), response.name,
                          response.price, response.imageUrl);
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text('Successfully added!'),
                          content: Text('Check your cart'),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(sx),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Ionicons.add,
                        color: white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
