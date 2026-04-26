import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart'; // Добавляем Hive
import '../product_enitity/product_entity.dart';

part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart'; // Добавляем g.dart для Hive

@freezed
class CartItemEntity with _$CartItemEntity {
  @HiveType(typeId: 1)
  const factory CartItemEntity({
    @HiveField(0) required ProductEntity product,
    @HiveField(1) required int quantity,
  }) = _CartItemEntity;
}