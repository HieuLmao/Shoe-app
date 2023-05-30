import 'package:flutter/material.dart';
import 'package:shoe_app/styles/styles.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        margin: EdgeInsets.only(right: sx),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: small),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sx),
          color: white,
        ),
        child: Center(
          child: Text(
            'Nike',
            style: textGrey,
          ),
        ),
      ),
    );
  }
}