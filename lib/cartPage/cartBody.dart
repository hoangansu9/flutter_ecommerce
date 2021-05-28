import 'package:app_ecommerce/homepage/homepage.dart';
import 'package:app_ecommerce/model/carts.dart';
import 'package:app_ecommerce/model/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stepo/stepo.dart';

class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  List<Products> cartdetails = Cart().getCart();
  double sum = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartdetails.forEach((product) {
      sum = sum + product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: cartdetails.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                child: CartItem(
                  product: cartdetails[index],
                ),
                onTap: () {
                  setState(() {
                    cartdetails.removeAt(index);
                    sum = 0.0;
                    cartdetails.forEach((product) {
                      sum = sum + product.price;
                    });
                    if (cartdetails.length == 0) {
                      Navigator.pushReplacementNamed(
                          context, HomePage.routeName);
                      AlertDialog alert = AlertDialog(
                        title: Text("Cart Empty"),
                        content: Text("Your cart is empty"),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  });
                },
              ),
              Divider()
            ],
          );
        });
  }
}

class CartItem extends StatelessWidget {
  Products product;

  CartItem({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(16),
      child: Row(children: [
        Container(
          height: 111,
          width: 89,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Image.asset(
            product.image,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(product.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(product.price.toString() + " ₫",
                style: TextStyle(fontSize: 20, color: Color(0xffFF6E4E))),
          ],
        )),
        Expanded(
          child: Stepo(
            key: UniqueKey(),
            width: 90, //Optional
            backgroundColor: Colors.transparent, //Optional
            style: Style.horizontal, //Optional
            textColor: Colors.white, //Optional
            animationDuration: Duration(milliseconds: 300), //Optional
            iconColor: Colors.white, //Optional
            fontSize: 5, //Optional
            iconSize: 5, //Optional
            initialCounter: 1, //Optional
            lowerBound: 1, //Optional
            upperBound: 50, //Optional
            onIncrementClicked: (counter) {
              //Optional
              print("Increment clicked");
            },
            onDecrementClicked: (counter) {
              //Optional
              print("Decrement clicked");
            },
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Icon(
              Icons.delete_outlined,
              color: Colors.white,
            )),
      ]),
    );
  }
}
