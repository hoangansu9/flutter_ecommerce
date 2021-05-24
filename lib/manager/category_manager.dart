import 'package:app_ecommerce/model/categories.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryManager extends StatefulWidget {
  static String routeName = "/category_manager";
  final Categories cate;

  const CategoryManager(this.cate);

  @override
  _CategoryManagerState createState() => _CategoryManagerState();
}

class _CategoryManagerState extends State<CategoryManager> {
  DatabaseHelper db = new DatabaseHelper();
  int _selectedIndex = 1;
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _titleController = new TextEditingController(text: widget.cate.title);
    _descriptionController = new TextEditingController(text: widget.cate.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note')),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            ElevatedButton(
              child: (widget.cate.id != null) ? Text('Update') : Text('Add'),
              onPressed: () {
                if (widget.cate.id != null) {
                  db
                      .updateCate(Categories.fromMap({
                    'id': widget.cate.id,
                    'title': _titleController.text,
                    'description': _descriptionController.text
                  }))
                      .then((_) {
                    Navigator.pop(context, 'update');
                  });
                } else {
                  db
                      .saveCate(Categories(
                          _titleController.text, _descriptionController.text))
                      .then((_) {
                    Navigator.pop(context, 'save');
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
