import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_app_truonghoangtuan/cart/cartpage.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 32),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(40.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                focusColor: Colors.white,
                filled: true,
                fillColor: Colors.white,
                hintText: "Search",
                hintStyle: TextStyle(
                    fontSize: 16,
                    color: const Color(0xff010035).withOpacity(0.5)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.search,
                    size: 24,
                    color: const Color(0xffFF6E4E),
                  ),
                )),
          ),
        )),
        GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, CartPage.routeName);
          },
          child: Container(
              padding: EdgeInsets.zero,
              child: Image.asset("assets/explaned.png")),
        )
      ],
    );
  }
}
