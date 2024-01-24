import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onTape,
  });

  final String text;
  final void Function()? onTape;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTape,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(109, 140, 94, 91),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            //icon
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
