part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartItemAdded extends CartState {}

class CartItemDeleted extends CartState {}

class CartItemsLoaded extends CartState {
  final List<CartItem> products;

  CartItemsLoaded(this.products);
}
