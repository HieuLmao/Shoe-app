import 'package:flutter/material.dart';

import '../models/category.dart';
import '../styles/styles.dart';
import 'export.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: large * 1.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryItem(
          title: categories[index],
          color: isSelected == index ? primaryColor : white,
          style: isSelected == index ? textWhite : textGrey,
          handleSelect: () {
            setState(() {
              isSelected = index;
            });
          },
        ),
      ),
    );
  }
}
