import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar_app/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';
import 'package:nectar_app/size_cofig.dart';

class OnBordingScreen extends StatelessWidget {
  static const String routeName = '/';
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // to hide status bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_onbording.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: getProportionateScreenWidth(48.47),
                  height: getProportionateScreenHeight(56.36),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/icon.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  '  Welcome  \nto our store',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(48),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Text(
                  'Ger your groceries in as fast as one hour',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: getProportionateScreenWidth(16),
                    fontFamily: 'Gilroy',
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, SignInScreen.routeName);
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
