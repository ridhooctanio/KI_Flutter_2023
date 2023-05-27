class Item {
  String name;
  String description;
  String imageURL;

  Item({required this.name, required this.description, required this.imageURL});

  setData(
      {required String name,
      required String description,
      required String imageURL}) {
    this.name = name;
    this.description = description;
    this.imageURL = imageURL;
  }
}
