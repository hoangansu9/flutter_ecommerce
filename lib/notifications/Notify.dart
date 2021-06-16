import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  static String routerName = "/notify_screen";
  const Notify({Key key}) : super(key: key);

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 500,
              child: Column(
                children: [
                  Column(
                    children: [
                      Divider(height: 5.0),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(
                                image: AssetImage(
                                    'assets/images/galaxy21plus.jpg')),
                          ),
                          Expanded(
                            child: GestureDetector(
                                child: Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Notification 1',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  SizedBox(height: 5),
                                  Text(
                                      'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            )),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(height: 5.0),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(
                                image: AssetImage('assets/images/huawei.png')),
                          ),
                          Expanded(
                            child: GestureDetector(
                                child: Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Notification 1',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  SizedBox(height: 5),
                                  Text(
                                      'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            )),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(height: 5.0),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image(
                                image: AssetImage('assets/images/sony.png')),
                          ),
                          Expanded(
                            child: GestureDetector(
                                child: Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Notification 1',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  SizedBox(height: 5),
                                  Text(
                                      'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            )),
                          )
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
