import 'package:app_ecommerce/cartPage/cartPage.dart';
import 'package:app_ecommerce/favoritesPage/FavoritesPage.dart';
import 'package:app_ecommerce/model/carts.dart';
import 'package:app_ecommerce/model/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icon.dart';

import 'package:rating_bar/rating_bar.dart';


// ignore: must_be_immutable
class BodyDetailProduct extends StatelessWidget {
  Products product;

  BodyDetailProduct({this.product});

  List<String> savedWords = <String>[];

  @override
  Widget build(BuildContext  context) {


    bool isSaved = false;
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
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height - 357,
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
                            product.name,
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
/////////////////////////////
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        // icon: LineIcon.heartAlt(
                        //   size: 18,
                        //
                        // ),

                        color: isSaved ? Colors.red : Colors.white,

                        icon: isSaved
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border),
                        // color: Colors.white,
                        tooltip: "Likes",
                        onPressed: () {
                          !savedWords.contains(product.name) ? savedWords.add(product.name) : savedWords.remove(product.name);
                            // pushToFavoriteWordsRoute(context);

                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(savedWords.contains(product.name) ? 'Added to favorites.' : 'Removed from favorites.'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },

                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: RatingBar.readOnly(
                        initialRating: 3.5,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledColor: Colors.yellow,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        size: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: DefaultTabController(
                    length: 3,

                    /// số lượng
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints.expand(height: 50),
                          padding: const EdgeInsets.only(left: 27, right: 27),
                          child: TabBar(
                            unselectedLabelColor: Color(0xffff00a8),
                            indicatorColor: Color(0xffFF6E4E),
                            labelColor: Color(0xff010035),
                            tabs: [
                              Tab(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Shop",
                                    style: TextStyle(
                                        color: Color.fromRGBO(80, 80, 80, 80),
                                        fontSize: 20.0),
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
                                        fontSize: 20.0),
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
                                        fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(

                            /// nội dung từng tabbar ứng với thứ tự
                              children: [
                                Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(bottom: 5),
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      'assets/component.png'),
                                                ),
                                                Text(
                                                  product.chip,
                                                  style: TextStyle(
                                                      color: Color(0xffB7B7B7)),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(bottom: 5),
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      'assets/camera.png'),
                                                ),
                                                Text(
                                                  product.camera,
                                                  style: TextStyle(
                                                      color: Color(0xffB7B7B7)),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(bottom: 5),
                                                  height: 30,
                                                  width: 30,
                                                  child:
                                                  Image.asset('assets/ram.png'),
                                                ),
                                                Text(
                                                  product.ram,
                                                  style: TextStyle(
                                                      color: Color(0xffB7B7B7)),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(bottom: 5),
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      'assets/memory.png'),
                                                ),
                                                Text(
                                                  product.storage,
                                                  style: TextStyle(
                                                      color: Color(0xffB7B7B7)),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    product.details,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    product.features,
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
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
                                product.storage,
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
                                style:
                                TextStyle(color: const Color(0xff8D8D8D)),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()));
                            Cart cart = Cart();
                            cart.addProductToCart(product);
                            print(cart
                                .getCart()
                                .length
                                .toString());
                            Fluttertoast.showToast(
                                msg: "Add to cart",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
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
                                margin: EdgeInsets.only(
                                    left: 20, top: 5, bottom: 5),
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text(
                                  product.price.toString(),
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
  Future pushToFavoriteWordsRoute(BuildContext context) {

    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FavoritesPage(
          favoriteItems: savedWords,
        ),
      ),
    );
  }
}

