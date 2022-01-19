import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_app/buiness_logic/cart_cubit/cart_cubit.dart';
import 'package:nectar_app/data/model/cart_item.dart';
import 'package:nectar_app/presentation/screens/home_screen/components/place_order_form.dart';
import 'package:nectar_app/presentation/widgets/custom_button.dart';
import 'package:nectar_app/presentation/widgets/icon_image.dart';
import 'package:nectar_app/presentation/widgets/loading_indicator.dart';

import '../../../../constants.dart';
import '../../../../size_cofig.dart';
import 'cart_item_card.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  void _buildCheckoutBottomSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: double.infinity,
              height: SizeConfig.screenHeight! * 0.55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Checkout',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(24),
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      PlaceOrderForm()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartInitial) {
          // print('initial state called');
          return LoadingIndicator();
        } else if (state is CartItemsLoaded) {
          List<CartItem> allCartItems = state.products;
          return Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Text(
                'My Cart',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(20),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: double.infinity,
                child: Divider(),
              ),
              Expanded(
                child: ListView.builder(
                  // padding: EdgeInsets.all(8),
                  itemCount: allCartItems.length,
                  itemBuilder: (context, index) => CartItemCard(
                    onDeletePress: () {
                      BlocProvider.of<CartCubit>(context)
                          .delete(allCartItems[index]);
                    },
                    onMinusPress: () {
                      BlocProvider.of<CartCubit>(context)
                          .deleteProductFromCart(allCartItems[index]);
                    },
                    onPlusPress: () {
                      BlocProvider.of<CartCubit>(context)
                          .addProductToCart(allCartItems[index]);
                    },
                    cartItem: CartItem(
                      productId: allCartItems[index].productId,
                      productName: allCartItems[index].productName,
                      productImage: allCartItems[index].productImage,
                      productPriceg: allCartItems[index].productPriceg,
                      productPrice: allCartItems[index].productPrice,
                      quantity: allCartItems[index].quantity,
                    ),
                  ),
                ),
              ),
              CustomButton(
                  text: 'Go to Checkout',
                  onPressed: () {
                    _buildCheckoutBottomSheet(context);
                  }),
              SizedBox(
                height: 20,
              )
            ],
          );
        }
        return LoadingIndicator();
      },
    );
  }
}
