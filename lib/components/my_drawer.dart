import 'package:ecommerce/components/my_listtile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Lottie.asset('assets/animation/add to cart.json'),
              ),
              const SizedBox(
                height: 25,
              ),

              //shop tile
              MyListtile(
                  text: 'S H O P',
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),
              MyListtile(
                  text: 'C A R T',
                  icon: Icons.shopping_cart,
                  onTap: () {
                    //pop  drawer first
                    Navigator.pop(context);

                    //navigate cart page
                    Navigator.pushNamed(context, '/cart_page');
                  }),
              MyListtile(
                  text: 'S E T T I N G S',
                  icon: Icons.settings,
                  onTap: () => Navigator.pushNamed(context, '/settings_page'))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListtile(
                text: 'L O G O U T',
                icon: Icons.logout,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page', (route) => false)),
          ),
          //cart tile
          //exit
        ],
      ),
    );
  }
}
