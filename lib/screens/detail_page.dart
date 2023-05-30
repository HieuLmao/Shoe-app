import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/models/cart.dart';
import 'package:shoe_app/models/shoe.dart';
import 'package:shoe_app/styles/styles.dart';
import 'package:shoe_app/widgets/appbar.dart';
import 'package:shoe_app/widgets/title.dart';

class DetailPage extends StatefulWidget {
  static const routesName = 'detail-page';
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    ;
    final args = ModalRoute.of(context)!.settings.arguments as Shoe;
    bool heart = args.isFav;
    void setHeart() {
      setState(() {
        heart = !heart;
      });
    }

    return AppBarWidget(
        leadingIcon: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
        title: 'Datails',
        ontap: () {
          args.setIsFav();
          setHeart();
        },
        trailingIcon: heart
            ? Icon(
                Ionicons.heart,
                color: heartColor,
              )
            : Icon(
                Ionicons.heart,
                color: grey,
              ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(args.imageUrl), fit: BoxFit.cover),
              ),
            ),
            TitleWidget(
              text: args.name,
              action: args.rating,
              icon: Icon(Ionicons.star, color: startColor, size: meidum),
            ),
            Text(args.descreption,
                softWrap: true,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: textGrey),
            const TitleWidget(text: 'Size', action: ''),
            SizedBox(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: small),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  height: 60,
                  width: 60,
                  padding: EdgeInsets.all(small),
                  margin: EdgeInsets.only(right: sx),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(sx),
                  ),
                  child: Center(child: Text('4$index')),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: large),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Price',
                        style: textGrey,
                      ),
                      Text(
                        '\$${args.price}',
                        style: heading,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      cart.addItem(args.id.toString(), args.name, args.price,
                          args.imageUrl);
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text('Successfully added!'),
                          content: Text('Check your cart'),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50, vertical: meidum),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sx),
                          color: black),
                      child: Text(
                        'Add to Cart',
                        style: textWhite,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
