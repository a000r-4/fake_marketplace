import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Добавляем Hive
import '../../data/model/cart_purchase_model/cart_purchase_model.dart';
import '../../domain/entity/cart_item_entity/cart_item_entity.dart';
import '../../domain/entity/product_enitity/product_entity.dart';

part 'cart_cubit.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.success({
    required List<CartItemEntity> items,
    @Default(0.0) double totalPrice,
  }) = _Success;
  const factory CartState.error(String message) = _Error;
}

class CartCubit extends Cubit<CartState> {
  final Box<CartItemEntity> _cartBox = Hive.box<CartItemEntity>('cart_box');

  CartCubit() : super(const CartState.initial()) {
    loadCart();
  }

  // Загрузка данных из Hive
  Future<void> loadCart() async {
    emit(const CartState.loading());
    try {
      final items = _cartBox.values.toList();
      _emitSuccess(items);
    } catch (e) {
      emit(const CartState.error("Не удалось загрузить корзину"));
    }
  }

  void addToCart(ProductEntity product) {
    final currentItems = _getCurrentItems();
    final index = currentItems.indexWhere((item) => item.product.id == product.id);
    List<CartItemEntity> updatedItems = List.from(currentItems);

    if (index >= 0) {
      updatedItems[index] = updatedItems[index].copyWith(
        quantity: updatedItems[index].quantity + 1,
      );
      _cartBox.putAt(index, updatedItems[index]);
    } else {
      final newItem = CartItemEntity(product: product, quantity: 1);
      updatedItems.add(newItem);
      _cartBox.add(newItem);
    }
    _emitSuccess(updatedItems);
  }

  void updateQuantity(int productId, int delta) {
    final currentItems = _getCurrentItems();
    final index = currentItems.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      List<CartItemEntity> updatedItems = List.from(currentItems);
      final newQuantity = updatedItems[index].quantity + delta;

      if (newQuantity <= 0) {
        _cartBox.deleteAt(index);
        updatedItems.removeAt(index);
      } else {
        updatedItems[index] = updatedItems[index].copyWith(quantity: newQuantity);
        _cartBox.putAt(index, updatedItems[index]);
      }
      _emitSuccess(updatedItems);
    }
  }

  Future<void> checkout() async {
    final currentItems = _getCurrentItems();
    if (currentItems.isEmpty) return;

    try {
      final historyBox = Hive.box<PurchaseModel>('history_box');
      final total = _calculateTotal(currentItems);

      final newPurchase = PurchaseModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        date: DateTime.now(),
        items: List.from(currentItems),
        totalAmount: total,
      );

      await historyBox.add(newPurchase);
      await clearCart();
    } catch (e) {
      emit(CartState.error("Ошибка при оформлении заказа: $e"));
    }
  }

  Future<void> clearCart() async {
    await _cartBox.clear();
    _emitSuccess([]);
  }

  // --- Вспомогательные методы (Private Helpers) ---

  // Метод для быстрого получения текущего списка из любого состояния
  List<CartItemEntity> _getCurrentItems() {
    return state.maybeWhen(
      success: (items, _) => items,
      orElse: () => _cartBox.values.toList(),
    );
  }

  // Считает общую сумму
  double _calculateTotal(List<CartItemEntity> items) {
    return items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  // Упрощает отправку состояния успеха
  void _emitSuccess(List<CartItemEntity> items) {
    emit(CartState.success(
      items: items,
      totalPrice: _calculateTotal(items),
    ));
  }
}