import 'package:app_ecommerce/homepage/components/body.dart';
import 'package:app_ecommerce/splashScreen/animation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int selectIndex = 0;
  static String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    // return Body();
    return Material(
        child: Stack(children: <Widget>[
      Scaffold(body: Body()),
      IgnorePointer(
          child: AnimationScreen(color: Theme.of(context).accentColor))
    ]));
  }
}
