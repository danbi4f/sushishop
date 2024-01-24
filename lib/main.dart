import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/pages/card_pages.dart';
import 'package:sushishop/pages/intro_page.dart';
import 'package:sushishop/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cardpage': (context) => const CardPage(),
      },
    );
  }
}
