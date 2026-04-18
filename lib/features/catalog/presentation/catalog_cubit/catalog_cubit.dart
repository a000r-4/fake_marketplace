import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/exceptions/server_exceptions.dart';
import '../../data/repos/catalog_repo.dart';
import '../../domain/entity/product_enitity/product_entity.dart';
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

  // Храним полный список, чтобы не запрашивать API при каждом поиске
  List<ProductEntity> _allProducts = [];
  String _currentQuery = '';
  String _selectedCategory = 'Все';

  CatalogCubit(this._repo) : super(const CatalogState.initial());

  Future<void> loadProducts() async {
    emit(const CatalogState.loading());
    try {
      _allProducts = await _repo.getProducts();
      emit(CatalogState.success(_allProducts));
    } on ServerException catch (e) {
      emit(CatalogState.error(e.message));
    } catch (e) {
      emit(const CatalogState.error('Ошибка загрузки'));
    }
  }

  void filterProducts({String? query, String? category}) {
    _currentQuery = query ?? _currentQuery;
    _selectedCategory = category ?? _selectedCategory;

    final filtered = _allProducts.where((product) {
      final matchesQuery = product.title.toLowerCase().contains(_currentQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'Все' || product.category == _selectedCategory;
      return matchesQuery && matchesCategory;
    }).toList();

    emit(CatalogState.success(filtered));
  }
}