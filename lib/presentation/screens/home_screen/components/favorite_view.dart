import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';

import '../../../../size_cofig.dart';
import 'favorite_item_card.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(50),
        ),
        Text(
          'Favorurite',
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
            itemBuilder: (context, index) => FavoriteItemCard(),
          ),
        ),
        CustomButton(text: 'Add All To Cart', onPressed: () {}),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
