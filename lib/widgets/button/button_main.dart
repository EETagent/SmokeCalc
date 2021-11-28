import 'package:flutter/material.dart';

class SmokeCalcMainButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SmokeCalcMainButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: const Color(0xff7878ab),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Image.asset(
        'assets/symbols/calculator.png',
        height: MediaQuery.of(context).size.width / 10,
      ),
      onPressed: onPressed,
      elevation: 4.0,
    );
  }
}
