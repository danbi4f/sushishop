import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/theme/colors.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    removeFromCart(Food food, BuildContext context) {
      // get access to shop
      final shop = context.read<Shop>();

      // remove from cart
      shop.removeFromCart(food);
    }

    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'My card',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: primaryColor,
        ),
        body: Column(
          // CUSTOMER CART
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];
                  // get food name
                  final String foodName = food.name;

                  // get food price
                  final String foodPrice = food.price;

                  // return list tile
                  return Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        '\$$foodPrice',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          removeFromCart(food, context);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // PAY BUTTON
            Padding(
              padding: const EdgeInsets.all(25),
              child: MyButton(
                text: 'Pay now',
                onTape: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
