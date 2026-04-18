import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/product_enitity/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart'; // Появится после запуска build_runner

@freezed
class ProductModel with _$ProductModel {
  // Мы используем именованный конструктор, чтобы модель наследовала поведение Entity
  const factory ProductModel({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    // В Fake API рейтинг приходит как объект { "rate": 3.9, "count": 120 }
    // Мы можем либо создать отдельную модель для рейтинга, либо упростить:
    required Map<String, dynamic> rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

// Extension для удобной конвертации модели в чистую сущность
extension ProductModelX on ProductModel {
  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    price: (price).toDouble(),
    description: description,
    category: category,
    image: image,
    rating: (rating['rate'] as num).toDouble(),
  );
}