import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar_app/constants.dart';
import 'package:nectar_app/presentation/screens/home_screen/home_screen.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';

import '../../../size_cofig.dart';

class OrderAcceptedScreen extends StatelessWidget {
  static const String routeName = '/order_acceptted';
  const OrderAcceptedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: getProportionateScreenWidth(270),
                  height: getProportionateScreenWidth(270),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/success.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  '  Your Order has been\naccepted',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Text(
                  'Your items has been placcd and is on \nit’s way to being processed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: getProportionateScreenWidth(16),
                    fontFamily: 'Gilroy',
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                CustomButton(
                  text: 'Back to home',
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(80),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
