import 'dart:ffi';

import 'package:app_ecommerce/utli/constant.dart';

class Product {
  int id;
  String _productName;
  String _productImageUrl;
  Float _productPrice;
  bool _isDiscount;
  Float _discountPrice;
  String _productDescription;

  Product(this.id, this._productName, this._productImageUrl, this._productPrice,
      this._isDiscount, this._discountPrice, this._productDescription);
  Product.map(dynamic object) {
    this._productName = object[Constant.PRODUCT_ID];
    this._productImageUrl = object[Constant.PRODUCT_IMAGE_URL];
    this._productPrice = object[Constant.PRODUCT_PRICE];
    this._isDiscount = object[Constant.PRODUCT_IS_DISCOUNT];
    this._discountPrice = object[Constant.PRODUCT_DISCOUNT_PRICE];
    this._productDescription = object[Constant.PRODUCT_DESCRIPTION];
  }

  String get productName => _productName;
  String get productImageUrl => _productImageUrl;
  Float get productPrice => _productPrice;
  bool get isDiscount => _isDiscount;
  Float get discountPrice => _discountPrice;
  String get productDescription => _productDescription;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map[Constant.PRODUCT_ID] = _productName;
    map[Constant.PRODUCT_IMAGE_URL] = _productImageUrl;
    map[Constant.PRODUCT_PRICE] = _productPrice;
    map[Constant.PRODUCT_IS_DISCOUNT] = _isDiscount;
    map[Constant.PRODUCT_DISCOUNT_PRICE] = _discountPrice;
    map[Constant.PRODUCT_DESCRIPTION] = _productDescription;

    return map;
  }

  void setProductID(int id) {
    this.id = id;
  }
}
