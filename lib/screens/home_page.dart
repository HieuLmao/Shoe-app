import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:shoe_app/models/cart.dart';

import 'package:provider/provider.dart';
import 'package:shoe_app/provider/shoe_provider.dart';

import 'package:shoe_app/screens/cart_page.dart';
import 'package:shoe_app/styles/styles.dart';
import 'package:shoe_app/widgets/categories.dart';
import '../widgets/export.dart';
import 'all_shoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ShoeProvider>(context, listen: false).getAllShoe();
    });
  }

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<ShoeProvider>(context, listen: false).shoes;
    final cart = Provider.of<CartProvider>(context).cartList;
    return AppBarWidget(
      leadingIcon: Icon(
        Ionicons.menu,
        color: black,
      ),
      title: 'Kinetic Shoes',
      quantity: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: heartColor),
        child: Center(
          child: Text(
            cart.length.toString(),
            style: TextStyle(color: white, fontSize: 12),
          ),
        ),
      ),
      trailingIcon: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CartPage(),
          ));
        },
        child: Icon(
          Ionicons.cart_outline,
          color: black,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SearchWidget(),
            const CategoriesWidget(),
            TitleWidget(
              text: 'Popular',
              action: 'View all',
              ontap: () {
                Navigator.pushNamed(context, AllShoes.routesName);
              },
            ),
            SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width * 0.94,
              child: CarouselSlider.builder(
                itemCount: 6,
                itemBuilder: (context, index, realIndex) =>
                    ChangeNotifierProvider.value(
                  value: response[index],
                  child: ShoeItem(
                    height: 350,
                    width: MediaQuery.of(context).size.width * 0.73,
                    heightImg: MediaQuery.of(context).size.height * 0.23,
                    widthImg: MediaQuery.of(context).size.width,
                  ),
                ),
                options: CarouselOptions(
                  aspectRatio: MediaQuery.of(context).size.width * 0.65 / 250,
                ),
              ),
            ),
            const TitleWidget(text: 'New Arrivals', action: 'View all'),
            SizedBox(
              height: 200,
              child: CarouselSlider.builder(
                itemCount: 6,
                itemBuilder: (context, index, realIndex) =>
                    ChangeNotifierProvider.value(
                  value: response[index + 3],
                  child: const NewShoeItem(),
                ),
                options:
                    CarouselOptions(autoPlay: true, enlargeCenterPage: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
