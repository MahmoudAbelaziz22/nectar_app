import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_cofig.dart';
import 'icon_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (SizeConfig.screenWidth! - 70) / 2,
      height: ((SizeConfig.screenWidth! - 70) / 2) * 1.43,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: IconImage(
                  width: getProportionateScreenWidth(103.5),
                  height: getProportionateScreenWidth(103.5),
                  image: 'assets/images/apple.png'),
            ),
            Spacer(),
            Text(
              'Red Apple',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(16),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              '1kg, Priceg',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(14),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              children: [
                Text(
                  '\$4.99',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(18),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  width: getProportionateScreenWidth(45.67),
                  height: getProportionateScreenWidth(45.67),
                  decoration: BoxDecoration(
                      color: MyColors.myGreen,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    color: Colors.white,
                    iconSize: getProportionateScreenWidth(17),
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
