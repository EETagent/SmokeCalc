import 'package:flutter/material.dart';

class SmokeCalcPriceText extends StatelessWidget {
  final int price;

  const SmokeCalcPriceText({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Kč",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              price.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        const Text("za krabičku"),
      ],
    );
  }
}
