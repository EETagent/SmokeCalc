import 'package:flutter/material.dart';

class SmokeCalcButton extends StatefulWidget {
  final int? id;
  final String title;
  final String subtitle;
  final bool? clicked;
  final Function(int) onPressed;

  const SmokeCalcButton(
      {Key? key,
      this.id,
      required this.title,
      required this.subtitle,
      this.clicked,
      required this.onPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SmokeCalcButtonState();
}

class _SmokeCalcButtonState extends State<SmokeCalcButton> {
  bool _clicked = false;

  @override
  void initState() {
    super.initState();
    if (widget.clicked != null) {
      _clicked = widget.clicked!;
    }
  }

  @override
  void didUpdateWidget(covariant SmokeCalcButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.clicked != null) {
      _clicked = widget.clicked!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: _clicked ? const Color(0xff7878ab) : Colors.white,
      elevation: 50,
      borderRadius: BorderRadius.circular(15.0),
      child: RawMaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        padding: EdgeInsets.symmetric(
            vertical: 10.0, horizontal: MediaQuery.of(context).size.width / 17),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          children: [
            Text(
              widget.title,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: MediaQuery.of(context).size.width / 25,
                  color: _clicked ? Colors.white : Colors.black),
            ),
            Text(
              widget.subtitle.toUpperCase(),
              maxLines: 1,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 40,
                  color: _clicked ? Colors.white : Colors.black),
            )
          ],
        ),
        onPressed: () {
          setState(() {
            _clicked = !_clicked;
          });
          if (widget.id != null) {
            widget.onPressed(widget.id!);
          } else {
            widget.onPressed(0);
          }
        },
        elevation: 4.0,
      ),
    );
  }
}
