import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/text_bar.dart';
import 'package:nectar_app/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';
import 'package:nectar_app/presentation/widgets/product_card.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';
import 'horizontal_category_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _controller = TextEditingController();
  int currentPage = 0;
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: getProportionateScreenHeight(50),
        ),
        Center(
          child: IconImage(
              width: getProportionateScreenWidth(26.5),
              height: 1.2 * getProportionateScreenWidth(26.5),
              image: 'assets/images/carrot_icon.png'),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Container(
          width: SizeConfig.screenWidth! - 50,
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
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! - 50,
          height: getProportionateScreenHeight(130),
          child: Stack(
            children: [
              PageView.builder(
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
                            image: AssetImage('assets/images/banner.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => buildDot(index),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                TextBar(
                  text: 'Exclusive Offer',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ProductDetailsScreen.routeName);
                  },
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCard(),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(),
                    ],
                  ),
                ),
                TextBar(
                  text: 'Groceries',
                  onPressed: () {},
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HorizontalCategoryCard(
                        color: Color(0xFFF8A44C),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      HorizontalCategoryCard(
                        color: Color(0xFFE5F3EA),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      HorizontalCategoryCard(
                        color: Color(0xFFF4EBF7),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCard(),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
