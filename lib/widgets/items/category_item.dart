import 'package:flutter/material.dart';
import 'package:shoe_app/styles/styles.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final TextStyle style;
  final Function() handleSelect;
  const CategoryItem({
    super.key,
    required this.handleSelect,
    required this.title,
    required this.color,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleSelect,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(right: sx),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: small),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sx), color: color),
        child: Center(
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
