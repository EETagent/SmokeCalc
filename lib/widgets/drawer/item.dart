import 'package:flutter/material.dart';

class SmokeCalcDrawerItem extends StatelessWidget {
  final String asset;

  final String price;
  final String description;

  const SmokeCalcDrawerItem(
      {Key? key,
      required this.asset,
      required this.price,
      required this.description})
      : super(key: key);

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
            Row(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(asset),
                    radius: MediaQuery.of(context).size.height / 20,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              price,
                              style: const TextStyle(
                                  color: Color(0xff3f4a62),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text("Kč")
                          ],
                        ),
                        Text(
                          description,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
