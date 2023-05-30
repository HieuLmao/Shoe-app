import 'package:flutter/material.dart';
import 'package:shoe_app/styles/styles.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final String action;
  final Icon? icon;
  const TitleWidget({
    super.key,
    this.icon,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: meidum),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              text,
              style: heading,
              maxLines: 1,
            ),
          ),
          Row(
            children: [
              Text(
                action,
                style: textGrey,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: icon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
