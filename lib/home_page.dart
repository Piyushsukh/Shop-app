import 'package:flutter/material.dart';
import 'package:shop_app/cart_page.dart';
import 'package:shop_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemPage = 0;
  late String selectedFilter;
  List<Widget> pages = [ProductList(), CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: itemPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: itemPage,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 35,
          onTap: (value) {
            setState(() {
              itemPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            )
          ]),
    );
  }
}
