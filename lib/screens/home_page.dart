import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/models/cart.dart';
import 'package:shoe_app/provider/shoe_provider.dart';
import 'package:shoe_app/screens/cart_page.dart';
import 'package:shoe_app/styles/styles.dart';
import 'package:shoe_app/widgets/appbar.dart';
import 'package:shoe_app/widgets/category.dart';
import 'package:shoe_app/widgets/new_shoe.dart';
import 'package:shoe_app/widgets/search.dart';
import 'package:shoe_app/widgets/items/shoe_item.dart';
import 'package:shoe_app/widgets/title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
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
      child: Column(
        children: [
          const SearchWidget(),
          SizedBox(
            height: large * 1.5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const CategoryWidget(),
              itemCount: 7,
            ),
          ),
          const TitleWidget(text: 'Popular', action: 'View all'),
          SizedBox(
            height: 350,
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: sx),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // Shoe shoe = value.shoes[index];
                // return ShoeItem(
                //   imageUrl: shoe.imageUrl,
                //   descreption: shoe.descreption,
                //   id: shoe.id,
                //   price: shoe.price,
                //   name: shoe.name,
                //   rating: shoe.rating,
                return ChangeNotifierProvider.value(
                  value: response[index],
                  child: const ShoeItem(),
                );
              },
              itemCount: 6,
            ),
          ),
          const TitleWidget(text: 'New Arrivals', action: 'View all'),
          SizedBox(
            height: 150,
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: small),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: response[index + 3],
                  child: const NewShoeItem(),
                );
              },
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
