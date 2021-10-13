import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_cofig.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: getProportionateScreenWidth(353),
      height: getProportionateScreenHeight(67),
      color: MyColors.myGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(18),
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
