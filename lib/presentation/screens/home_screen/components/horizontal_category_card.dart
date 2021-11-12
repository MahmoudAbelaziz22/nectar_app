import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';

import '../../../../size_cofig.dart';

class HorizontalCategoryCard extends StatelessWidget {
  final Color color;
  const HorizontalCategoryCard({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (SizeConfig.screenWidth! - 150),
      height: ((SizeConfig.screenWidth! - 150)) * 0.4,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: IconImage(
                  width: getProportionateScreenWidth(103.5),
                  height: getProportionateScreenWidth(103.5),
                  image: 'assets/images/apple.png'),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Center(
              child: Text(
                'Red Apple',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(16),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
