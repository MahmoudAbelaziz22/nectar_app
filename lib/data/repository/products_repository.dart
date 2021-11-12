import 'package:nectar_app/data/model/product.dart';
import 'package:nectar_app/data/web_services/products_services.dart';

class ProductRepository {
  final ProductsWebServices _productsWebServices;

  ProductRepository(this._productsWebServices);

  Future<List<Product>> getAllProducts() async {
    final productWebServicesData = await _productsWebServices.getAllProducts();
    List<Product> allProducts =
        productWebServicesData.map((e) => Product.fromJson(e)).toList();
    return allProducts;
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    List<Product> _allProducts = await getAllProducts();
    List<Product> _cateoryProducts =
        _allProducts.where((product) => product.category == category).toList();
    return _cateoryProducts;
  }

  Future<List<Product>> getOffersProducts() async {
    List<Product> _allProducts = await getAllProducts();
    List<Product> _offersProducts =
        _allProducts.where((product) => product.offer != 0).toList();
    return _offersProducts;
  }
}
