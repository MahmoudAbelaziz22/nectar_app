import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app/constants.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/account_view.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/cart_view.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/explore_view.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/favorite_view.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/home_view.dart';

import 'package:nectar_app/size_cofig.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentViewIndex = 0;

  List<Widget> homeScreenViews = [
    HomeView(),
    ExploreView(),
    CartView(),
    FavoriteView(),
    AccountView()
  ];
  List<BottomNavigationBarItem> _bottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        label: 'Shop',
        icon: SvgPicture.asset(
          'assets/icons/store.svg',
          color: currentViewIndex == 0 ? MyColors.myGreen : Colors.black,
          width: getProportionateScreenWidth(24),
          height: getProportionateScreenWidth(24),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Explore',
        icon: SvgPicture.asset(
          'assets/icons/search.svg',
          color: currentViewIndex == 1 ? MyColors.myGreen : Colors.black,
          width: getProportionateScreenWidth(28.35),
          height: getProportionateScreenWidth(18.21),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Cart',
        icon: SvgPicture.asset(
          'assets/icons/cart.svg',
          color: currentViewIndex == 2 ? MyColors.myGreen : Colors.black,
          width: getProportionateScreenWidth(22.0),
          height: getProportionateScreenWidth(19.6),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Favorit',
        icon: SvgPicture.asset(
          'assets/icons/heart.svg',
          color: currentViewIndex == 3 ? MyColors.myGreen : Colors.black,
          width: getProportionateScreenWidth(24),
          height: getProportionateScreenWidth(24),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Account',
        icon: SvgPicture.asset(
          'assets/icons/user.svg',
          color: currentViewIndex == 4 ? MyColors.myGreen : Colors.black,
          width: getProportionateScreenWidth(24),
          height: getProportionateScreenWidth(24),
        ),
      ),
    ];
  }

  Container _buildBottomNavBar() {
    return Container(
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
          currentIndex: currentViewIndex,
          onTap: (index) {
            setState(() {
              currentViewIndex = index;
            });
          },
          items: _bottomNavBarItems(),
          backgroundColor: MyColors.myWhite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: _buildBottomNavBar(),
        body: homeScreenViews[currentViewIndex]);
  }
}
