class HotSales {
  int id;
  String title;
  String image;

  HotSales({this.id, this.title, this.image});
  static List<HotSales> init() {
    List<HotSales> data = [
      HotSales(id: 1, title: "Phones", image: "assets/iphone12.png"),
      HotSales(id: 2, title: "Computers", image: "assets/iphone12.png"),
      HotSales(id: 3, title: "Heals", image: "assets/iphone12.png"),
      HotSales(id: 4, title: "Books", image: "assets/iphone12.png"),
      HotSales(id: 5, title: "Stationery ", image: "assets/iphone12.png"),
    ];
    return data;
  }
}
