import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // Show dialog box to ask for confirmation from the user
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
        actions: [
          // Cancel Button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          // Yes Button
          MaterialButton(
            onPressed: () {
              // Pop dialog box
              Navigator.pop(context);

              // Remove from cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  // User pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('Connect With Payment Backend'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // Get individual item from cart
                      final item = cart[index];

                      // Return as a cart tile UI with neomorphism
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                // bottom right (+) shadow is darker
                                color: Theme.of(context).colorScheme.tertiary,
                                offset: const Offset(5, 5),
                                blurRadius: 15,
                              ),
                              BoxShadow(
                                // top left (-) shadow is lighter
                                color: Theme.of(context).colorScheme.secondary,
                                offset: const Offset(-4, -4),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 25,
                            ),
                            leading: Image.asset(
                              item.imagepath,
                              width: 50,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            title: Text(item.name),
                            subtitle: Text(item.price.toStringAsFixed(2)),
                            trailing: IconButton(
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text('P A Y  N O W'),
            ),
          ),
        ],
      ),
    );
  }
}
