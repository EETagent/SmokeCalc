import 'package:flutter/material.dart';
import 'package:smokecalc/widgets/drawer/item.dart';

import '../../const.dart';

class SmokeCalcDrawer extends StatefulWidget {
  final bool selected;
  final double? borderRadius;

  final int money;
  final int years;

  final VoidCallback onPressed;

  const SmokeCalcDrawer(
      {Key? key,
      required this.selected,
      this.borderRadius,
      required this.money,
      required this.years,
      required this.onPressed})
      : super(key: key);

  @override
  State<SmokeCalcDrawer> createState() => _SmokeCalcDrawerState();
}

class _SmokeCalcDrawerState extends State<SmokeCalcDrawer> {
  double _borderRadius = 30;

  @override
  void initState() {
    super.initState();
    if (widget.borderRadius != null) {
      _borderRadius = widget.borderRadius!;
    }
  }

  String _priceToString(int price) {
    String priceString = price.toString();
    if (priceString.length > 2) {
      String value = priceString;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
      return value;
    } else {
      return priceString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            AnimatedPositioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              bottom:
                  widget.selected ? 0 : -(MediaQuery.of(context).size.height),
              duration: Duration(seconds: widget.selected ? 1 : 2),
              curve: Curves.fastOutSlowIn,
              child: Container(
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
            AnimatedPositioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              bottom:
                  widget.selected ? 0 : -(MediaQuery.of(context).size.height),
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: PhysicalModel(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    topRight: Radius.circular(_borderRadius)),
                elevation: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _priceToString(widget.money),
                            style: const TextStyle(
                                color: Color(0xff3f4a62),
                                fontSize: 60,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            widget.years == 1
                                ? 'KORUN ZA CELKOVÝ 1 ROK KOUŘENÍ'
                                : widget.years <= 4 && widget.years >= 2
                                    ? 'KORUN ZA CELKOVÉ ${widget.years} ROKY KOUŘENÍ'
                                    : 'KORUN ZA CELKOVÝCH ${widget.years} LET KOUŘENÍ',
                            style: const TextStyle(
                                letterSpacing: 2, color: Color(0xff3f4a62)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                          children: affordItems
                              .where((item) => item.isPriceOver(widget.money))
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SmokeCalcDrawerItem(
                                      asset: e.imageName,
                                      price: e.priceToString(),
                                      description: e.description,
                                    ),
                                  ))
                              .toList()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
