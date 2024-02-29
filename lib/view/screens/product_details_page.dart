import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/view/shared/custom_header_text_style.dart';
import 'package:shopping_app/view/shared/style.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          CustomHeaderTextStyle(text: product['title'] as String),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image(
              image: CachedNetworkImageProvider(product['imageUrl'] as String),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: customBackgroundColor()),
            child: Column(
              children: [
                CustomHeaderTextStyle(text: '\$${product['price']}'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size = product['sizes'][index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text(size.toString()),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50)),
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
