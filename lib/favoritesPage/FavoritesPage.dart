import 'package:app_ecommerce/model/favorites.dart';
import 'package:app_ecommerce/model/products.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';


class FavoritesPage extends StatefulWidget {
  final List<String> favoriteItems;


  const FavoritesPage({Key key, @required this.favoriteItems}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites '),
      ),
      body: ListView.separated(
        itemCount: widget.favoriteItems.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) => ListTile(
          title:  Text(widget.favoriteItems[index]),
        ),
      ),
    );
  }
}

