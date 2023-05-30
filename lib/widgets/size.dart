import 'package:flutter/material.dart';

import '../styles/styles.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({super.key});

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: small),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selected = index;
            });
          },
          child: Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(small),
            margin: EdgeInsets.only(right: sx),
            decoration: BoxDecoration(
              color: selected == index ? primaryColor : white,
              borderRadius: BorderRadius.circular(sx),
            ),
            child: Center(
                child: Text(
              '4$index',
              style: selected == index ? textWhite : textGrey,
            )),
          ),
        ),
      ),
    );
  }
}
