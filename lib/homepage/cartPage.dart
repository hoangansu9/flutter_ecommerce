import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cartpage extends StatefulWidget {
  int selectIndex = 2;
  static String routeName = "/cart_screen";
  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: ListView(children: [topNav(context), myCart(context)]),
    // );
    //
    return Scaffold(
      body: Column(
        children: [
          topNav(context),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff010035),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      color: const Color(0xff010035),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    height: 480,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green,
                    child: _myListView(context),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget topNav(BuildContext context) {
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
      Expanded(
        child: Text(""),
      ),
      Container(
        margin: EdgeInsets.only(right: 20),
        child: Text(
          "Add address",
          style: TextStyle(
            color: const Color(0xff010035),
            fontWeight: FontWeight.w500,
          ),
        ),
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
            Icons.location_on_outlined,
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

Widget _myListView(BuildContext context) {
  final titles = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk'
  ];

  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_railway,
    Icons.directions_run,
    Icons.directions_subway,
    Icons.directions_transit,
    Icons.directions_walk
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.transparent,
        child: ListTile(
          leading: Icon(
            icons[index],
            color: Colors.white,
          ),
          title: Text(
            titles[index],
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    },
  );
}
