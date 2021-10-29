import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({Key? key}) : super(key: key);

  @override
  _LocationFormState createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  final _formKey = GlobalKey<FormState>();
  late String address;
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(60),
            ),
            SizedBox(
              width: SizeConfig.screenWidth! - 20,
              child: Text(
                'Your Address',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: getProportionateScreenWidth(16),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            SizedBox(
              width: SizeConfig.screenWidth! - 20,
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
              height: getProportionateScreenHeight(70),
            ),
            CustomButton(
                text: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    //       // if all is go well go to login success screen
                  }
                })
          ],
        ),
      ),
    );
  }
}
