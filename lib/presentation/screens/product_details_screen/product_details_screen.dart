import 'package:flutter/material.dart';
import 'package:nectar_app/constants.dart';
import 'package:nectar_app/presentation/widgets/custom_back_button.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';

import '../../../size_cofig.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product_details';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentPage = 0;
  bool isFavorite = false;
  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentPage == index ? MyColors.myGreen : MyColors.mygray,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myWhite,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Container(
                    color: Color(0xFFF2F3F2),
                  ),
                  height: getProportionateScreenHeight(56.83),
                ),
                Container(
                  width: double.infinity,
                  color: Color(0xFFF2F3F2),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25)),
                  child: Row(
                    children: [
                      CustomBackButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: getProportionateScreenHeight(250),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F3F2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: getProportionateScreenWidth(300),
                        height: getProportionateScreenWidth(180),
                        child: PageView.builder(
                            onPageChanged: (page) {
                              setState(() {
                                currentPage = page;
                              });
                            },
                            itemCount: 3,
                            itemBuilder: (context, index) => Container(
                                  width: getProportionateScreenWidth(368),
                                  height: getProportionateScreenHeight(115),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/apple.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => buildDot(index),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Naturel Red Apple',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(24),
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: isFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Text(
                    '1kg, Price',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: getProportionateScreenWidth(16),
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenWidth(30)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.minimize,
                            color: Colors.grey,
                          )),
                      Container(
                        width: getProportionateScreenWidth(45),
                        height: getProportionateScreenWidth(45),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(18),
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: MyColors.myGreen,
                          )),
                      Spacer(),
                      Text(
                        '\$4.99',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(18),
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: SizeConfig.screenWidth! - 50,
                    child: Divider(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Text(
                    'Product Detail',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(16),
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenWidth(20)),
                  child: Text(
                    'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: getProportionateScreenWidth(13),
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Spacer(),
                Center(
                    child:
                        CustomButton(text: 'Add To Basket', onPressed: () {})),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ));
  }
}
