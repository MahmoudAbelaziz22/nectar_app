import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar_app/data/model/product.dart';
import 'package:nectar_app/data/repository/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository _productRepository;
  ProductsCubit(this._productRepository) : super(ProductsInitial());

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    _productRepository.getAllProducts().then((allProducts) {
      emit(ProductsLoaded(allProducts: allProducts));
    });
  }

  Future<void> getProductsByCategory(String category) async {
    emit(ProductsLoading());
    _productRepository.getProductsByCategory(category).then((allProducts) {
      emit(ProductsLoaded(allProducts: allProducts));
    });
  }

  Future<void> getOffersProducts() async {
    emit(ProductsLoading());
    _productRepository.getOffersProducts().then((products) {
      emit(ProductsOffersLoaded(products: products));
    });
  }
}
