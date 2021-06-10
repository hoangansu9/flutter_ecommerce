import 'package:app_ecommerce/model/products.dart';
import 'package:app_ecommerce/productDetail/productDetail.dart';
import 'package:app_ecommerce/utli/Utility.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  int cateID;
  Products product;

  CategoryForm(this.cateID);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  List productsList = [];
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getProductByCate(widget.cateID).then((products) {
      setState(() {
        products.forEach((prod) {
          productsList.add(Products.fromMap(prod));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _topNav(context),
      ListView.builder(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(product: productsList[index])));
              },
              leading: Utility.imageFromBase64String(productsList[index].image),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productsList[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              subtitle: Text(productsList[index].details),
              selected: true,
              trailing: Text(productsList[index].price.toString()),
            );
          }),
    ]);
  }
}

Widget _topNav(BuildContext context) {
  return Row(
    children: [
      SizedBox(
        height: 100,
      ),
      Container(
        height: 37,
        width: 37,
        margin: EdgeInsets.only(left: 42),
        decoration: BoxDecoration(
          color: const Color(0xff010035),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.arrow_left_sharp,
            size: 30,
          ),
          color: Colors.white,
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 55),
        child: Text(
          "Category Manager",
          style: TextStyle(
            fontSize: 18,
            color: const Color(0xff010035),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(
        child: Text(""),
      ),
    ],
  );
}
