import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconImage(
              width: getProportionateScreenWidth(70.5),
              height: getProportionateScreenWidth(70.5),
              image: 'assets/images/apple.png',
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: getProportionateScreenWidth(45),
                      height: getProportionateScreenWidth(45),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.minimize,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(18),
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: getProportionateScreenWidth(45),
                      height: getProportionateScreenWidth(45),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: MyColors.myGreen,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '\$4.99',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(18),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
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
    );
  }
}
