import 'package:dio/dio.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;
  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('/products');

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception(); // Это перехватит наш репозиторий
    }
  }
}