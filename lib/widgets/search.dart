import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoe_app/styles/styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: meidum),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(sx)),
              padding: EdgeInsets.symmetric(horizontal: small, vertical: 5),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(small),
                    child: Icon(
                      Ionicons.search,
                      color: grey,
                    ),
                  ),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'search...'),
                  )),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: sx),
            padding: EdgeInsets.all(sx),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sx), color: primaryColor),
            child: Icon(
              Ionicons.swap_horizontal,
              color: white,
            ),
          )
        ],
      ),
    );
  }
}
