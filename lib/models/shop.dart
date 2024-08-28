import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    //product 1
    Product(
        name: 'Product1',
        price: 88.7,
        description: 'Item Description',
        imagepath: 'assets/images/img1.jpg'),
    //product 2
    Product(
        name: 'Product2',
        price: 90.9,
        description: 'Item Description',
        imagepath: 'assets/images/img2.jpg'),
    //product 3
    Product(
        name: 'Product3',
        price: 57.7,
        description: 'Item Description',
        imagepath: 'assets/images/img3.webp'),
    //product 4
    Product(
        name: 'Product4',
        price: 99.9,
        description: 'Item Description',
        imagepath: 'assets/images/img4.jpg'),
    //product 5
    Product(
        name: 'Product5',
        price: 45.4,
        description: 'Item Description',
        imagepath: 'assets/images/img5.jpeg'),
  ];

  //user cart
  List<Product> _cart = [];

  // get product list (if anywhere around, the code we want we just return the shop )
  List<Product> get shop => _shop;

  //get user cart (if anywhere around, the code we want we just return the cart )
  List<Product> get cart => _cart;

  //add to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
