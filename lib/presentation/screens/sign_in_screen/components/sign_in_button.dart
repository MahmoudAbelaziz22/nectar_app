import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';

import '../../../../size_cofig.dart';

class SignInButton extends StatelessWidget {
  final Widget iconImage;
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const SignInButton(
      {Key? key,
      required this.iconImage,
      required this.text,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: FlatButton(
        minWidth: getProportionateScreenWidth(353),
        height: getProportionateScreenHeight(67),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconImage,
            SizedBox(
              width: getProportionateScreenWidth(25),
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(18),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
