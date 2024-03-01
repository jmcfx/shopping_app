import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/view/shared/custom_header_text_style.dart';
import 'package:shopping_app/view/shared/style.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          CustomHeaderTextStyle(text: widget.product['title'] as String),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image(
              image: CachedNetworkImageProvider(
                  widget.product['imageUrl'] as String),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHeaderTextStyle(text: '\$${widget.product['price']}'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  // Selected Size List.....
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size = widget.product['sizes'][index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            padding: const EdgeInsets.all(8),
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  //Add to Cart Button....
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                            size: 32,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
