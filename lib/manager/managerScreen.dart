import 'package:app_ecommerce/manager/Items/products.dart';
import 'package:app_ecommerce/manager/categories_manager.dart';
import 'package:app_ecommerce/manager/order_manager.dart';
import 'package:app_ecommerce/model/products.dart';
import 'package:app_ecommerce/utli/Utility.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:drawer_component/drawer_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ManagerScreen extends StatefulWidget {
  static String routeName = "/manager_screen";
  ManagerScreen({Key key}) : super(key: key);
  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  List items = [];
  DatabaseHelper db = new DatabaseHelper();
  int count = 0;
  @override
  void initState() {
    super.initState();

    db.getAllProduct().then((products) {
      setState(() {
        products.forEach((product) {
          items.add(Products.fromMap(product));
        });
      });
    });
    db.getCountProduct().then((products) {
      setState(() {
        count = products;
      });
    });
  }

  final bool checkbox = true;
  var formatNum = NumberFormat("#,###", "it-IT");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
      appBar: AppBar(
        title: Text("Manager"),
        flexibleSpace: Container(
          child: _topNav(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffFF6E4E), Color(0xff010035)],
              stops: [0.15, 1],
            ),
          ),
        ),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            DrawerLogo(
              avatarBackgroundColor: Colors.white,
              circleAvatarImageurl:
                  "https://i.ytimg.com/vi/sK-8k1Dq1xM/hqdefault.jpg",
              checkNetworkAssets: true,
              color: Colors.blue,
              text: "qwerty",
              gradientCheck: true,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              gradientColors: [Color(0xffFF6E4E), Color(0xff010035)],
              avatarradius: 50,
            ),
            DrawerTile(
              name: "Category",
              textSize: 20,
              textColor: Color(0xff010035),
              textOverflow: TextOverflow.ellipsis,
              child: CategoryManager(),
              leading: Icon(Icons.category, color: Colors.blueGrey),
              tileSize: 10,
              dividerheight: 5,
              dividerThickness: 1,
              dividercolor: Colors.grey,
            ),
            DrawerTile(
              name: "Order",
              textSize: 20,
              textColor: Color(0xff010035),
              textOverflow: TextOverflow.ellipsis,
              child: OrderManager(),
              leading: Icon(Icons.category, color: Colors.blueGrey),
              tileSize: 10,
              dividerheight: 5,
              dividerThickness: 1,
              dividercolor: Colors.grey,
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: items.length,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (context, position) {
              return Column(
                children: [
                  Divider(height: 5.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(children: [
                      GestureDetector(
                        onTap: () =>
                            _navigateToProduct(context, items[position]),
                        child: Container(
                          height: 111,
                          width: 89,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Utility.imageFromBase64String(
                              items[position].image),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          
                            onTap: () =>
                                _navigateToProduct(context, items[position]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(items[position].name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                Text(
                                    formatNum
                                            .format(int.parse(
                                                items[position].price))
                                            .toString() +
                                        "₫",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffFF6E4E))),
                              ],
                            )),
                      ),
                      TextButton(
                          onPressed: () =>
                              _deleteProuct(context, items[position], position),
                          child: Icon(
                            Icons.delete_outlined,
                            color: Colors.black,
                          )),
                    ]),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createNewProduct(context),
      ),
    ));
  }

  // ignore: unused_element
  void _deleteProuct(
      BuildContext context, Products product, int position) async {
    db.deleteCate(product.id).then((products) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToProduct(BuildContext context, Products prod) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductScreen(prod)),
    );

    if (result == 'update') {
      db.getAllProduct().then((products) {
        setState(() {
          items.clear();
          products.forEach((note) {
            items.add(Products.fromMap(note));
          });
        });
      });
    }
  }

  void _createNewProduct(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductScreen(
              Products('', '', '', '', '', '', '', '', '', 1, ''))),
    );

    if (result == 'save') {
      db.getAllProduct().then((products) {
        setState(() {
          items.clear();
          products.forEach((prod) {
            items.add(Products.fromMap(prod));
          });
        });
      });
    }
  }
}

Widget _topNav(BuildContext context) {
  return Row(
    children: [
      SizedBox(
        height: 100,
      ),
      Expanded(
        child: Text(""),
      ),
      Container(
        height: 37,
        width: 37,
        margin: EdgeInsets.only(right: 42),
        decoration: BoxDecoration(
          color: const Color(0xffFF6E4E),
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
    ],
  );
}
