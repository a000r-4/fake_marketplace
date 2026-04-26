import 'package:hive/hive.dart';
import '../../../domain/entity/cart_item_entity/cart_item_entity.dart';
part 'cart_purchase_model.g.dart';
@HiveType(typeId: 0)
class PurchaseModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final List<CartItemEntity> items;
  @HiveField(3)
  final double totalAmount;

  PurchaseModel({
    required this.id,
    required this.date,
    required this.items,
    required this.totalAmount,
  });
}