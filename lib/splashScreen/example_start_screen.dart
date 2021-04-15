import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExampleStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          //row location
          Row(
            children: <Widget>[
              Container(
                  child: Row(
                children: [
                  Icon(
                    Icons.add_location_outlined,
                    color: const Color(0xFFFF6E4E),
                    size: 20.0,
                    semanticLabel: 'Location',
                  ),
                  Text(
                    "Q10, Hồ Chí Minh",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: const Color(0xFFB2B2B2),
                    size: 24.0,
                    semanticLabel: 'Location',
                  ),
                ],
              ))
            ],
          ),
          //row title
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 32.0,
                margin: const EdgeInsets.only(left: 17, top: 101),
                child: Text(
                  "Select Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 19.0,
                margin: const EdgeInsets.only(left: 100, top: 101),
                child: Text(
                  "view all",
                  style:
                      TextStyle(color: const Color(0xFFFF6E4E), fontSize: 15),
                ),
              ),
            ],
          ),
        ]));
  }
}
