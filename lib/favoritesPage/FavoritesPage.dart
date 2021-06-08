import 'package:app_ecommerce/model/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      // body: Consumer<Favorites>(
      //   builder: (context, value, child) => ListView.builder(
      //     itemCount: value.items.length,
      //     padding: const EdgeInsets.symmetric(vertical: 16),
      //     itemBuilder: (context, index) => FavoriteItemTile(value.items[index]),
      //   ),
      // ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final int product;

  const FavoriteItemTile(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[product % Colors.primaries.length],
        ),
        title: Text(
          'Colors $product.id', // chỗ này cậu trỏ thông tin product
          key: Key('favorites_text_$product'), // id
        ),
        trailing: IconButton(
          key: Key('remove_icon_$product'),
          icon: Icon(Icons.close),
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).remove(product);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
