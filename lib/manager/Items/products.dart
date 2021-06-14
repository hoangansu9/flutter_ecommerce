import 'dart:io';

import 'package:app_ecommerce/model/products.dart';
import 'package:app_ecommerce/utli/Utility.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductScreen extends StatefulWidget {
  final Products product;

  const ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  DatabaseHelper db = new DatabaseHelper();
  pickImageFromGallery() {
    ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
      String imgString = Utility.base64String(imgFile.readAsBytesSync());
    });
  }

  Future<File> imageFile;
  TextEditingController _nameController;
  TextEditingController _imageController;
  TextEditingController _chipController;
  TextEditingController _cameraController;
  TextEditingController _ramController;
  TextEditingController _storageController;
  TextEditingController _detailsController;
  TextEditingController _featuresController;
  TextEditingController _priceController;
  TextEditingController _categoryIdController;
  TextEditingController _quantityController;
  final String imgPicker = '';
  @override
  void initState() {
    super.initState();

    _nameController = new TextEditingController(text: widget.product.name);
    _imageController = new TextEditingController(text: widget.product.image);
    _chipController = new TextEditingController(text: widget.product.chip);
    _cameraController = new TextEditingController(text: widget.product.camera);
    _ramController = new TextEditingController(text: widget.product.ram);
    _storageController =
        new TextEditingController(text: widget.product.storage);
    _detailsController =
        new TextEditingController(text: widget.product.details);
    _featuresController =
        new TextEditingController(text: widget.product.features);
    _priceController = new TextEditingController(text: widget.product.price);
    _categoryIdController =
        new TextEditingController(text: widget.product.categoryId.toString());
    _quantityController =
        new TextEditingController(text: widget.product.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            child: _topNav(context),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            IconButton(
                icon: Icon(Icons.image),
                onPressed: () {
                  ImagePicker.pickImage(source: ImageSource.gallery)
                      .then((imgFile) {
                    String imgString =
                        Utility.base64String(imgFile.readAsBytesSync());
                    _imageController.text = imgString;
                  });
                }),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _chipController,
              decoration: InputDecoration(labelText: 'Chip'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _cameraController,
              decoration: InputDecoration(labelText: 'Camera'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _ramController,
              decoration: InputDecoration(labelText: 'Ram'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _storageController,
              decoration: InputDecoration(labelText: 'Storage'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Details'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _featuresController,
              decoration: InputDecoration(labelText: 'Features'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              keyboardType: TextInputType.number,
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              keyboardType: TextInputType.number,
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              keyboardType: TextInputType.number,
              controller: _categoryIdController,
              decoration: InputDecoration(labelText: 'CategoryId'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            ElevatedButton(
              child: (widget.product.id != null) ? Text('Update') : Text('Add'),
              onPressed: () {
                if (widget.product.id != null) {
                  db
                      .updateProduct(Products.fromMap({
                    'id': widget.product.id,
                    'name': _nameController.text,
                    'image': _imageController.text,
                    'chip': _chipController.text,
                    'camera': _cameraController.text,
                    'ram': _ramController.text,
                    'storage': _storageController.text,
                    'details': _detailsController.text,
                    'features': _featuresController.text,
                    'price': _priceController.text,
                    'categoryId': int.parse(_categoryIdController.text),
                    'quantity': _quantityController.text
                  }))
                      .then((_) {
                    Navigator.pop(context, 'update');
                  });
                } else {
                  db
                      .saveProduct(Products(
                          _nameController.text,
                          _imageController.text,
                          _chipController.text,
                          _cameraController.text,
                          _ramController.text,
                          _storageController.text,
                          _detailsController.text,
                          _featuresController.text,
                          _priceController.text,
                          int.parse(_categoryIdController.text),
                          _quantityController.text))
                      .then((_) {
                    Navigator.pop(context, 'save');
                  });
                }
              },
            ),
          ],
        ));
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
          "Create new Product",
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
