import 'package:app_ecommerce/cartPage/cartPage.dart';
import 'package:app_ecommerce/favoritesPage/FavoritesPage.dart';
import 'package:app_ecommerce/homepage/components/fragment/home_fragment.dart';
import 'package:app_ecommerce/model/carts.dart';
import 'package:app_ecommerce/notifications/Notify.dart';
import 'package:app_ecommerce/profile.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

// import 'menuheader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int total;
  int _selectedIndex = 0;
  int badge = 2;
  List<Widget> screen = [HomeDetail(), Notify(), CartPage(), Profile()];

  @override
  Widget build(BuildContext context) {
    total = Cart.cart.length;
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
                    icon: LineIcons.bell,
                    iconColor: Colors.white,
                    text: 'Notify'
                  ),
                  GButton(
                    icon: LineIcons.shoppingBag,
                    iconColor: Colors.white,
                    text: 'Cart',
                    leading: _selectedIndex == 2 || total == 0
                        ? null
                        : Badge(
                            badgeColor: Colors.red.shade100,
                            elevation: 0,
                            position: BadgePosition.topEnd(top: -12, end: -12),
                            badgeContent: Text(
                              total.toString(),
                              style: TextStyle(color: Colors.red.shade900),
                            ),
                            child: Icon(LineIcons.shoppingBag,
                                size: 20, color: Colors.white)),
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
                        MaterialPageRoute(builder: (context) => CartPage()),
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
