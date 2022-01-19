import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_app/buiness_logic/products_cubit/products_cubit.dart';
import 'package:nectar_app/data/model/category_products.dart';
import 'package:nectar_app/data/model/product.dart';
import 'package:nectar_app/presentation/screens/category_products_screen/categort_products_screen.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';
import 'package:nectar_app/presentation/widgets/loading_indicator.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  var _controller = TextEditingController();
  late List<Product> allProducts;
  List<dynamic> categories = [
    {
      //fruits&vegetables
      'cat': "fruits&vegetables",
      'name': 'Fruits & Vegetables',
      'color': Color(0xFFEEF7F1),
      'image': 'assets/images/fruit.png'
    },
    {
      //
      'cat': "cocking oil",
      'name': 'Cocking Oil',
      'color': Color(0xFFFEF6ED),
      'image': 'assets/images/oil.png'
    },
    {
      //meat&fish
      'cat': "meat&fish",
      'name': 'Meat & Fish',
      'color': Color(0xFFFDE8E4),
      'image': 'assets/images/meat.png'
    },
    {
//bekary&snackes
      'cat': "bekary&snackes",
      'name': 'Bakery & Snackes',
      'color': Color(0xFFF4EBF7),
      'image': 'assets/images/bakery.png'
    },
    {
      //dairy&eggs
      'cat': "dairy&eggs",
      'name': 'Dairy & Eggs',
      'color': Color(0xFFFFF8E5),
      'image': 'assets/images/dairy.png'
    },
    {
      //
      'cat': "beverages",
      'name': 'Beverages',
      'color': Color(0xFFEDF7FC),
      'image': 'assets/images/beverages.png'
    },
    {
      //wasing&detergants
      'cat': "wasing&detergants",
      'name': '   Washing & Detergants',
      'color': Color(0xFFE6E3F7),
      'image': 'assets/images/washing.png'
    },
    {
      //canned food
      'cat': "canned food",
      'name': 'Canned Food',
      'color': Color(0xFFF4DEE6),
      'image': 'assets/images/food.png'
    },
  ];

  Text _buildPageTitle() {
    return Text(
      'Find Products',
      style: TextStyle(
          color: Colors.black,
          fontSize: getProportionateScreenWidth(20),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.bold),
    );
  }

  Container _buildSearchBar() {
    return Container(
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
    );
  }

  Expanded _buildCategoryGridView() {
    return Expanded(
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
            CategoryPtoducts _categoryProducts =
                getCategoryProducts(categories[index]['cat']);
            // print('productssssss: ${_categoryProducts.categoryProducts}');
            Navigator.pushNamed(context, CategoryProductsScreen.routeName,
                arguments: _categoryProducts);
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
    );
  }

  CategoryPtoducts getCategoryProducts(String categoryName) {
    // print('catNAme: $categoryName');
    // print('all Products $allProducts');
    List<Product> categoryProducts = allProducts
        .where((product) => product.category! == categoryName)
        .toList();
    //  print('productssssss: $categoryProducts');
    return CategoryPtoducts(categoryName, categoryProducts);
  }

  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return LoadingIndicator();
        } else if (state is ProductsLoaded) {
          allProducts = state.allProducts;
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: getProportionateScreenHeight(50)),
                _buildPageTitle(),
                SizedBox(height: getProportionateScreenHeight(20)),
                _buildSearchBar(),
                SizedBox(height: getProportionateScreenHeight(20)),
                _buildCategoryGridView(),
              ],
            ),
          );
        }
        return LoadingIndicator();
      },
    );
  }
}
