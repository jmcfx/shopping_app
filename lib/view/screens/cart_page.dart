import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controller/providers/cart_provider.dart';
import 'package:shopping_app/view/shared/style.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          // Shoes Cart ListTile.....
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: customBackgroundColor(),
              borderRadius: BorderRadius.circular(8.0),
            ),
            //List Tile.....
            child: ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: CachedNetworkImageProvider(
                  cartItem['imageUrl'] as String,
                ),
              ),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text('Size : ${cartItem['size']}'),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      content: const Text(
                          'Are you Sure you want to remove the Product from your cart'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No',
                                style: TextStyle(
                                  color: Colors.blue,
                                ))),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .removeProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
