import 'package:flutter/material.dart';

class SmokeCalcCountButton extends StatefulWidget {
  final int? price;
  final Function(int count) onPressed;

  const SmokeCalcCountButton({Key? key, this.price, required this.onPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SmokeCalcCountButtonState();
}

class _SmokeCalcCountButtonState extends State<SmokeCalcCountButton> {
  int _price = 0;
  @override
  void initState() {
    super.initState();
    if (widget.price != null) {
      _price = widget.price!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        color: Colors.white,
        elevation: 50,
        borderRadius: BorderRadius.circular(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: SmokeCalcButtonSingle(
                    icon: '-',
                    onPressed: () {
                      setState(() {
                        _price--;
                        widget.onPressed(_price);
                      });
                    })),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _price.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 45),
                ),
              ),
            ),
            Flexible(
                child: SmokeCalcButtonSingle(
                    icon: '+',
                    onPressed: () {
                      setState(() {
                        _price++;
                        widget.onPressed(_price);
                      });
                    }))
          ],
        ));
  }
}

class SmokeCalcButtonSingle extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  const SmokeCalcButtonSingle(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: Colors.white,
      padding: const EdgeInsets.all(10.0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Text(
        icon,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width / 40),
        maxLines: 1,
      ),
      onPressed: onPressed,
      elevation: 4.0,
    );
  }
}
