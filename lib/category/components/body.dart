import 'package:flutter/material.dart';

import 'categoryform.dart';

class Body extends StatelessWidget {
  int cateId;

  Body(this.cateId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryForm(cateId),
    );
  }
}
