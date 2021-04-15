import 'package:app_ecommerce/homepage/components/fragment/home_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import 'menuheader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeDetail(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF010035),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
            if (selectIndex != 3) {
              flag = true;
            } else {
              flag = false;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/point.png",
              color: Colors.white,
            ),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/bag.png",
              color: Colors.white,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/health.png",
              color: Colors.white,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/user.png",
              color: Colors.white,
            ),
            label: 'Account',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            screen[selectIndex]
          ],
        ),
      ),
    );
  }
}
