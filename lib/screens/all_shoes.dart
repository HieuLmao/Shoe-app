import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/styles/styles.dart';
import 'package:shoe_app/widgets/appbar.dart';
import 'package:shoe_app/widgets/export.dart';

import '../provider/shoe_provider.dart';

class AllShoes extends StatelessWidget {
  static const routesName = 'all-shoes';
  const AllShoes({super.key});

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<ShoeProvider>(context, listen: false).shoes;

    return AppBarWidget(
        title: 'All Shoes',
        leadingIcon: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Ionicons.arrow_back,
            color: black,
          ),
        ),
        trailingIcon: Icon(
          Ionicons.menu,
          color: black,
        ),
        child: Column(
          children: [
            const SearchWidget(),
            Expanded(
              child: GridView.builder(
                itemCount: response.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: small,
                  crossAxisSpacing: small,
                ),
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: response[index],
                  child: NewShoeItem(),
                ),
              ),
            )
          ],
        ));
  }
}
