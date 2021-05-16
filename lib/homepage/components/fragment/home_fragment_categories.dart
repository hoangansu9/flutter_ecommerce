import 'package:app_ecommerce/homepage/components/fragment/home_filter_fragment.dart';
import 'package:app_ecommerce/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../model/categories.dart';
import '../../../utli/database_helper.dart';

class CategoriesStore extends StatelessWidget {
  final DBHelper db = new DBHelper();
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
              child: new FutureBuilder<List<Category>>(
                future: db.getAllCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  var data = snapshot.data;
                  return snapshot.hasData
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 71,
                                  child: CategoriesItem(category: data[index]),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 4.0, bottom: 2),
                                  height: 16,
                                  child: Text(data[index].categoryName,
                                      style: TextStyle(
                                          color: const Color(0xff010035))),
                                )
                              ],
                            );
                          })
                      : new Center(child: new CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoriesItem extends StatelessWidget {
  Category category;
  CategoriesItem({this.category}); // nó bị chỗ này k chiuy3n6 dc
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 94,
      padding: EdgeInsets.all(5),
      child: Image.asset(
        category.categoryImageUrl,
        color: const Color(0xFFB3B3C3),
      ),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }
}
