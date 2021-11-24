import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/place_order_form.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';
import 'cart_item_card.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  void _buildCheckoutBottomSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: double.infinity,
              height: SizeConfig.screenHeight! * 0.55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Checkout',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(24),
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      PlaceOrderForm()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(50),
        ),
        Text(
          'My Cart',
          style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(20),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
          width: double.infinity,
          child: Divider(),
        ),
        Expanded(
          child: ListView.builder(
            // padding: EdgeInsets.all(8),
            itemCount: 4,
            itemBuilder: (context, index) => CartItemCard(),
          ),
        ),
        CustomButton(
            text: 'Go to Checkout',
            onPressed: () {
              _buildCheckoutBottomSheet(context);
            }),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
