import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:nectar_app/presentation/widgets/custom_button.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({Key? key}) : super(key: key);

  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final _formKey = GlobalKey<FormState>();
  late String phone;
  double keyboardHeight = 0;
  TextFormField buildNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) {
        setState(() {});
        phone = newValue!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          buildToast(kNumberNullError);
          return "";
        } else if (value.length < 11) {
          buildToast(kInvalidNumberError);
          return "";
        } else if (value.length > 11) {
          buildToast(kTooLongNumberError);
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
      ),
    );
  }

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
  void initState() {
    super.initState();

    KeyboardVisibilityController().onChange.listen((isVisible) {
      if (isVisible) {
        final viewInsets = EdgeInsets.fromWindowPadding(
            WidgetsBinding.instance!.window.viewInsets,
            WidgetsBinding.instance!.window.devicePixelRatio);
        setState(() {
          keyboardHeight = viewInsets.bottom;
        });
      } else {
        setState(() {
          keyboardHeight = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    KeyboardVisibilityController().onChange.listen((isVisible) {}).cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
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
              Expanded(child: buildNumberFormField()),
            ],
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          SizedBox(
            height: getProportionateScreenHeight(430) -
                getProportionateScreenHeight(keyboardHeight),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  //       // if all is go well go to login success screen
                }
              },
              child: Icon(Icons.arrow_forward_ios),
              backgroundColor: MyColors.myGreen,
            ),
          )
          // CustomButton(
          //   text: 'Get Started',
          //   onPressed: () {
          //     if (_formKey.currentState!.validate()) {
          //       _formKey.currentState!.save();
          //       // if all is go well go to login success screen
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
