import 'package:flutter/material.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class Favorites extends ChangeNotifier {
  final List<int> _favoriteItems = [];

  List<int> get product => _favoriteItems;

  void add(int product) {
    _favoriteItems.add(product);
    notifyListeners();
  }

  void remove(int product) {
    _favoriteItems.remove(product);
    notifyListeners();
  }
}
