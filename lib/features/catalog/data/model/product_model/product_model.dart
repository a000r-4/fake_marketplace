import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/product_enitity/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String title,
    required String slug,
    required double price,
    required String description,
    required CategoryModel category, // Вложенная модель категории
    required List<String> images,    // Массив ссылок
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String image,
    required String slug,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
extension ProductModelX on ProductModel {
  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    price: price.toDouble(),
    description: description,
    // Теперь категория берется напрямую из вложенной модели
    category: category.name,
    // Берем первую картинку и чистим её
    image: _getCleanImage(images),
    // Рейтинг ставим дефолтный, так как в этом API его нет
    rating: 4.5,
  );

  String _getCleanImage(List<String> images) {
    if (images.isEmpty) return 'https://via.placeholder.com/150';

    // Очистка от возможных артефактов ["..."] в строке
    return images.first
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('"', '');
  }
}