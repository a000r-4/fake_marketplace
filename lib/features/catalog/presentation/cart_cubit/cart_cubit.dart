import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Добавляем Hive
import '../../data/model/cart_purchase_model/cart_purchase_model.dart';
import '../../domain/entity/cart_item_entity/cart_item_entity.dart';
import '../../domain/entity/product_enitity/product_entity.dart';

class CartCubit extends Cubit<List<CartItemEntity>> {
  // Получаем коробку, которую открыли в main.dart
  final Box<CartItemEntity> _cartBox = Hive.box<CartItemEntity>('cart_box');

  CartCubit() : super([]) {
    // При запуске загружаем сохраненные данные
    _loadFromHive();
  }

  void _loadFromHive() {
    emit(_cartBox.values.toList());
  }

  void addToCart(ProductEntity product) {
    final currentState = List<CartItemEntity>.from(state);
    final index = currentState.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      final updatedItem = currentState[index].copyWith(
        quantity: currentState[index].quantity + 1,
      );
      currentState[index] = updatedItem;
      // Обновляем в Hive по индексу
      _cartBox.putAt(index, updatedItem);
    } else {
      final newItem = CartItemEntity(product: product, quantity: 1);
      currentState.add(newItem);
      // Добавляем новый элемент в Hive
      _cartBox.add(newItem);
    }
    emit(currentState);
  }

  void removeFromCart(int productId) {
    final currentState = List<CartItemEntity>.from(state);
    final index = currentState.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      _cartBox.deleteAt(index); // Удаляем из памяти устройства
      currentState.removeAt(index);
      emit(currentState);
    }
  }

  void updateQuantity(int productId, int delta) {
    final currentState = List<CartItemEntity>.from(state);
    final index = currentState.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      final newQuantity = currentState[index].quantity + delta;

      if (newQuantity <= 0) {
        _cartBox.deleteAt(index); // Удаляем физически
        currentState.removeAt(index);
      } else {
        final updatedItem = currentState[index].copyWith(quantity: newQuantity);
        currentState[index] = updatedItem;
        _cartBox.putAt(index, updatedItem); // Перезаписываем в Hive
      }
      emit(currentState);
    }
  }

  // Метод для полной очистки корзины
  Future<void> clearCart() async {
    try {
      // 1. Очищаем физическую коробку в Hive
      // Это удалит все записи с диска устройства
      await _cartBox.clear();

      // 2. Обновляем состояние Cubit пустым списком
      // Это заставит UI (BlocBuilder) мгновенно перерисоваться
      emit([]);

      // (Опционально) Можно добавить лог для отладки
      print("Корзина успешно очищена в Hive и State");
    } catch (e) {
      // Обработка ошибок, если что-то пошло не так при работе с диском
      print("Ошибка при очистке корзины: $e");
    }
  }
  // Добавь этот метод в свой CartCubit
  Future<void> checkout() async {
    if (state.isEmpty) return;

    try {
      // 1. Открываем коробку с историей
      final historyBox = Hive.box<PurchaseModel>('history_box');

      // 2. Создаем объект покупки
      final newPurchase = PurchaseModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        date: DateTime.now(),
        items: List.from(state), // Копируем текущие товары
        totalAmount: totalPrice,
      );

      // 3. Сохраняем в историю в Hive
      await historyBox.add(newPurchase);

      // 4. Очищаем текущую корзину (и в Hive, и в стейте)
      await clearCart();

      // Здесь можно добавить логику уведомления об успехе
    } catch (e) {
      // Обработка ошибок (например, если диск переполнен)
      print("Ошибка при оформлении заказа: $e");
    }
  }

  double get totalPrice => state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}