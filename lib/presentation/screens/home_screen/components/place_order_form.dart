import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar_app/presentation/screens/order_accepted_screen/order_accepted_screen.dart';
import 'package:nectar_app/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class PlaceOrderForm extends StatefulWidget {
  const PlaceOrderForm({Key? key}) : super(key: key);

  @override
  _PlaceOrderFormState createState() => _PlaceOrderFormState();
}

class _PlaceOrderFormState extends State<PlaceOrderForm> {
  final _formKey = GlobalKey<FormState>();
  late String address;
  late String phone;
  buildToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.myGreen,
        textColor: Colors.white,
        fontSize: getProportionateScreenWidth(16));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth! - 20,
            child: Text(
              'Your Address',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(18),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          SizedBox(
            width: SizeConfig.screenWidth! - 40,
            child: TextFormField(
              onSaved: (newValue) {
                setState(() {});
                address = newValue!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  buildToast(kAddressNullError);
                  return "";
                } else if (value.length < 10) {
                  buildToast(kTooShortAddressError);
                  return "";
                }
                return null;
              },
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(18),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                focusColor: MyColors.myGreen,
                hintText: 'Type your Address',
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          SizedBox(
            width: SizeConfig.screenWidth! - 20,
            child: Text(
              'Your Phone',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(18),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          SizedBox(
            width: SizeConfig.screenWidth! - 40,
            child: TextFormField(
              onSaved: (newValue) {
                setState(() {});
                phone = newValue!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  buildToast(kNumberNullError);
                  return "";
                } else if (value.length < 10) {
                  buildToast(kInvalidNumberError);
                  return "";
                }
                return null;
              },
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(18),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                focusColor: MyColors.myGreen,
                hintText: 'Type your Address',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'By placing an order you agree to our\nTerms And Conditions',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(16),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
              text: 'Place Order',
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, OrderAcceptedScreen.routeName);
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pop(context);
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                  //       // if all is go well go to login success screen
                }
              })
        ],
      ),
    );
  }
}
