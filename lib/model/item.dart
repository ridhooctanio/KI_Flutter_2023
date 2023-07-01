class Item {
  String name;
  String description;
  String image;

  Item({required this.name, required this.description, required this.image});

  setData(
      {required String name,
      required String description,
      required String image}) {
    this.name = name;
    this.description = description;
    this.image = image;
  }
}
