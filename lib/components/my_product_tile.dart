import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context) {
    //show dialogbox to ask confirm from user
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text('Add this item to your cart'),
              actions: [
                //cancel Button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),

                //yes Button
                MaterialButton(
                  onPressed: () {
                    //pop dialog box
                    Navigator.pop(context);

                    //add to cart
                    context.read<Shop>().addToCart(product);
                  },
                  child: Text('Yes'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagepath),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              //product title
              Text(
                product.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),

              //product description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),

          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //price
              Text(
                '\$' + product.price.toStringAsFixed(2),
              ),

              //add to cart
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: Icon(Icons.add)))
            ],
          )
        ],
      ),
    );
  }
}
