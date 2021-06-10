import 'package:flutter/material.dart';

import 'components/body.dart';

class CategoryPage extends StatelessWidget {
  static String routeName = '/category_page';
  final int idCate;
  CategoryPage({Key key, this.idCate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Body(idCate);
  }
}
