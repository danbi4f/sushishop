import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/models/food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  final Food food;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // image
            Image.asset(
              food.imagePath,
              height: 140,
            ),
            // text title food in tile
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
            ),
            // price + rating
            const SizedBox(height: 10),
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${food.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
