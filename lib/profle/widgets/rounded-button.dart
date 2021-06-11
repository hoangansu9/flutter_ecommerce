import 'package:app_ecommerce/profle/pallete.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    this.onTap,
    @required this.buttonName,
  }) : super(key: key);

  final String buttonName;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kBlue,
        ),
        child: Text(
          buttonName,
          style: kBodyText.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
