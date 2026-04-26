import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart'; // Добавляем Hive

part 'product_entity.freezed.dart';
part 'product_entity.g.dart'; // Добавляем g.dart для Hive

@freezed
class ProductEntity with _$ProductEntity {
  // Указываем typeId для Hive
  @HiveType(typeId: 2)
  const factory ProductEntity({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required double price,
    @HiveField(3) required String description,
    @HiveField(4) required String category,
    @HiveField(5) required String image,
    @HiveField(6) required double rating,
  }) = _ProductEntity;
}