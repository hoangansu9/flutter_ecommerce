import 'package:app_ecommerce/homepage/cartPage.dart';
import 'package:app_ecommerce/homepage/components/fragment/home_fragment.dart';
import 'package:app_ecommerce/homepage/components/productDetail.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

// import 'menuheader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;
  int badge = 2;
  List<Widget> screen = [HomeDetail(), Cartpage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xff010035),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.transparent,
                hoverColor: Colors.white,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.transparent,
                tabs: [
                  GButton(
                    icon: LineIcons.dotCircle,
                    text: 'Exploer',
                    iconColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    iconColor: Colors.white,
                    text: 'Likes',
                    leading: _selectedIndex == 1 || badge == 0
                        ? null
                        : Badge(
                            badgeColor: Colors.red.shade100,
                            elevation: 0,
                            position: BadgePosition.topEnd(top: -12, end: -12),
                            badgeContent: Text(
                              badge.toString(),
                              style: TextStyle(color: Colors.red.shade900),
                            ),
                            child: Icon(LineIcons.heart,
                                size: 20, color: Colors.white)),
                  ),
                  GButton(
                    icon: LineIcons.shoppingBag,
                    iconColor: Colors.white,
                    text: 'Cart',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    iconColor: Colors.white,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  // setState(() {
                  // _selectedIndex = index;
                  setState(() {
                    if (index == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Cartpage()),
                      );
                    } else {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }
                    // }
                  });
                }),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            screen[_selectedIndex]
          ],
        ),
      ),
    );
  }
}
