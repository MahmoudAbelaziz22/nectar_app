import 'package:flutter/material.dart';
import 'package:nectar_app/presentation/screens/category_products_screen/categort_products_screen.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';
import 'package:nectar_app/presentation/widgets/product_card.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  var _controller = TextEditingController();

  List<dynamic> categories = [
    {
      'name': 'Frash Fruits & Vegetable',
      'color': Color(0xFFEEF7F1),
      'image': 'assets/images/fruit.png'
    },
    {
      'name': 'Cooking Oil & Ghee',
      'color': Color(0xFFFEF6ED),
      'image': 'assets/images/oil.png'
    },
    {
      'name': 'Meat & Fish',
      'color': Color(0xFFFDE8E4),
      'image': 'assets/images/meat.png'
    },
    {
      'name': 'Bakery & Snacks',
      'color': Color(0xFFF4EBF7),
      'image': 'assets/images/bakery.png'
    },
    {
      'name': 'Dairy & Eggs',
      'color': Color(0xFFFFF8E5),
      'image': 'assets/images/dairy.png'
    },
    {
      'name': 'Beverages',
      'color': Color(0xFFEDF7FC),
      'image': 'assets/images/beverages.png'
    },
    {
      'name': '   Washing & Detergant',
      'color': Color(0xFFE6E3F7),
      'image': 'assets/images/washing.png'
    },
    {
      'name': 'Canned Food',
      'color': Color(0xFFF4DEE6),
      'image': 'assets/images/food.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          Text(
            'Find Products',
            style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(20),
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
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
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              padding: const EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, CategoryProductsScreen.routeName);
                },
                child: Container(
                  width: (SizeConfig.screenWidth! - 70) / 2,
                  height: ((SizeConfig.screenWidth! - 70) / 2) * 1.1,
                  decoration: BoxDecoration(
                      color: categories[index]['color'],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: IconImage(
                              width: getProportionateScreenWidth(103.5),
                              height: getProportionateScreenWidth(103.5),
                              image: categories[index]['image']),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Center(
                          child: Text(
                            categories[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(16),
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
