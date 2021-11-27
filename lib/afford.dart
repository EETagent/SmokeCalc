class SmokeCalcAfford extends Object {
  final int price;
  final String imageName;

  final String name;
  final String description;

  const SmokeCalcAfford(
      {required this.price,
      required this.imageName,
      required this.name,
      required this.description});

  bool isPriceOver(int priceIn) {
    return priceIn >= price;
  }

  String priceToString() {
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
}
