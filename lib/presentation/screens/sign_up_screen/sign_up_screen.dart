import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/screens/sign_up_screen/components/sign_up_form.dart';
import 'package:nectar_app/size_cofig.dart';

import '../../../constants.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/sign_up";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myWhite,
        body: Stack(children: [
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(77.25),
                ),
                Center(
                  child: Container(
                    width: getProportionateScreenWidth(47.5),
                    height: getProportionateScreenWidth(55.5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/carrot_icon.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(77.25),
                ),
                SignUpForm()
              ],
            ),
          ),
        ]));
  }
}
