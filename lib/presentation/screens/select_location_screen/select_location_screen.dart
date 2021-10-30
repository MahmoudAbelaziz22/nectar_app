import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/screens/select_location_screen/components/location_form.dart';
import 'package:nectar_app/presentation/widgets/custom_back_button.dart';

import '../../../constants.dart';
import '../../../size_cofig.dart';

class SelectLocationScreen extends StatelessWidget {
  static const String routeName = '/select_location';
  const SelectLocationScreen({Key? key}) : super(key: key);

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
                    height: getProportionateScreenHeight(45),
                  ),
                  Center(
                    child: Container(
                      width: getProportionateScreenWidth(224),
                      height: getProportionateScreenHeight(173),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/onmap.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  Center(
                    child: Text(
                      'Type Your Location',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(26),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Center(
                    child: Text(
                      'Type your location and enable us to\ndelevr your orders to your home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: getProportionateScreenWidth(16),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  LocationForm(),
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
