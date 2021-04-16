import 'package:app_ecommerce/model/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topNav(context),
        _sliderProductDetail(context),
        _productInfo(context)
      ],
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
          onPressed: () {},
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
          tooltip: "Nơi giao hàng",
          onPressed: () {},
        ),
      ),
    ],
  );
}

Widget _sliderProductDetail(BuildContext context) {
  final hotSale = Products.init();
  return Row(
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
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(i.image),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ))
    ],
  );
}

Widget _productInfo(BuildContext context) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.only(top: 7),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        height: 320,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(top: 28, left: 30),
                  child: Text(
                    "Galaxy Note 20 Ultra",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff010035)),
                  ),
                )),
                Container(
                  height: 37,
                  width: 37,
                  margin: EdgeInsets.only(right: 37, top: 28),
                  decoration: BoxDecoration(
                    color: const Color(0xff010035),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: LineIcon.heart(
                      size: 18,
                    ),
                    color: Colors.white,
                    tooltip: "Likes",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Giờ chưa làm TabBar được nên để đó. Ahihi!!!"),
                ),
              ],
            ),
            Expanded(
                child: SizedBox(
              height: 20,
            )),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "Select color and capacity",
                    style:
                        TextStyle(fontSize: 16, color: const Color(0xff010035)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 35),
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          color: const Color(0xff772D03),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: IconButton(
                          icon: LineIcon.check(),
                          color: Colors.white,
                          iconSize: 19,
                          onPressed: () {},
                        )),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 18),
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          color: const Color(0xff010035),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: IconButton(
                          icon: LineIcon.check(),
                          color: const Color(0xff010035),
                          iconSize: 19,
                          onPressed: () {},
                        )),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 58),
                        height: 30,
                        width: 71,
                        decoration: BoxDecoration(
                          color: const Color(0xffFF6E4E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          child: Text(
                            "128 GB",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        )),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 18),
                        height: 30,
                        width: 71,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          child: Text(
                            "256 GB",
                            style: TextStyle(color: const Color(0xff8D8D8D)),
                          ),
                          onPressed: () {},
                        )),
                  ],
                )
              ],
            ),
          ],
        ),
      )
    ],
  );
}
