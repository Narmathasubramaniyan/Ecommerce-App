import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/my_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with background color
            Container(
              width: 200,
              height: 200,
              color: Theme.of(context)
                  .colorScheme
                  .surface, // Background color for the container
              child: Lottie.asset(
                'assets/animation/add to cart.json',
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // Title
            Text(
              "Simple Trends",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Subtitle
            Text(
              "Premium Quality Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // Button
            MyButton(
              onTap: () {
                Navigator.pushNamed(context, '/shop_page');
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
