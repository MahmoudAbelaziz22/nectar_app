import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class TextBar extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const TextBar({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(24),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See all',
            style: TextStyle(
                color: MyColors.myGreen,
                fontSize: getProportionateScreenWidth(16),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
