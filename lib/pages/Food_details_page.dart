import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/theme/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  final Food food;

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity
  int quantityCount = 0;

  // decrement quantity
  decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment quantity
  incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

// add to card
  addToCard() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCard(widget.food, quantityCount);

      // let the user konow it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            'Successfully added to cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // pop once to remove dialog box
                Navigator.pop(context);

                // pop agin to go previous screen
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done, color: Colors.white),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 100,
                  ),
                  const SizedBox(height: 25),
                  //rating
                  Row(
                    children: [
                      //star icon
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 10),

                      //rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 10),
                  // description
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'The entire ensemble is a masterpiece of culinary craftsmanship, a symphony of flavors and textures that dance gracefully on the palate. Each bite is a journey through the ocean, as the buttery richness of the delicate sliced salmon harmonizes with the subtle sweetness of the expertly seasoned sushi rice. The dish is a testament to the artistry of the sushi chef, who skillfully balances the elements to create a sublime dining experience. The freshness of the salmon is unparalleled, a testament to the quality of the ingredients chosen for this gastronomic masterpiece.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: const BoxDecoration(
                            color: secondColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            quantityCount.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: secondColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        //quantity count
                        //plus button
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // add to cart button
                MyButton(
                  text: 'Add to Cart',
                  onTape: addToCard,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
