part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> allProducts;
  ProductsLoaded({
    required this.allProducts,
  });
}

class ProductsOffersLoaded extends ProductsState {
  final Map products;
  ProductsOffersLoaded({
    required this.products,
  });
}

class ProductsError extends ProductsState {}
