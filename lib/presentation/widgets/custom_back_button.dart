import 'package:flutter/material.dart';

import '../../size_cofig.dart';

class CustomBackButton extends StatelessWidget {
  final onPressed;
  const CustomBackButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );
  }
}
