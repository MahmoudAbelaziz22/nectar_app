import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar_app/buiness_logic/cart_cubit/cart_cubit.dart';
import 'package:nectar_app/buiness_logic/products_cubit/products_cubit.dart';
import 'package:nectar_app/data/model/cart_item.dart';
import 'package:nectar_app/data/model/product.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/text_bar.dart';
import 'package:nectar_app/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';
import 'package:nectar_app/presentation/widgets/loading_indicator.dart';
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
  int _currentPage = 0;
  List<Product> allProducts = [];
  List<Product> offerProduts = [];

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

  AnimatedContainer _buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      width: _currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? MyColors.myGreen : MyColors.mygray,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  _buildToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.myGreen,
        textColor: Colors.white,
        fontSize: getProportionateScreenWidth(16));
  }

  SingleChildScrollView _buildProductsHorizonalList(
      {required List<Product> products}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: products
              .map((product) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ProductCard(
                        productName: product.productName!,
                        productPriceage: product.priceg!,
                        productImgUrl: product.images!.img1!,
                        productPrice: product.price!,
                        onAdded: () {
                          CartItem cartItem = CartItem(
                            productId: product.id,
                            productName: product.productName,
                            productPriceg: product.priceg,
                            productImage: product.images!.img1,
                            productPrice: product.price,
                            quantity: 1,
                          );
                          BlocProvider.of<CartCubit>(context)
                              .addProductToCart(cartItem);
                          _buildToast('addeddddd');
                        }),
                  ))
              .toList()),
    );
  }

  SingleChildScrollView _buildGroceriesHorizontalList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((category) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: HorizontalCategoryCard(
                      color: category['color'],
                      categoryName: category['name'],
                      categoryImgUrl: category['image']),
                ))
            .toList(),
      ),
    );
  }

  SingleChildScrollView _buildOffersHorizontalList(
      {required List<Product> products}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: products
              .map((product) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ProductCard(
                        productName: product.productName!,
                        productPriceage: product.priceg!,
                        productImgUrl: product.images!.img1!,
                        productPrice: product.price!,
                        onAdded: () {
                          CartItem cartItem = CartItem(
                            productId: product.id,
                            productName: product.productName,
                            productPriceg: product.priceg,
                            productImage: product.images!.img1,
                            productPrice: product.price,
                            quantity: 1,
                          );
                          BlocProvider.of<CartCubit>(context)
                              .addProductToCart(cartItem);
                          // print('addddddddddddd');
                          _buildToast('addeddddd');
                        }),
                  ))
              .toList()),
    );
  }

  Stack _buildImageSlider() {
    return Stack(
      children: [
        PageView.builder(
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
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
                (index) => _buildDot(index),
              ),
            ),
          ),
        )
      ],
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

  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getOffersProducts();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return LoadingIndicator();
        } else if (state is ProductsOffersLoaded) {
          offerProduts = state.products['offersProducts'];
          allProducts = state.products['allProducts'];

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
              _buildSearchBar(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              SizedBox(
                width: SizeConfig.screenWidth! - 50,
                height: getProportionateScreenHeight(130),
                child: _buildImageSlider(),
              ),
              SizedBox(height: 5),
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
                      _buildOffersHorizontalList(products: offerProduts),
                      TextBar(
                        text: 'Groceries',
                        onPressed: () {},
                      ),
                      _buildGroceriesHorizontalList(),
                      SizedBox(
                        height: 20,
                      ),
                      _buildProductsHorizonalList(products: allProducts),
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
        return LoadingIndicator();
      },
    );
  }
}
