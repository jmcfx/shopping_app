import 'package:flutter/material.dart';
import 'package:shopping_app/model/global_variable.dart';
import 'package:shopping_app/view/screens/product_details_page.dart';
import 'package:shopping_app/view/shared/custom_chip_widget.dart';
import 'package:shopping_app/view/shared/custom_text_field_widget.dart';
import 'package:shopping_app/view/shared/product_card_widget.dart';
import 'package:shopping_app/view/shared/custom_header_text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = ['All', 'Adidas', 'Nike', 'Bata'];
  late String selectedFilters;

  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CustomHeaderTextStyle(text: "Shoes\nCollections")),
                Expanded(
                  child: CustomTextFieldWidget(),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  //filter index...
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilters = filter;
                        });
                      },
                      child: CustomChipWidget(
                        selectedFilters: selectedFilters,
                        filter: filter,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: ProductCard(
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(245, 247, 249, 2),
                      title: product['title'] as String,
                      price: product['price'] as double,
                      imageUrl: product['imageUrl'] as String,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
