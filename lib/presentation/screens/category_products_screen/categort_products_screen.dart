import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app/presentation/widgets/custom_back_button.dart';
import 'package:nectar_app/presentation/widgets/product_card.dart';

import '../../../constants.dart';
import '../../../size_cofig.dart';

class CategoryProductsScreen extends StatefulWidget {
  static const String routeName = '/category_product';
  const CategoryProductsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  var _controller = TextEditingController();
  bool isSearch = false;
  buildSearchBar() {
    return Container(
      width: SizeConfig.screenWidth! - 100,
      height: getProportionateScreenHeight(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: TextField(
          controller: _controller,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            alignLabelWithHint: true,
            hintText: "Search Store",
            hintStyle: TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
              color: MyColors.mygray,
              fontSize: getProportionateScreenWidth(18),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: _controller.text.length > 0
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                      });
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    ),
                  )
                : SizedBox(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isSearch
                      ? SizedBox()
                      : CustomBackButton(onPressed: () {
                          Navigator.pop(context);
                        }),
                  isSearch
                      ? buildSearchBar()
                      : Text(
                          'Beverages',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(20),
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.bold),
                        ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isSearch = !isSearch;
                        });
                      },
                      icon: SvgPicture.asset('assets/icons/isSearch.svg'))
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 8,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) => ProductCard(
                    productName: 'Red Apple',
                    productImgUrl: 'assets/images/apple.png',
                    productPriceage: '1kg, Priceg',
                    productPrice: 4.99,
                    onAdded: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
