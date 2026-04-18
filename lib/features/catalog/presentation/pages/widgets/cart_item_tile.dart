import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/cart_item_entity/cart_item_entity.dart';
import '../../cart_cubit/cart_cubit.dart';

class CartItemTile extends StatelessWidget {
  final CartItemEntity item;

  const CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cartCubit = context.read<CartCubit>();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          // Миниатюра товара
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.white,
              child: CachedNetworkImage(
                imageUrl: item.product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Инфо о товаре
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '${item.product.price} \$',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Управление количеством
          Column(
            children: [
              Row(
                children: [
                  _QtyButton(
                    icon: Icons.remove,
                    onPressed: () => cartCubit.updateQuantity(item.product.id, -1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${item.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  _QtyButton(
                    icon: Icons.add,
                    onPressed: () => cartCubit.updateQuantity(item.product.id, 1),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Маленькая вспомогательная кнопка для +/-
class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QtyButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 18),
        style: IconButton.styleFrom(
          backgroundColor: Colors.blue.withOpacity(0.1),
          foregroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}