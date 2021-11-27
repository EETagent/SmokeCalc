import 'package:flutter/material.dart';

import 'package:smokecalc/widgets/appbar/appbar.dart';
import 'package:smokecalc/widgets/hero.dart';
import 'package:smokecalc/widgets/button/button.dart';
import 'package:smokecalc/widgets/button/button_counter.dart';
import 'package:smokecalc/widgets/button/button_main.dart';
import 'package:smokecalc/widgets/text/price.dart';
import 'package:smokecalc/widgets/textfield/textfield.dart';
import 'package:smokecalc/widgets/drawer/drawer.dart';

import 'const.dart';

void main() {
  runApp(const SmokeCalc());
}

class SmokeCalc extends StatelessWidget {
  const SmokeCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmokeCalc',
      theme: ThemeData(fontFamily: "Poppins"),
      home: const SmokeCalcHomePage(),
    );
  }
}

class SmokeCalcHomePage extends StatefulWidget {
  const SmokeCalcHomePage({Key? key}) : super(key: key);

  @override
  State<SmokeCalcHomePage> createState() => _SmokeCalcHomePageState();
}

class _SmokeCalcHomePageState extends State<SmokeCalcHomePage> {
  int money = 0;
  int years = 0;

  String dateSelected = "1984";
  List<String> yearItems = [""];
  List<bool> selectedButtons = [false, false, false];

  TextEditingController controller = TextEditingController();

  bool showBottomMenu = false;
  int price = 120;

  @override
  void initState() {
    super.initState();
    final year = DateTime.now().year;
    yearItems = List<String>.generate(
        1 + year - int.parse(dateSelected), (i) => (1984 + i).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SmokeCalcAppBar(
        title: "SmokeCalc",
        subtitle: "Pro levnější a zdravější život",
      ),
      backgroundColor: const Color(0xffecf0f3),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 10,
                  right: MediaQuery.of(context).size.width / 10),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 40),
                    child:
                        SmokeCalcHero(asset: "assets/images/animated/hero.gif"),
                  ),
                  const Text(
                    "Počet krabiček za den:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff3F4A62)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: SmokeCalcButton(
                                  id: 0,
                                  title: "1",
                                  subtitle: "Krabička",
                                  onPressed: _selectionButtonClicked,
                                  clicked: selectedButtons[0])),
                          Flexible(
                            child: SmokeCalcButton(
                              id: 1,
                              title: "2",
                              subtitle: "Krabičky",
                              onPressed: _selectionButtonClicked,
                              clicked: selectedButtons[1],
                            ),
                          ),
                          Flexible(
                            child: SmokeCalcButton(
                              id: 2,
                              title: "3",
                              subtitle: "Krabičky",
                              onPressed: _selectionButtonClicked,
                              clicked: selectedButtons[2],
                            ),
                          ),
                        ],
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        FractionallySizedBox(
                            widthFactor: 2 / 3,
                            child: SmokeCalcTextField(
                              controller: controller,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SmokeCalcPriceText(price: price),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                              widthFactor: 5 / 9,
                              child: SmokeCalcCountButton(
                                price: 120,
                                onPressed: _changePrice,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DropdownButton(
                              dropdownColor: Colors.white,
                              value: dateSelected,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 42,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40),
                              underline: const SizedBox(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    dateSelected = newValue;
                                  }
                                });
                              },
                              items: yearItems.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child:
                        SmokeCalcMainButton(onPressed: _getWhatYouCouldAfford),
                  )),
                ],
              ),
            ),
            SmokeCalcDrawer(
              selected: showBottomMenu,
              onPressed: _toggleBottomDrawer,
              money: money,
              years: years,
            )
          ],
        ),
      ),
    );
  }

  void _selectionButtonClicked(int i) {
    setState(() {
      selectedButtons[i] = !selectedButtons[i];
      if (selectedButtons[i] == true) {
        controller.text = ((1 + i) * cigarettesPerBox).toString();
      } else {
        controller.text = "";
      }
      for (var p = 0; p < 3; p++) {
        if (p != i) {
          selectedButtons[p] = false;
        }
      }
    });
  }

  void _getWhatYouCouldAfford() {
    //TODO: Zatím to je hodně provizorní výpočet, třeba přidat inflaci
    if (controller.text != "") {
      int? cigaretteCount = int.tryParse(controller.text);

      if (cigaretteCount != null) {
        final int yearSelected = int.parse(dateSelected);
        final int yearNow = DateTime.now().year;

        final int _years = yearNow - yearSelected;

        final double perYear =
            (cigaretteCount / cigarettesPerBox) * price * 365;
        final int _money = (perYear * _years).toInt();

        setState(() {
          money = _money;
          years = _years;
        });
        _toggleBottomDrawer();
      }
    }
  }

  void _toggleBottomDrawer() {
    setState(() {
      showBottomMenu = !showBottomMenu;
    });
  }

  void _changePrice(int priceIn) {
    setState(() {
      price = priceIn;
    });
  }
}
