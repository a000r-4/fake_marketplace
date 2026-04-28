import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/utils/logger.dart';
import '../../data/datasource/firebase_cart_service.dart';
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
  final FirebaseCartService _firebaseService;
  StreamSubscription<User?>? _authSubscription;

  CartCubit({required FirebaseCartService firebaseService})
      : _firebaseService = firebaseService,
        super(const CartState.initial()) {
    _initAuthListener();
  }

  // Инициализация слушателя смены пользователя
  void _initAuthListener() {
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        logger.i("CartCubit: Пользователь авторизован (UID: ${user.uid}). Загрузка корзины...");
        loadCart();
      } else {
        logger.w("CartCubit: Пользователь вышел. Очистка локальных данных...");
        clearAllLocalData();
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

  // --- Основные методы ---

  Future<void> loadCart() async {
    emit(const CartState.loading());
    try {
      // 1. Мгновенно подгружаем локальные данные из Hive для отзывчивости UI
      final localItems = _cartBox.values.toList();
      if (localItems.isNotEmpty) {
        _emitSuccess(localItems);
      }

      // 2. Идем в облако за актуальными данными текущего пользователя
      final remoteItems = await _firebaseService.getRemoteCart();

      // 3. Синхронизируем локальный кэш с облаком
      if (remoteItems.isNotEmpty) {
        await _cartBox.clear();
        await _cartBox.addAll(remoteItems);
        _emitSuccess(remoteItems);
        logger.i("CartCubit: Корзина синхронизирована с Firebase (${remoteItems.length} товаров)");
      } else if (localItems.isEmpty) {
        _emitSuccess([]);
      }
    } catch (e, stack) {
      logger.e("CartCubit: Ошибка при загрузке корзины", error: e, stackTrace: stack);
      if (_cartBox.isEmpty) {
        emit(CartState.error("Не удалось синхронизировать корзину"));
      }
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

    _syncAll(updatedItems);
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

      _syncAll(updatedItems);
    }
  }

  Future<void> checkout() async {
    final currentItems = _getCurrentItems();
    if (currentItems.isEmpty) return;

    try {
      final total = _calculateTotal(currentItems);

      // 1. Отправляем заказ в Firebase (история покупок)
      await _firebaseService.createOrder(currentItems, total);

      // 2. Сохраняем локально в Hive (локальная история)
      final historyBox = Hive.box<PurchaseModel>('history_box');
      await historyBox.add(PurchaseModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        date: DateTime.now(),
        items: List.from(currentItems),
        totalAmount: total,
      ));

      logger.i("CartCubit: Заказ успешно оформлен");
      await clearCart();
    } catch (e, stack) {
      logger.e("CartCubit: Ошибка при чекауте", error: e, stackTrace: stack);
      emit(CartState.error("Ошибка при оформлении заказа"));
    }
  }


  // Используется при Logout или смене аккаунта
  Future<void> clearAllLocalData() async {
    try {
      await _cartBox.clear();
      final historyBox = Hive.box<PurchaseModel>('history_box');
      await historyBox.clear();

      emit(const CartState.success(items: [], totalPrice: 0.0));
      logger.d("CartCubit: Все локальные данные успешно очищены");
    } catch (e) {
      logger.e("CartCubit: Ошибка при очистке данных", error: e);
    }
  }

  Future<void> clearCart() async {
    await _cartBox.clear();
    _syncAll([]);
  }

  // --- Вспомогательные методы ---

  void _syncAll(List<CartItemEntity> items) {
    _emitSuccess(items);
    _firebaseService.syncCart(items);
  }

  List<CartItemEntity> _getCurrentItems() {
    return state.maybeWhen(
      success: (items, _) => items,
      orElse: () => _cartBox.values.toList(),
    );
  }

  double _calculateTotal(List<CartItemEntity> items) {
    return items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void _emitSuccess(List<CartItemEntity> items) {
    emit(CartState.success(
      items: items,
      totalPrice: _calculateTotal(items),
    ));
  }
}