class Menu {
  final String name;
  final int carbohydrate;
  final int protein;
  final int fat;
  final int calories;

  Menu(
      {required this.name,
      required this.carbohydrate,
      required this.protein,
      required this.fat,
      required this.calories});
}

class Restaurant {
  final String name;
  final List<Menu> menu;
  final String key;

  Restaurant({
    required this.name,
    required this.menu,
    required this.key,
  });
}
