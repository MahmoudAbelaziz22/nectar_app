import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconImage(
                width: getProportionateScreenWidth(70.5),
                height: getProportionateScreenWidth(70.5),
                image: 'assets/images/apple.png',
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
              Spacer(),
              Text(
                '\$4.99',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(18),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            indent: 25,
            endIndent: 25,
          ),
        ],
      ),
    );
  }
}
