import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app/constants.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';
import 'package:nectar_app/presentation/widgets/product_card.dart';
import 'package:nectar_app/size_cofig.dart';

import 'components/horizontal_category_card.dart';
import 'components/text_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _controller = TextEditingController();
  int currentPage = 0;
  int currentIndex = 0;

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10.0,
              offset: Offset(0.0, 0.3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MyColors.myGreen,
            selectedFontSize: getProportionateScreenWidth(12),
            unselectedFontSize: getProportionateScreenWidth(12),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            elevation: 10,
            unselectedLabelStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            selectedLabelStyle: TextStyle(
              color: MyColors.myGreen,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'Shop',
                icon: SvgPicture.asset(
                  'assets/icons/store.svg',
                  color: currentIndex == 0 ? MyColors.myGreen : Colors.black,
                  width: getProportionateScreenWidth(24),
                  height: getProportionateScreenWidth(24),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Explore',
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: currentIndex == 1 ? MyColors.myGreen : Colors.black,
                  width: getProportionateScreenWidth(28.35),
                  height: getProportionateScreenWidth(18.21),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                icon: SvgPicture.asset(
                  'assets/icons/cart.svg',
                  color: currentIndex == 2 ? MyColors.myGreen : Colors.black,
                  width: getProportionateScreenWidth(22.0),
                  height: getProportionateScreenWidth(19.6),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Favorit',
                icon: SvgPicture.asset(
                  'assets/icons/heart.svg',
                  color: currentIndex == 3 ? MyColors.myGreen : Colors.black,
                  width: getProportionateScreenWidth(24),
                  height: getProportionateScreenWidth(24),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Account',
                icon: SvgPicture.asset(
                  'assets/icons/user.svg',
                  color: currentIndex == 4 ? MyColors.myGreen : Colors.black,
                  width: getProportionateScreenWidth(24),
                  height: getProportionateScreenWidth(24),
                ),
              ),
            ],
            backgroundColor: MyColors.myWhite,
          ),
        ),
      ),
      body: Column(
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
                    onPressed: () {},
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
      ),
    );
  }
}
