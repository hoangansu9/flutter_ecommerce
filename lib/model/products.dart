class Products {
  int _id;
  String _name;
  String _image;
  String _chip;
  String _camera;
  String _ram;
  String _storage;
  String _details;
  String _features;
  double _price;
  int _categoryId;

  Products(
      this._name,
      this._image,
      this._chip,
      this._camera,
      this._ram,
      this._storage,
      this._details,
      this._features,
      this._price,
      this._categoryId);

  // static List<Products> init() {
  //   List<Products> data = [
  //     Products(
  //         id: 1,
  //         title: "Bread",
  //         description:
  //             "Founded as a bakery brand in Singapore in 2000 and listed on the SGX in 2003. It has since expanded to more than 1,000 retail stores spread across 17 markets. Its brand portfolio comprises BreadTalk, Toast Box, Food Republic, Food Junction, Din Tai Fung, Bread Society, Thye Moh Chan, The Icing Room, Sō and Nayuki in Singapore. Din Tai Fung, Song Fa Bak Kut Teh, Wu Pao Chun and Nayuki are franchised brands",
  //         image: "assets/images/galaxy21.jpg",
  //         price: 8.0),
  //     Products(
  //         id: 2,
  //         title: "Coffee",
  //         description:
  //             "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color – indicating ripeness – they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
  //         image: "assets/images/galaxy21plus.jpg",
  //         price: 8.0),
  //     Products(
  //         id: 3,
  //         title: "Tea",
  //         description:
  //             "Tea is an aromatic beverage commonly prepared by pouring hot or boiling water over cured or fresh leaves of the Camellia sinensis, an evergreen shrub native to East Asia.[3] After water, it is the most widely consumed drink in the world.[4] There are many different types of tea; some, like Darjeeling and Chinese greens, have a cooling, slightly bitter, and astringent flavour,[5] while others have vastly different profiles that include sweet, nutty, floral, or grassy notes. Tea has a stimulating effect in humans primarily by its caffeine conten",
  //         image: "assets/images/galaxys10.jfif",
  //         price: 8.0),
  //     Products(
  //         id: 4,
  //         title: "Bread",
  //         description:
  //             "Tea is an aromatic beverage commonly prepared by pouring hot or boiling water over cured or fresh leaves of the Camellia sinensis, an evergreen shrub native to East Asia.[3] After water, it is the most widely consumed drink in the world.[4] There are many different types of tea; some, like Darjeeling and Chinese greens, have a cooling, slightly bitter, and astringent flavour,[5] while others have vastly different profiles that include sweet, nutty, floral, or grassy notes. Tea has a stimulating effect in humans primarily by its caffeine conten",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //     Products(
  //         id: 5,
  //         title: "Coffee",
  //         description:
  //             "Founded as a bakery brand in Singapore in 2000 and listed on the SGX in 2003. It has since expanded to more than 1,000 retail stores spread across 17 markets. Its brand portfolio comprises BreadTalk, Toast Box, Food Republic, Food Junction, Din Tai Fung, Bread Society, Thye Moh Chan, The Icing Room, Sō and Nayuki in Singapore. Din Tai Fung, Song Fa Bak Kut Teh, Wu Pao Chun and Nayuki are franchised brands",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //     Products(
  //         id: 6,
  //         title: "milk & Tea",
  //         description:
  //             "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color – indicating ripeness – they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //     Products(
  //         id: 1,
  //         title: "Bread",
  //         description:
  //             "Founded as a bakery brand in Singapore in 2000 and listed on the SGX in 2003. It has since expanded to more than 1,000 retail stores spread across 17 markets. Its brand portfolio comprises BreadTalk, Toast Box, Food Republic, Food Junction, Din Tai Fung, Bread Society, Thye Moh Chan, The Icing Room, Sō and Nayuki in Singapore. Din Tai Fung, Song Fa Bak Kut Teh, Wu Pao Chun and Nayuki are franchised brands",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //     Products(
  //         id: 2,
  //         title: "Coffee",
  //         description:
  //             "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color – indicating ripeness – they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //     Products(
  //         id: 3,
  //         title: "Tea",
  //         description:
  //             "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color – indicating ripeness – they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //     Products(
  //         id: 4,
  //         title: "Bread",
  //         description:
  //             "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color – indicating ripeness – they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //     Products(
  //         id: 5,
  //         title: "Coffee",
  //         description:
  //             "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color – indicating ripeness – they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //     Products(
  //         id: 6,
  //         title: "milk & Tea",
  //         description:
  //             "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color – indicating ripeness – they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 8.0),
  //   ];
  //   return data;
  // }

  Products.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._chip = obj['chip'];
    this._camera = obj['camera'];
    this._ram = obj['ram'];
    this._storage = obj['storage'];
    this._details = obj['details'];
    this._features = obj['features'];
    this._price = obj['price'];
    this._categoryId = obj['categoryId'];
  }

  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get chip => _chip;
  String get camera => _camera;
  String get ram => _ram;
  String get storage => _storage;
  String get details => _details;
  String get features => _features;
  double get price => _price;
  int get categoryId => _categoryId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['image'] = _image;
    map['chip'] = _chip;
    map['camera'] = _camera;
    map['ram'] = _ram;
    map['storage'] = _storage;
    map['details'] = _details;
    map['features'] = _features;
    map['price'] = _price;
    map['categoryId'] = _categoryId;
    return map;
  }

  Products.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._chip = map['chip'];
    this._image = map['image'];
    this._camera = map['camera'];
    this._ram = map['ram'];
    this._storage = map['storage'];
    this._details = map['details'];
    this._features = map['features'];
    this._price = map['price'];
    this._categoryId = map['categoryId'];
  }
}
