import 'package:app_ecommerce/manager/managerScreen.dart';
import 'package:app_ecommerce/profle/screens/login-screen.dart';
import 'package:app_ecommerce/utli/cacheHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/user.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  int selectIndex = 3;
  static String routeName = "/profile_screen";
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Expanded(
      child: Mana(),
    );
  }
}

class Mana extends StatelessWidget {
  final Future<User> user = CacheHelper.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://w0.pngwave.com/png/639/452/computer-icons-avatar-user-profile-people-icon-png-clip-art.png'),
              radius: 80.0,
            ),
            FutureBuilder(
              future: user,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                String textUserName =
                    snapshot.hasData ? snapshot.data.username : 'Loading...';
                String textEmail =
                    snapshot.hasData ? snapshot.data.email : 'Loading...';
                return Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        textUserName ?? 'Loading...',
                        style: TextStyle(fontSize: 32.0),
                      ),
                      Text(
                        textEmail ?? 'Loading...',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.brown,
                      radius: 32,
                      child: Text(
                        '50',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Followers')
                  ],
                ),
                Column(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () => {},
                      elevation: 2.0,
                      fillColor: const Color(0xffFF6E4E),
                      child: Icon(
                        Icons.settings,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Manager')
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40, right: 30),
              height: MediaQuery.of(context).size.height - 412,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: FloatingActionButton(
                    hoverColor: Colors.black,
                    elevation: 10,
                    onPressed: () async => {
                      CacheHelper.removeCurrentUser(),
                      Navigator.pushNamed(context, 'Login')
                    },
                    backgroundColor: const Color(0xffFF6E4E),
                    child: Icon(
                      Icons.settings,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
