import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';

import '../../../../size_cofig.dart';

class HorizontalCategoryCard extends StatelessWidget {
  final Color color;
  final String categoryName;
  final String categoryImgUrl;
  const HorizontalCategoryCard({
    Key? key,
    required this.color,
    required this.categoryName,
    required this.categoryImgUrl,
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
                  image: categoryImgUrl),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Expanded(
              child: Center(
                child: Text(
                  categoryName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(16),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
