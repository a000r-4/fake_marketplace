import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required double rating,
  }) = _ProductEntity;
}