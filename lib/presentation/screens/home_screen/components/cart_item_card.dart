import 'package:flutter/material.dart';
import 'package:nectar_app/data/model/cart_item.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';
import 'package:nectar_app/presentation/widgets/network_icon_image.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class CartItemCard extends StatelessWidget {
  final VoidCallback onMinusPress;
  final VoidCallback onPlusPress;
  final VoidCallback onDeletePress;
  final CartItem cartItem;
  const CartItemCard({
    Key? key,
    required this.cartItem,
    required this.onMinusPress,
    required this.onPlusPress,
    required this.onDeletePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: NetworkIconImage(
                width: getProportionateScreenWidth(70.5),
                height: getProportionateScreenWidth(70.5),
                image: cartItem.productImage!,
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.productName!,
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
                    cartItem.productPriceg!,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: getProportionateScreenWidth(12),
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
                              onPressed: onMinusPress,
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
                          '${cartItem.quantity}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(16),
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
                              onPressed: onPlusPress,
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
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  IconButton(
                    onPressed: onDeletePress,
                    icon: Icon(Icons.close),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'EGP ${cartItem.productPrice}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(16),
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
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
