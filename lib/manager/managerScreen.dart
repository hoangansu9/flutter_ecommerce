import 'package:app_ecommerce/manager/categories_manager.dart';
import 'package:drawer_component/drawer_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ManagerScreen extends StatefulWidget {
  static String routeName = "/manager_screen";
  ManagerScreen({Key key}) : super(key: key);
  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  final bool checkbox = true;
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
                    name: "contect",
                    textOverflow: TextOverflow.ellipsis,
                    child: CategoryManager(),
                    leading: Icon(Icons.contacts),
                    trailing: Icon(Icons.content_copy),
                    tileSize: 10,
                    tralingSelection: "Icon",
                    dividerheight: 5,
                    dividerThickness: 1,
                    dividercolor: Colors.black,
                  ),
                ],
              ),
            )));
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
