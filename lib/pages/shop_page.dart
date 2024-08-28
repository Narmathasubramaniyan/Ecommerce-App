import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    //access product in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
          title: const Text('Shop page'),
          actions: [
            //go to cart
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.trolley))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop subtitle
            Center(
              child: Text(
                'Select from this list of  premium product',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(15),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    //get each individual product from shop
                    final product = products[index];

                    //return as product tile UI
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
