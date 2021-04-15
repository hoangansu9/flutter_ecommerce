import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cartpage extends StatefulWidget {
  int selectIndex = 1;
  static String routeName = "/cart_screen";
  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdsad'),
      ),
      body: Container(),
    );
  }
}
