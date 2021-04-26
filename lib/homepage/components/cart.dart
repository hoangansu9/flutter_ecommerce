import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class Data {
  Map fetchedData = {
    "data": [
      {"id": 111, "name": "abc"},
      {"id": 222, "name": "pqr"},
      {"id": 333, "name": "abc"}
    ]
  };
  List _data;

//function to fetch the data

  Data() {
    _data = fetchedData["data"];
  }

  int getId(int index) {
    return _data[index]["id"];
  }

  String getName(int index) {
    return _data[index]["name"];
  }

  int getLength() {
    return _data.length;
  }
}

class _CartState extends State<Cart> {
  Data _data = new Data();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView.builder(
          padding: const EdgeInsets.all(5.5),
          itemCount: _data.getLength(),
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return InkWell(
      child: Card(
        child: Center(
          child: Text(
            "${_data.getName(index)}",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
