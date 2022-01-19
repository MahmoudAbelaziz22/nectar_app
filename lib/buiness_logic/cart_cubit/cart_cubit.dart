import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar_app/data/model/cart_item.dart';

import 'package:nectar_app/data/repository/cart_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepository) : super(CartInitial());

  final CartRepository _cartRepository;
  List<CartItem> cartProducts = [];

  Future<List<CartItem>> getCartProducts() async {
    // emit(CartInitial());
    _cartRepository.getCartProducts().then((products) {
      emit(CartItemsLoaded(products));
      this.cartProducts = products;
    });

    return cartProducts;
  }

  Future<void> addProductToCart(CartItem cartItem) async {
    _cartRepository.addProductToCart(cartItem).then((value) {
      //  emit(CartItemAdded());
      getCartProducts();
    });
  }

  Future<void> deleteProductFromCart(CartItem cartItem) async {
    _cartRepository.removeProductFromCart(cartItem).then((value) {
      //  emit(CartItemDeleted());
      getCartProducts();
    });
  }

  Future<void> delete(CartItem cartItem) async {
    _cartRepository.deleteProductFromCart(cartItem).then((value) {
      //  emit(CartItemDeleted());
      getCartProducts();
    });
  }
}
