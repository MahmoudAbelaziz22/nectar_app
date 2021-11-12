import 'package:flutter/material.dart';

class MyColors {
  static const Color myGreen = Color(0xff53B175);
  static const Color myWhite = Color(0xffFCFCFC);
  static const Color mygray = Color(0xff828282);
}

const String kNumberNullError = "Please Enter your Number";
const String kEmailNullError = "Please Enter your Email";
const String kPasswordNullError = "Please Enter your Password";
const String kUserNameNullError = "Please Enter your Username";
const String kInvalidNumberError = "Please Enter Valid Number";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kInvalidPasswordError = "Please Enter Valid Password";
const String kInvalidUserNameError = "Please Enter Valid Username";
const String kTooLongNumberError = "The number is too long";
const String kAddressNullError = "Please Enter your Address";
const String kTooShortAddressError = "The address is too short";

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
