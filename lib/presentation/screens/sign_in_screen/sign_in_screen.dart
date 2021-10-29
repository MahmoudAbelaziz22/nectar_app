import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nectar_app/constants.dart';
import 'package:nectar_app/presentation/screens/number_screen/number_screen.dart';
import 'package:nectar_app/presentation/screens/sign_in_screen/components/sign_in_button.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';

import '../../../size_cofig.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = '/sign_in';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getProportionateScreenHeight(354.15),
              width: getProportionateScreenWidth(413.37),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/sign_in_back.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                'Get your groceries\nwith nectar',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(26),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25)),
              child: Row(
                children: [
                  IconImage(
                    height: 24.0,
                    width: 34.0,
                    image: "assets/images/eg_flag.png",
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(
                    '‎+20',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(18),
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Expanded(
                    child: TextField(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());

                        Navigator.pushNamed(context, NumberScreen.routeName);
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            Center(
              child: Text(
                '‎Or connect with social media',
                style: TextStyle(
                    color: MyColors.mygray,
                    fontSize: getProportionateScreenWidth(14),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            SignInButton(
                iconImage: IconImage(
                    width: 23,
                    height: 28,
                    image: "assets/images/google_icon.png"),
                text: "Continue with Google",
                color: Color(0xff5383EC),
                onPressed: () {}),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SignInButton(
                iconImage: IconImage(
                    width: 11.7,
                    height: 28,
                    image: "assets/images/facebook_icon.png"),
                text: "Continue with Facebook",
                color: Color(0xff4A66AC),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
