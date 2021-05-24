import 'package:app_ecommerce/manager/Items/categories.dart';
import 'package:app_ecommerce/model/categories.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryManager extends StatefulWidget {
  @override
  _CategoryManagerState createState() => new _CategoryManagerState();
}

class _CategoryManagerState extends State {
  List items = [];
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllCates().then((cates) {
      setState(() {
        cates.forEach((cate) {
          items.add(Categories.fromMap(cate));
        });
      });
    });
  }

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
                              onPressed: () => _deleteNote(
                                  context, items[position], position)),
                        ],
                      ),
                      title: Text(
                        '${items[position].title}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].image}',
                        style: new TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.deepOrangeAccent),
                      ),
                      onTap: () => _navigateToNote(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createNewNote(context),
        ),
      ),
    );
  }

  void _deleteNote(BuildContext context, Categories cate, int position) async {
    db.deleteCate(cate.id).then((cates) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToNote(BuildContext context, Categories note) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryScreen(note)),
    );

    if (result == 'update') {
      db.getAllCates().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Categories.fromMap(note));
          });
        });
      });
    }
  }

  void _createNewNote(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CategoryScreen(Categories('', ''))),
    );

    if (result == 'save') {
      db.getAllCates().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Categories.fromMap(note));
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
