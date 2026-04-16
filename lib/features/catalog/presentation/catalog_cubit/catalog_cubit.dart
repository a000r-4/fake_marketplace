import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/exceptions/server_exceptions.dart';
import '../../data/repos/catalog_repo.dart';
import '../../domain/entity/product_entity.dart';
part 'catalog_cubit.freezed.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState.initial() = _Initial;
  const factory CatalogState.loading() = _Loading;
  const factory CatalogState.success(List<ProductEntity> products) = _Success;
  const factory CatalogState.error(String message) = _Error;
}

class CatalogCubit extends Cubit<CatalogState> {
  final CatalogRepo _repo;

  CatalogCubit(this._repo) : super(const CatalogState.initial());

  Future<void> loadProducts() async {
    emit(const CatalogState.loading());
    try {
      final products = await _repo.getProducts();
      emit(CatalogState.success(products));
    } on ServerException catch (e) {
      emit(CatalogState.error(e.message));
    } catch (e) {
      emit(const CatalogState.error('Произошла непредвиденная ошибка'));
    }
  }
}