import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/widgets/network_icon_image.dart';

import '../../constants.dart';
import '../../size_cofig.dart';
import 'icon_image.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPriceage;
  final String productImgUrl;
  final double productPrice;
  final VoidCallback onAdded;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.productPriceage,
    required this.productImgUrl,
    required this.productPrice,
    required this.onAdded,
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
              child: NetworkIconImage(
                  width: getProportionateScreenWidth(80),
                  height: getProportionateScreenWidth(80),
                  image: productImgUrl),
            ),
            Spacer(),
            Text(
              productName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(14),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              productPriceage,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(12),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              children: [
                Text(
                  '\$$productPrice',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(16),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  width: getProportionateScreenWidth(40),
                  height: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                      color: MyColors.myGreen,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    color: Colors.white,
                    iconSize: getProportionateScreenWidth(17),
                    onPressed: onAdded,
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
