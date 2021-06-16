import 'package:app_ecommerce/model/products.dart';

class CartItem {
  int _id;
  String _productName;
  String _price;
  String _image;
  int _quantity;

  CartItem(this._productName, this._price, this._quantity, this._image);
  CartItem.map(dynamic obj) {
    this._id = obj['id'];
    this._productName = obj['productName'];
    this._price = obj['price'];
    this._quantity = obj['quantity'];
    this._image = obj['image'];
  }

  int get id => _id;
  String get productName => _productName;
  String get price => _price;
  int get quantity => _quantity;
  String get image => _image;

  set quantity(int quantity) {
    this._quantity = quantity;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['productName'] = _productName;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['image'] = _image;
    return map;
  }

  CartItem.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._productName = map['productName'];
    this._price = map['price'];
    this._quantity = map['quantity'];
    this._image = map['image'];
  }
}

class Cart {
  static List<CartItem> cart = [];
  void addProductToCart(Products product) {
    CartItem a = new CartItem(product.name, product.price, 1, product.image);
    cart.add(a);
  }

  List<CartItem> getCart() {
    return cart;
  }
}
