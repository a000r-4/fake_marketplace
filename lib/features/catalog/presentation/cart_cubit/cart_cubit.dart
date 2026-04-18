import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/cart_item_entity/cart_item_entity.dart';
import '../../domain/entity/product_enitity/product_entity.dart';

class CartCubit extends Cubit<List<CartItemEntity>> {
  CartCubit() : super([]);

  void addToCart(ProductEntity product) {
    final currentState = List<CartItemEntity>.from(state);
    final index = currentState.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      // Если товар уже есть, увеличиваем количество
      currentState[index] = currentState[index].copyWith(
        quantity: currentState[index].quantity + 1,
      );
    } else {
      // Если нет — добавляем новый
      currentState.add(CartItemEntity(product: product, quantity: 1));
    }
    emit(currentState);
  }

  void removeFromCart(int productId) {
    final currentState = List<CartItemEntity>.from(state);
    currentState.removeWhere((item) => item.product.id == productId);
    emit(currentState);
  }

  void updateQuantity(int productId, int delta) {
    final currentState = List<CartItemEntity>.from(state);
    final index = currentState.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      final newQuantity = currentState[index].quantity + delta;
      if (newQuantity <= 0) {
        currentState.removeAt(index);
      } else {
        currentState[index] = currentState[index].copyWith(quantity: newQuantity);
      }
      emit(currentState);
    }
  }

  double get totalPrice => state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}