import 'package:flutter/material.dart';

class SmokeCalcAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final double? borderRadius;

  const SmokeCalcAppBar(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _borderRadius = 30;
    if (borderRadius != null) {
      _borderRadius = borderRadius!;
    }
    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_borderRadius),
          bottomRight: Radius.circular(_borderRadius)),
      elevation: 20,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff3F4A62)),
            ),
            Text(
              subtitle.toUpperCase(),
              style:
                  const TextStyle(letterSpacing: 2, color: Color(0xff3F4A62)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
