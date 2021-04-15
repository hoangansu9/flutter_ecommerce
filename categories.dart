class Categories {
  final int id;
  final String title;
  final  String image;

  Categories({this.id, this.title, this.image});
  static List<Categories> init() {
    List<Categories> data = [
      Categories(id: 1, title: "Phones", image: "assets/phone.png"),
      Categories(id: 2, title: "Computers", image: "assets/computer.png"),
      Categories(id: 3, title: "Heals", image: "assets/health.png"),
      Categories(id: 4, title: "Books", image: "assets/books.png"),
      Categories(id: 5, title: "Stationery ", image: "assets/books.png"),
    ];
    return data;
  }
}
