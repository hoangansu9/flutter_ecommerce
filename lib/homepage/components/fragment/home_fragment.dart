// import 'package:app_ecommerce/homepage/components/fragment/home_fragment_product.dart';
// import 'package:app_ecommerce/homepage/components/homeHotSales.dart';
import 'package:app_ecommerce/homepage/components/homeSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_fragment_categories.dart';

class HomeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          CategoriesStore(),
          HomeSearch(),
          // HomeHotSales(),
          // ProductPopular()
        ],
      ),
    );
  }
}
