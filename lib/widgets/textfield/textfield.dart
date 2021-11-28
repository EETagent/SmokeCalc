import 'package:flutter/material.dart';

class SmokeCalcTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SmokeCalcTextField(
      {Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        scrollPadding: const EdgeInsets.all(0),
        controller: controller,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        expands: false,
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 40,
            color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          suffixIcon: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Image.asset(
                  'assets/symbols/cigarette.png',
                  height: 15,
                ),
              ),
            ),
          ),
          hintText: '10 cigaret'.toUpperCase(),
          hintStyle: const TextStyle(color: Colors.black54),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
