import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controller/page_provider.dart';
import 'package:shopping_app/view/screens/cart_page.dart';
import 'package:shopping_app/view/screens/home_page.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

List<Widget> pageList = [const HomePage(), const CartPage()];

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageNotifier>(
      builder: (context, pageNotifier, child) => Scaffold(
        body: IndexedStack(
          index: pageNotifier.pageIndex,
          children: pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          elevation: 10,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          currentIndex: pageNotifier.pageIndex,
          onTap: (value) {
            pageNotifier.pageIndex = value;
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(
                Icons.shopping_cart,
              ),
            )
          ],
        ),
      ),
    );
  }
}
