import 'package:app_ecommerce/homepage/components/fragment/home_filter_fragment.dart';
import 'package:app_ecommerce/model/categories.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesStore extends StatefulWidget {
  @override
  _CategoriesStoreState createState() => _CategoriesStoreState();
}

class _CategoriesStoreState extends State<CategoriesStore> {
  List items = [];
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllCates().then((notes) {
      setState(() {
        notes.forEach((note) {
          items.add(Categories.fromMap(note));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 100, top: 20),
                  child: Icon(
                    Icons.add_location_outlined,
                    color: const Color(0xFFFF6E4E),
                    size: 20.0,
                    semanticLabel: 'Location',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 20),
                  child: Text(
                    "Q10, Hồ Chí Minh",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 20),
                  child: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: const Color(0xFFB2B2B2),
                    size: 24.0,
                    semanticLabel: 'Location',
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: HomeFilterFragment(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 32.0,
                          margin: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Select Category",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 19.0,
                        margin: const EdgeInsets.only(right: 10),
                        child: Text(
                          "view all",
                          style: TextStyle(
                              color: const Color(0xFFFF6E4E), fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              width: MediaQuery.of(context).size.width,
              height: 94,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    // return CategoriesItem(category: categories[index]);
                    return Column(
                      children: [
                        Container(
                          height: 71,
                          child: CategoriesItem(category: items[index]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4.0, bottom: 2),
                          height: 16,
                          child: Text(items[index].title,
                              style: TextStyle(color: const Color(0xff010035))),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoriesItem extends StatelessWidget {
  Categories category;
  CategoriesItem({this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 94,
      padding: EdgeInsets.all(5),
      child: Image.asset(
        category.image,
        color: const Color(0xFFB3B3C3),
      ),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }
}
