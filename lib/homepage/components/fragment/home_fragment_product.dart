import 'package:app_ecommerce/homepage/components/productDetail.dart';
import 'package:app_ecommerce/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductPopular extends StatelessWidget {
  final products = Products.init();

  @override
  Widget build(BuildContext context) {
    //  var productsAPI = Utilities().getProducts();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 32.0,
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Best Seller",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                height: 19.0,
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  "see more",
                  style:
                      TextStyle(color: const Color(0xFFFF6E4E), fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 11,
                      childAspectRatio: 0.76),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: products[index],
                    );
                  })),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  Products product;

  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    if (product.image != null) {}
    return GestureDetector(
      onTap: () {
        //print(product.id.toString());
        //  Utilities.data.add(product);
        // Navigator.pushNamed(context, ProductPage.routeName,
        //     arguments: ProductDetailsArguments(product: product));
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductDetail()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 227,
              width: 181,
              decoration: new BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: new BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 160,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Image.asset(
                      "assets/favo1.png",
                      fit: BoxFit.fill,
                    ),
                  ]),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 21, top: 5),
                        child: Text(
                          product.price.toString() + "₫",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      // Expanded(child: Text(product.title)),
                      Container(
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.only(left: 21),
                          child: Text(
                            product.title.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: const Color(0xff010035),
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
