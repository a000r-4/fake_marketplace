import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entity/cart_item_entity/cart_item_entity.dart';
import '../model/cart_purchase_model/cart_purchase_model.dart';

class FirebaseCartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  // Синхронизация текущей корзины
// 1. Синхронизация корзины
  Future<void> syncCart(List<CartItemEntity> items) async {
    if (_userId == null) return;

    try {
      await _firestore.collection('users_carts').doc(_userId).set({
        // ИСПОЛЬЗУЙТЕ toJson() для каждого элемента
        'items': items.map((item) => item.toJson()).toList(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Ошибка синхронизации корзины: $e');
    }
  }

// 2. Создание заказа
  Future<void> createOrder(List<CartItemEntity> items, double total) async {
    if (_userId == null) return;

    try {
      await _firestore.collection('orders_history').add({
        'userId': _userId,
        // И ЗДЕСЬ ТОЖЕ
        'items': items.map((item) => item.toJson()).toList(),
        'totalAmount': total,
        'createdAt': FieldValue.serverTimestamp(),
        'status': 'completed',
      });
    } catch (e) {
      throw Exception('Ошибка при создании заказа в Firebase: $e');
    }
  }
// Внутри FirebaseCartService
  Future<List<CartItemEntity>> getRemoteCart() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      logger.w("Попытка загрузки корзины: пользователь не авторизован");
      return [];
    }

    try {
      logger.i("Запрос корзины из Firebase для UID: ${user.uid}");

      final doc = await _firestore.collection('users_carts').doc(user.uid).get();

      if (!doc.exists) {
        logger.d("Документ корзины в Firestore отсутствует");
        return [];
      }

      final data = doc.data();
      logger.v("Сырые данные из Firestore получены успешно");

      final List<dynamic> itemsJson = data?['items'] ?? [];
      final items = itemsJson.map((json) => CartItemEntity.fromJson(json)).toList();

      logger.i("Корзина успешно загружена. Количество товаров: ${items.length}");
      return items;
    } catch (e, stack) {
      logger.e("Критическая ошибка при загрузке из Firebase", error: e, stackTrace: stack);
      return [];
    }
  }
  // Внутри FirebaseCartService

  Future<List<PurchaseModel>> getPurchaseHistory() async {
    if (_userId == null) return [];

    try {
      logger.i("Загрузка истории заказов для UID: $_userId");

      final snapshot = await _firestore
          .collection('orders_history')
          .where('userId', isEqualTo: _userId)
          .orderBy('createdAt', descending: true) // Сначала свежие
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        // Преобразуем данные из Firestore в нашу модель PurchaseModel
        return PurchaseModel(
          id: doc.id,
          date: (data['createdAt'] as Timestamp).toDate(),
          items: (data['items'] as List)
              .map((item) => CartItemEntity.fromJson(item))
              .toList(),
          totalAmount: (data['totalAmount'] as num).toDouble(),
        );
      }).toList();
    } catch (e, stack) {
      logger.e("Ошибка при загрузке истории из Firebase", error: e, stackTrace: stack);
      return [];
    }
  }
  Future<void> deleteUserData() async {
    if (_userId == null) return;

    try {
      logger.i("Начинаем полное удаление данных пользователя: $_userId");
      final batch = _firestore.batch();

      // 1. Удаляем документ корзины
      final cartDoc = _firestore.collection('users_carts').doc(_userId);
      batch.delete(cartDoc);

      // 2. Находим и удаляем все заказы из истории
      final orders = await _firestore
          .collection('orders_history')
          .where('userId', isEqualTo: _userId)
          .get();

      for (var doc in orders.docs) {
        batch.delete(doc.reference);
      }

      // Применяем все удаления одной транзакцией (batch)
      await batch.commit();
      logger.i("Все данные пользователя успешно удалены из Firestore");
    } catch (e) {
      logger.e("Ошибка при удалении данных из Firestore", error: e);
      rethrow; // Пробрасываем ошибку дальше, чтобы прервать удаление аккаунта
    }
  }
}