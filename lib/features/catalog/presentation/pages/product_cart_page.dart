import 'package:auth_template/features/catalog/presentation/pages/widgets/cart_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/cart_item_entity/cart_item_entity.dart';
import '../cart_cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Корзина')),
      body: BlocBuilder<CartCubit, List<CartItemEntity>>(
        builder: (context, cartItems) {
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
              // Нижняя панель с ценой
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
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
                            '${context.read<CartCubit>().totalPrice.toStringAsFixed(2)} \$',
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
                          onPressed: () {},
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
      ),
    );
  }
}