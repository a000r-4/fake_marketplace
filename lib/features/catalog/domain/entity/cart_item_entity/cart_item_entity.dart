import 'package:freezed_annotation/freezed_annotation.dart';
import '../product_enitity/product_entity.dart';
part 'cart_item_entity.freezed.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required ProductEntity product,
    required int quantity,
  }) = _CartItemEntity;
}