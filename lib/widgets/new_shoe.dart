import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/models/shoe.dart';
import 'package:shoe_app/styles/styles.dart';
import 'package:transparent_image/transparent_image.dart';

import '../screens/detail_page.dart';

class NewShoeItem extends StatelessWidget {
  const NewShoeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<Shoe>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routesName,
            arguments: response);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(vertical: small),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(sx),
          boxShadow: [
            BoxShadow(
              color: white,
              offset: const Offset(-5, -5),
              blurRadius: 3,
            ),
            BoxShadow(
              color: grey,
              offset: const Offset(5, 5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sx),
              ),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: response.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Consumer<Shoe>(
              builder: (context, value, child) => Positioned(
                top: small,
                left: small,
                child: GestureDetector(
                  onTap: () {
                    value.setIsFav();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: white),
                      child: value.isFav
                          ? Icon(
                              Ionicons.heart,
                              color: heartColor,
                              size: meidum,
                            )
                          : Icon(
                              Ionicons.heart,
                              color: grey,
                              size: meidum,
                            )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
