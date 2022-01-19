import 'package:nectar_app/data/local_database/local_db_helper.dart';
import 'package:nectar_app/data/model/cart_item.dart';

class CartRepository {
  final LocalDbHelper localDbHelper;

  CartRepository(this.localDbHelper);

  Future<List<CartItem>> getCartProducts() async {
    final localDatabaseData = await localDbHelper.allCartProducts();
    List<CartItem> cartProducts =
        localDatabaseData.map((e) => CartItem.fromJson(e)).toList();
    return cartProducts;
  }

  Future<void> addProductToCart(CartItem cartItem) async {
    try {
      var allCartProductsData = await localDbHelper.allCartProducts();
      List<CartItem> allCartProducts =
          allCartProductsData.map((e) => CartItem.fromJson(e)).toList();

      if (allCartProducts.isNotEmpty) {
        List<CartItem> existed = allCartProducts
            .where((cartProduct) => cartProduct.productId == cartItem.productId)
            .toList();
        if (existed.isNotEmpty) {
          CartItem updatedCartItem = CartItem(
            productId: cartItem.productId,
            productName: cartItem.productName,
            productPriceg: cartItem.productPriceg,
            productImage: cartItem.productImage,
            productPrice: cartItem.productPrice,
            quantity: existed[0].quantity! + 1,
          );
          localDbHelper.updateProduct(updatedCartItem);
        } else {
          localDbHelper.addToCart(cartItem);
        }
      } else {
        localDbHelper.addToCart(cartItem);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> removeProductFromCart(CartItem cartItem) async {
    try {
      if (cartItem.quantity! > 1) {
        CartItem updatedCartItem = CartItem(
          productId: cartItem.productId,
          productName: cartItem.productName,
          productPriceg: cartItem.productPriceg,
          productImage: cartItem.productImage,
          productPrice: cartItem.productPrice,
          quantity: (cartItem.quantity)! - 1,
        );
        localDbHelper.updateProduct(updatedCartItem);
      } else {
        localDbHelper.deleteFromCart(cartItem);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteProductFromCart(CartItem cartItem) async {
    try {
      localDbHelper.deleteFromCart(cartItem);
    } catch (error) {
      print(error);
    }
  }
}
