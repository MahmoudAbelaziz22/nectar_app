import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String userName;
  late String email;
  late String password;

  bool isSignUp = true;

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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          buildToast(kPasswordNullError);
          return "";
        } else if (value.length < 8) {
          buildToast(kInvalidPasswordError);
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Enter your password',
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          buildToast(kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          buildToast(kInvalidEmailError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      onSaved: (newValue) => userName = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          buildToast(kUserNameNullError);
          return "";
        } else if (value.length < 8) {
          buildToast(kInvalidUserNameError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Enter username',
      ),
    );
  }

  buildSignInForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Loging',
          style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(26),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        Text(
          'Enter your emails and password',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: getProportionateScreenWidth(16),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        Text(
          'Email',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: getProportionateScreenWidth(16),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        buildEmailFormField(),
        SizedBox(
          height: getProportionateScreenHeight(35),
        ),
        Text(
          'Password',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: getProportionateScreenWidth(16),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        buildPasswordFormField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(14),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Center(
            child: CustomButton(
                text: 'Log In',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    //       // if all is go well go to login success screen
                  }
                })),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(14),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isSignUp = false;
                });
              },
              child: Text(
                'Singup',
                style: TextStyle(
                    color: MyColors.myGreen,
                    fontSize: getProportionateScreenWidth(14),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    );
  }

  buildSignUpForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(26),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        Text(
          'Enter your credentials to continue',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: getProportionateScreenWidth(16),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        Text(
          'Username',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: getProportionateScreenWidth(16),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        buildUserNameFormField(),
        SizedBox(
          height: getProportionateScreenHeight(35),
        ),
        Text(
          'Email',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: getProportionateScreenWidth(16),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        buildEmailFormField(),
        SizedBox(
          height: getProportionateScreenHeight(35),
        ),
        Text(
          'Password',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: getProportionateScreenWidth(16),
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        buildPasswordFormField(),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'By continuing you agree to our',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(14),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Terms of Service',
                style: TextStyle(
                    color: MyColors.myGreen,
                    fontSize: getProportionateScreenWidth(14),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Center(
            child: CustomButton(
                text: 'Log In',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    //       // if all is go well go to login success screen
                  }
                })),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(14),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isSignUp = true;
                });
              },
              child: Text(
                'Loging',
                style: TextStyle(
                    color: MyColors.myGreen,
                    fontSize: getProportionateScreenWidth(14),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: SizeConfig.screenWidth! - 40,
        child: isSignUp ? buildSignInForm() : buildSignUpForm(),
      ),
    );
  }
}
