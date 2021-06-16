import 'package:app_ecommerce/model/order.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class OrderManager extends StatefulWidget {
  @override
  _OrderManagerState createState() => new _OrderManagerState();
}

class _OrderManagerState extends State {
  List items = [];
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllOrder().then((orders) {
      setState(() {
        orders.forEach((order) {
          items.add(Order.fromMap(order));
        });
      });
    });
  }

  var formatNum = NumberFormat("#,###", "it-IT");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            child: _topNav(context),
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
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.remove_circle_outlined),
                              onPressed: () => _deleteOrder(
                                  context, items[position], position)),
                        ],
                      ),
                      title: Text(
                        '${items[position].name + items[position].phone}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].total}',
                        style: new TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void _deleteOrder(BuildContext context, Order order, int position) async {
    db.deleteOrder(order.id).then((cates) {
      setState(() {
        items.removeAt(position);
      });
    });
  }
}

Widget _topNav(BuildContext context) {
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
      Container(
        margin: EdgeInsets.only(left: 55),
        child: Text(
          "Category Manager",
          style: TextStyle(
            fontSize: 18,
            color: const Color(0xff010035),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(
        child: Text(""),
      ),
    ],
  );
}
