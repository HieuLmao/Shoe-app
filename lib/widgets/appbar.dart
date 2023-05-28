import 'package:flutter/material.dart';
import 'package:shoe_app/styles/styles.dart';

class AppBarWidget extends StatelessWidget {
  final Widget? bottomBar;
  final Widget child;
  final String title;
  final Widget leadingIcon;
  final Widget trailingIcon;
  final Widget? quantity;
  final Function()? ontap;
  const AppBarWidget(
      {super.key,
      required this.title,
      this.ontap,
      this.quantity,
      this.bottomBar,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            toolbarHeight: large * 2.5,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(small),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(sx),
                      border: Border.all(color: black)),
                  child: leadingIcon,
                ),
                Text(
                  title,
                  style: heading,
                ),
                GestureDetector(
                  onTap: ontap,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(small),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(sx),
                            border: Border.all(color: black)),
                        child: trailingIcon,
                      ),
                      Positioned(
                          top: 4,
                          right: 3,
                          child: Container(
                            child: quantity,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: large * 2.5, right: small, left: small),
            child: child,
          )
        ],
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}
