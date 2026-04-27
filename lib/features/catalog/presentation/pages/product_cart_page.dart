import 'package:auth_template/features/catalog/presentation/pages/widgets/cart_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cart_cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Слушаем CartCubit с новым стейтом CartState
    return Scaffold(
      appBar: AppBar(title: const Text('Корзина')),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          // Используем паттерн-матчинг (when/maybeWhen) из Freezed
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message, style: const TextStyle(color: Colors.red))),
            success: (cartItems, totalPrice) {
              if (cartItems.isEmpty) {
                return const Center(child: Text('Корзина пуста'));
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: cartItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return CartItemTile(item: item);
                      },
                    ),
                  ),

                  // Нижняя панель
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                    ),
                    child: SafeArea(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Итого:'),
                              Text(
                                // Теперь берем цену напрямую из стейта!
                                '${totalPrice.toStringAsFixed(2)} \$',
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Вызываем оформление заказа
                                context.read<CartCubit>().checkout();

                                // Можно добавить SnackBar после нажатия
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Заказ оформлен!')),
                                );
                              },
                              child: const Text('Оформить заказ'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}