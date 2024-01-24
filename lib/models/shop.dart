import 'package:flutter/material.dart';
import 'package:sushishop/models/food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    // salmon sushi
    Food(
        name: 'Salomon Sushi',
        price: '21.00',
        imagePath: 'lib/images/salmon_sushi.png',
        rating: '4,5'),

    // tuna
    Food(
        name: 'Tuna',
        price: '25.00',
        imagePath: 'lib/images/tuna.png',
        rating: '4,9'),
  ];

  //customer card
  List<Food> _cart = [];

  // get methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCard(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
