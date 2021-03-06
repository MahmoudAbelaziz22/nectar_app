import 'package:flutter/material.dart';
import 'package:nectar_app/constants.dart';
import 'package:nectar_app/presentation/screens/number_screen/components/phone_Form.dart';
import 'package:nectar_app/presentation/widgets/custom_back_button.dart';
import 'package:nectar_app/size_cofig.dart';

class NumberScreen extends StatelessWidget {
  static const String routeName = '/number';
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(25)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(56.83),
                  ),
                  CustomBackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(85),
                  ),
                  PhoneForm(),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
