import 'package:app_ecommerce/checkoutPage/checkout.dart';
import 'package:app_ecommerce/homepage/homepage.dart';
import 'package:app_ecommerce/model/carts.dart';
import 'package:app_ecommerce/utli/Utility.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  int selectIndex = 2;
  static String routeName = "/cart_screen";
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartdetails = Cart().getCart();
  double sum = 0.0;
  var formatNum = NumberFormat("#,###", "it-IT");
  List<TextEditingController> _controllers = new List();
  double defaultSum = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartdetails.forEach((carttem) {
      sum += int.parse(carttem.price) * carttem.quantity;
    });
    defaultSum = sum;
  }

  @override
  Widget build(BuildContext context) {
    // _controllers.add(new TextEditingController());
    // text: cartdetails[index].quantity.toString()));
    return Scaffold(
      body: Column(
        children: [
          topNav(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                  "Total: ",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: const Color(0xFFFF6E4E),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  formatNum.format(sum) + "₫",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                        color: const Color(0xff010035),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)),
                      ),
                      height: MediaQuery.of(context).size.height - 247,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartdetails.length,
                          itemBuilder: (context, index) {
                            _controllers.add(new TextEditingController(
                                text: cartdetails[index].quantity.toString()));
                            return Column(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.all(16),
                                  child: Row(children: [
                                    TextButton(
                                      child: Icon(
                                        Icons.delete_outlined,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          cartdetails.removeAt(index);
                                          sum = 0.0;
                                          cartdetails.forEach((product) {
                                            sum =
                                                sum + int.parse(product.price);
                                          });
                                          if (cartdetails.length == 0) {
                                            Navigator.pushReplacementNamed(
                                                context, HomePage.routeName);
                                            AlertDialog alert = AlertDialog(
                                              title: Text("Cart Empty"),
                                              content:
                                                  Text("Your cart is empty"),
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
                                    Container(
                                      height: 111,
                                      width: 89,
                                      decoration: new BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Utility.imageFromBase64String(
                                          cartdetails[index].image),
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(cartdetails[index].productName,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Text(
                                            formatNum
                                                    .format(int.parse(
                                                        cartdetails[index]
                                                            .price))
                                                    .toString() +
                                                "₫",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xffFF6E4E))),
                                      ],
                                    )),
                                    Expanded(
                                      child: TextField(
                                        onChanged: (text) {
                                          cartdetails[index].quantity =
                                              int.parse(text);
                                          print(cartdetails[index].quantity);
                                        },
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        decoration: InputDecoration(
                                            fillColor: Colors.transparent,
                                            filled: true),
                                        controller: _controllers[index],
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          sum = 0;
                                          setState(() {
                                            cartdetails.forEach((element) {
                                              var total = element.quantity *
                                                  int.parse(element.price);
                                              sum += total;
                                              print(sum);
                                            });
                                          });
                                        },
                                        child: Text('Update')),
                                  ]),
                                ),
                                Divider()
                              ],
                            );
                          })),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: 80,
                  alignment: Alignment.center,
                  color: const Color(0xff010035),
                  child: Container(
                    height: 40,
                    width: 226,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffFF6E4E)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CheckoutPage()));
                      },
                      child: Text(
                        "Checkout",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ))
            ],
          )
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
