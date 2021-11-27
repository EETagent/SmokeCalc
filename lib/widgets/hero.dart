import 'package:flutter/material.dart';

class SmokeCalcHero extends StatelessWidget {
  final String asset;

  const SmokeCalcHero({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 20,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              height: 120,
            )
          ],
        ),
      ),
    );
  }
}
