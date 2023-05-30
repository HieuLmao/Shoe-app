import 'package:flutter/material.dart';
import 'package:shoe_app/styles/styles.dart';

class CategoryWidget extends StatefulWidget {
  final String title;
  const CategoryWidget({
    super.key,
    required this.title,
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.only(right: sx),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: small),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sx),
          color: isSelected ? primaryColor : white,
        ),
        child: Center(
          child: Text(
            widget.title,
            style: isSelected ? textWhite : textGrey,
          ),
        ),
      ),
    );
  }
}
