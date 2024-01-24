import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/components/food_tile.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/pages/Food_details_page.dart';
import 'package:sushishop/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // //food menu
  // List foodMenu = [
  //   // salmon sushi
  //   Food(
  //       name: 'Salomon Sushi',
  //       price: '21.00',
  //       imagePath: 'lib/images/salmon_sushi.png',
  //       rating: '4,5'),

  //   // tuna
  //   Food(
  //       name: 'Tuna',
  //       price: '25.00',
  //       imagePath: 'lib/images/tuna.png',
  //       rating: '4,9'),
  // ];

  //navigate to food item details page

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    navigateToFoodDetails(int index) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(food: foodMenu[index]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // cart Button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cardpage');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo baner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo message
                    Text(
                      'Get 32% promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    //redeem button
                    const SizedBox(height: 20),
                    MyButton(
                      text: 'Redeem',
                      onTape: () {},
                    )
                  ],
                ),
                //image
                Image.asset(
                  'lib/images/many_sushi.png',
                  height: 100,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Searching here..',
                // border: OutlineInputBorder(
                //   borderSide: const BorderSide(color: Colors.white),
                //   borderRadius: BorderRadius.circular(20),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food Menu',
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () {
                    navigateToFoodDetails(index);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

          //popular food
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'lib/images/salmon_eggs.png',
                      height: 60,
                    ),

                    const SizedBox(width: 25),

                    // name and price

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          'Salmon Eggs',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        const SizedBox(height: 25),

                        //price
                        Text(
                          '\$21.00',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // heart icon
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
