
import 'package:dio/dio.dart';

import '../../../../core/exceptions/server_exceptions.dart';
import '../../domain/entity/product_enitity/product_entity.dart';
import '../datasource/product_remote_data_soucre.dart';
import '../model/product_model/product_model.dart';

class CatalogRepo{
  final ProductRemoteDataSource remoteDataSource;
  CatalogRepo(this.remoteDataSource);

  Future<List<ProductEntity>> getProducts() async {
    try {

      final List<ProductModel> models = await remoteDataSource.getProducts();
      return models.map((model) => model.toEntity()).toList();

    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw const ServerException('Не удалось загрузить товары');
    }
  }
}