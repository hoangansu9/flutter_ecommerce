import 'package:app_ecommerce/model/hotsales.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeHotSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hotSale = HotSales.init();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 32.0,
                          margin: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Hot Seller",
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
                          style: TextStyle(
                              color: const Color(0xFFFF6E4E), fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 132,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: hotSale.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: Image.asset(i.image));
                      },
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }
}
