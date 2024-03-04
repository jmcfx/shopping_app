import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controller/cart_provider.dart';
import 'package:shopping_app/controller/product_size_provider.dart';
import 'package:shopping_app/view/shared/custom_header_text_style.dart';
import 'package:shopping_app/view/shared/style.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductSizeNotifier>(
      builder: (context, productSizeNotifier, child) => Scaffold(
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
                        final  size = widget.product['sizes'][index] as int;
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              productSizeNotifier.selectedSize = size;
                            },
                            child: Chip(
                              padding: const EdgeInsets.all(8),
                              label: Text(size.toString()),
                              backgroundColor: productSizeNotifier.selectedSize == size
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
                      onPressed: () {
                        if (productSizeNotifier.selectedSize != 0) {
                          Provider.of<CartProvider>(context, listen: false)
                              .addProduct({
                            'id': widget.product['id'],
                            'title': widget.product['title'],
                            'price': widget.product['price'],
                            'imageUrl': widget.product['imageUrl'],
                            'company': widget.product['company'],
                            'size': productSizeNotifier.selectedSize
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Product Added Successfully!')));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Please Select Size!'),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        padding: const EdgeInsets.all(9),
                        backgroundColor: Theme.of(context).primaryColor,
                        minimumSize: Size(
                          MediaQuery.of(context).size.width,
                          50,
                        ),
                      ),
                      child: const Row(
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
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
