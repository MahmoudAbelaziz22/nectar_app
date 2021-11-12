import 'package:dio/dio.dart';
import 'package:nectar_app/constants.dart';

class ProductsWebServices {
  late Dio _dio;

  ProductsWebServices() {
    _dio = Dio();
  }

  Future<dynamic> getAllProducts() async {
    try {
      Response response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        var jsonData = response.data;
        return jsonData;
      } else {
        print('Error Ocurred with StatusCode= ${response.statusCode}');
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
