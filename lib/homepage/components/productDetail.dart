import 'package:app_ecommerce/model/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class ProductDetail extends StatefulWidget {
  // int selectIndex = 2;
  static String routeName = "/product_detail_screen";

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     _topNav(context),
    //     _sliderProductDetail(context),
    //     _productInfo(context)
    //   ],
    // );
    return Scaffold(
      body: Column(
        children: [
          _topNav(context),
          _sliderProductDetail(context),
          _productInfo(context)
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

///// here !!!!!!!!!!!! //////////
Widget _productInfo(BuildContext context) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          ),
          margin: EdgeInsets.only(top: 7),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 357,
          // height: 402,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
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
              //// Here Now ////
              Flexible(
                child: DefaultTabController(
                  length: 3,

                  /// số lượng
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints.expand(height: 50),
                        child: TabBar(
                          tabs: [
                            Tab(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Shop",
                                  style: TextStyle(
                                      color: Color.fromRGBO(80, 80, 80, 80),
                                      fontSize: 22.0),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints.expand(),
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                      color: Color.fromRGBO(80, 80, 80, 80),
                                      fontSize: 22.0),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints.expand(),
                                child: Text(
                                  "Features",
                                  style: TextStyle(
                                      color: Color.fromRGBO(80, 80, 80, 80),
                                      fontSize: 22.0),
                                ),
                              ),
                            ),
                          ],

                          ///chỉnh hiệu ứng chuyển đổi ///
                          // indicator: ShapeDecoration (
                          //     shape: UnderlineInputBorder (
                          //         borderSide: BorderSide(
                          //             color: Colors.transparent,
                          //             width: 0,
                          //             style: BorderStyle.solid
                          //         )
                          //     ),
                          //     gradient: LinearGradient(colors: [Color(0xff0081ff), Color(0xff01ff80)])
                          // )
                          ///chỉnh hiệu ứng chuyển đổi ///
                        ),
                      ),
                      Expanded(
                        child: TabBarView(

                            /// nội dung từng tabbar ứng với thứ tự
                            children: [
                              Container(
                                  child: Column(
                                children: [
                                  Text("helo\lo"),
                                  Text("hihihi"),
                                ],
                              )),
                              Container(
                                child: Text("deatial An"),
                              ),
                              Container(
                                child: Text("Future An"),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),

              /// này sử dụng thư viện  contained_tab_bar_view: 0.7.1

              // Expanded(
              //   child: Container(
              //     padding: const EdgeInsets.all(8.0),
              //     color: Colors.blue,
              //
              //     child: ContainedTabBarView(
              //       tabs: [
              //         Text('First'),
              //         Text('Second')
              //       ],
              //       views: [
              //         Container(color: Colors.red),
              //         Container(color: Colors.green)
              //       ],
              //       onChange: (index) => print(index),
              //     ),
              //   ),
              // ),
              /// này sử dụng thư viện  contained_tab_bar_view: 0.7.1

              //// here Now ///

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      "Select color and capacity",
                      style: TextStyle(
                          fontSize: 16, color: const Color(0xff010035)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20, top: 10),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    // height: 40,
                    width: 355,
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffFF6E4E)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "1.500.000",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
//////// here !!!!!!!! /////
