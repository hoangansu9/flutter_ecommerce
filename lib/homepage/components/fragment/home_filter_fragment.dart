import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class HomeFilterFragment extends StatefulWidget {
  @override
  _HomeFilterFragmentState createState() => _HomeFilterFragmentState();
}

class _HomeFilterFragmentState extends State<HomeFilterFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          filterHP(context),
        ],
      ),
    );
  }
}

Widget filterHP(BuildContext context) {
  return FlatButton(
      shape: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(40.0),
        ),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      minWidth: 37,
      padding: EdgeInsets.zero,
      color: const Color(0xffE5E5E5),
      onPressed: () => Dialogs.bottomMaterialDialog(
              msg: 'Are you sure? you can\'t undo this action',
              customView: Container(
                child: Text("sd"),
              ),
              title: 'Filter options',
              context: context,
              actions: [
                IconsButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  iconData: Icons.cancel,
                  iconColor: Colors.white,
                  color: const Color((0xff010035)),
                  text: '',
                ),
                IconsButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  text: 'Done',
                  color: const Color(0xffFF6E4E),
                  textStyle: TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ]),
      child: LineIcon.filter());
}
