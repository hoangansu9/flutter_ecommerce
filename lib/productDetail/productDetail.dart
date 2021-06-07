import 'package:app_ecommerce/cartPage/cartPage.dart';
import 'package:app_ecommerce/model/products.dart';
import 'package:app_ecommerce/productDetail/components/bodyDetailProduct.dart';
import 'package:app_ecommerce/utli/Utility.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  static String routeName = "/product_detail_screen";
  final Products product;
  ProductDetail({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hotSale = [4];
    return Scaffold(
      body: Column(
        children: [
          _topNav(context),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      aspectRatio: 20 / 7,
                      viewportFraction: 0.7,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: hotSale.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: 250,
                            width: 220,
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              // child: Image(
                              //   fit: BoxFit.fill,
                              //   image: AssetImage(product.image),
                              // ),
                              child:
                                  Utility.imageFromBase64String(product.image),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ))
            ],
          ),
          BodyDetailProduct(product: product)
        ],
      ),
    );
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
          "Product Details",
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
      Container(
        height: 37,
        width: 37,
        decoration: BoxDecoration(
          color: const Color(0xffFF6E4E),
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.only(right: 46),
        child: IconButton(
          icon: const Icon(
            Icons.shopping_bag_outlined,
            size: 20,
          ),
          color: Colors.white,
          tooltip: "Giỏ hàng",
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new CartPage(),
              ),
            );
          },
        ),
      ),
    ],
  );
}
