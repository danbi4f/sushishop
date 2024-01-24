import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            //shop name
            Text(
              'SUSHI MAN',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            // icon image
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset('lib/images/salmon_eggs.png'),
            ),
            const SizedBox(height: 25),
            //title
            Text(
              'THE TASTE OF JAPANES FOOD',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            //subtitle
            Text(
              'Feel the taste of the moste popular Japanese food form anywhere and anytime',
              style: TextStyle(
                color: Colors.grey[400],
                height: 2,
              ),
            ),
            //get started button
            MyButton(
              text: 'Get Started',
              onTape: () {
                // go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
