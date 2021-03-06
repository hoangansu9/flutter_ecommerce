import 'package:app_ecommerce/homepage/homepage.dart';
import 'package:app_ecommerce/model/carts.dart';
import 'package:app_ecommerce/model/order.dart';
import 'package:app_ecommerce/model/user.dart';
import 'package:app_ecommerce/utli/cacheHelper.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class CheckoutPage extends StatefulWidget {
  final String routerName = '/checkout_page';

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  DatabaseHelper db = new DatabaseHelper();
  DateTime localDate = DateTime.now();
  List<CartItem> cartdetails = Cart().getCart();
  Future<User> user = CacheHelper.getCurrentUser();
  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _addressController;
  double sum = 0;
  @override
  void initState() {
    super.initState();
    cartdetails.forEach((product) {
      sum += sum +
          int.parse(product.price) * int.parse(product.quantity.toString());
    });
    _nameController = new TextEditingController();
    _phoneController = new TextEditingController();
    _addressController = new TextEditingController();
  }

  var formatNum = NumberFormat("#,###", "it-IT");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            child: topNav(context),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Text(
              'Total: ${formatNum.format(sum).toString()} ₫',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            FutureBuilder(
                future: user,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  String textUserName =
                      snapshot.hasData ? snapshot.data.username : 'Loading...';
                  _nameController.text = textUserName;
                  return Text('UserName: ' + textUserName,
                      style: TextStyle(fontSize: 25, color: Colors.black));
                }),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            ElevatedButton(
              child: Text('Ok'),
              onPressed: () {
                db
                    .saveOrder(Order(
                        _nameController.text,
                        _phoneController.text,
                        _addressController.text,
                        sum.toString()))
                    .then((_) {
                  Cart.cart.clear();
                  Dialogs.bottomMaterialDialog(
                    context: context,
                    actions: [
                      IconsButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()),
                        ),
                        text: 'Ok',
                        color: const Color(0xffFF6E4E),
                        textStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                      ),
                    ],
                    customView: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            'Checkout Successfully!',
                            style: TextStyle(color: Colors.green, fontSize: 30),
                          ),
                        ),
                        Icon(Icons.check_circle_outline_outlined,
                            color: Colors.green, size: 50)
                      ],
                    ),
                  );
                });
              },
            ),
          ],
        ));
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
        margin: EdgeInsets.only(right: 60),
        child: Text(
          "Checkout",
          style: TextStyle(
              color: const Color(0xffFF6E4E),
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
      ),
      Expanded(
        child: Text(""),
      ),
    ],
  );
}
