import 'package:ecommerce/models/shop.dart';
import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/intro_page.dart';
import 'package:ecommerce/pages/settings_page.dart';
import 'package:ecommerce/pages/shop_page.dart';
import 'package:ecommerce/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context); // Get the theme provider

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: themeProvider.themedata, // Use the theme from the provider
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/settings_page': (context) => const SettingsPage(),
      },
    );
  }
}
