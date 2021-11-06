import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar_app/presentation/screens/home_screen/home_screen.dart';
import 'package:nectar_app/presentation/screens/select_location_screen/select_location_screen.dart';

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
  late StreamSubscription<bool> keyboardSubscription;
  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  double keyboardHeight = 0;

  bool isVerification = false;
  String dialogCodeDigit = "+20";
  String verificationCode = '';
  String verificationId1 = '';

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser(String phone) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          //   Navigator.of(context).pop();
          buildToast('verification completed');
          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user!;

          print(user);
          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          verificationId1 = verificationId;
          setState(() {
            isVerification = true;
          });
        },
        codeAutoRetrievalTimeout: (_) {});
  }

  buildNumberField() {
    return Row(
      children: [
        CountryCodePicker(
          onChanged: (country) {},
          initialSelection: "EG",
          favorite: ['+20', 'EG', '+966', 'SA'],
          showCountryOnly: false,
          dialogTextStyle: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(18),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.normal),
          showDropDownButton: true,
          showFlag: true,
          showFlagDialog: true,
          showOnlyCountryWhenClosed: false,
          flagWidth: 28.0,
        ),
        // SizedBox(
        //   width: getProportionateScreenWidth(10),
        // ),
        Expanded(child: buildNumberFormField()),
      ],
    );
  }

  buildVerificationField() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(45),
            child: TextFormField(
              focusNode: pin1FocusNode,
              autofocus: true,
              keyboardType: TextInputType.number,
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              onChanged: (value) {
                verificationCode = verificationCode.trim() + value.trim();
                nextFocus(
                    value: value,
                    nextFocusNode: pin2FocusNode,
                    previousFocusNode: pin1FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(45),
            child: TextFormField(
              focusNode: pin2FocusNode,
              keyboardType: TextInputType.number,
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              onChanged: (value) {
                verificationCode = verificationCode.trim() + value.trim();
                nextFocus(
                    value: value,
                    nextFocusNode: pin3FocusNode,
                    previousFocusNode: pin1FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(45),
            child: TextFormField(
              focusNode: pin3FocusNode,
              keyboardType: TextInputType.number,
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              onChanged: (value) {
                verificationCode = verificationCode.trim() + value.trim();
                nextFocus(
                    value: value,
                    nextFocusNode: pin4FocusNode,
                    previousFocusNode: pin3FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(45),
            child: TextFormField(
              focusNode: pin4FocusNode,
              keyboardType: TextInputType.number,
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              onChanged: (value) {
                verificationCode = verificationCode.trim() + value.trim();
                nextFocus(
                    value: value,
                    nextFocusNode: pin5FocusNode,
                    previousFocusNode: pin3FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(45),
            child: TextFormField(
              focusNode: pin5FocusNode,
              keyboardType: TextInputType.number,
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              onChanged: (value) {
                verificationCode = verificationCode.trim() + value.trim();
                nextFocus(
                    value: value,
                    nextFocusNode: pin6FocusNode,
                    previousFocusNode: pin4FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(45),
            child: TextFormField(
              focusNode: pin6FocusNode,
              keyboardType: TextInputType.number,
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              onChanged: (value) {
                verificationCode = verificationCode.trim() + value.trim();
                if (value.length == 1) {
                  pin6FocusNode.unfocus();
                }
                if (value.length == 0) {
                  nextFocus(
                      value: value,
                      nextFocusNode: pin6FocusNode,
                      previousFocusNode: pin4FocusNode);
                }
                print(verificationCode);
              },
            ),
          )
        ],
      ),
    );
  }

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

  void nextFocus(
      {String? value, FocusNode? nextFocusNode, FocusNode? previousFocusNode}) {
    if (value!.length == 1) {
      nextFocusNode!.requestFocus();
    }
    if (value.length == 0) {
      previousFocusNode!.requestFocus();
    }
  }

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();

    pin6FocusNode = FocusNode();

    keyboardSubscription =
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
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();

    KeyboardVisibilityController().onChange.listen((isVisible) {}).cancel();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isVerification
                ? 'Enter your 4-digit code'
                : 'Enter your mobile number',
            style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(26),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Text(
            isVerification ? 'Code' : 'Mobile Number',
            style: TextStyle(
                color: Colors.grey,
                fontSize: getProportionateScreenWidth(18),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          isVerification ? buildVerificationField() : buildNumberField(),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          SizedBox(
            height: getProportionateScreenHeight(430) -
                getProportionateScreenHeight(keyboardHeight),
          ),
          isVerification
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: getProportionateScreenWidth(18),
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        // Navigator.pop(context);
                        // Navigator.pushNamed(
                        //     context, SelectLocationScreen.routeName);
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId1,
                                smsCode: verificationCode);

                        UserCredential result =
                            await _auth.signInWithCredential(credential);

                        User user = result.user!;
                        print(user);
                        if (user.uid.isNotEmpty) {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routeName);
                          buildToast('Verification done');
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios),
                      backgroundColor: MyColors.myGreen,
                    )
                  ],
                )
              : Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // setState(() {
                        //   isVerification = true;
                        // });
                        //       // if all is go well go to login success screen
                        phone = dialogCodeDigit.trim() + phone.trim();
                        print(phone);
                        loginUser(phone);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                    backgroundColor: MyColors.myGreen,
                  ),
                )
        ],
      ),
    );
  }
}
