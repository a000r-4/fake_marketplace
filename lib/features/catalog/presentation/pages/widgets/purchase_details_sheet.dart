import 'package:flutter/material.dart';
import '../../../../../core/utils/timestamp.dart';
import '../../../data/model/cart_purchase_model/cart_purchase_model.dart';

class PurchaseDetailsSheet extends StatelessWidget {
  final PurchaseModel purchase;

  const PurchaseDetailsSheet({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedDate = timestamp(purchase.date);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom:20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text('Детали заказа', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          Text(formattedDate, style: TextStyle(color: Colors.grey[600])),
          const Divider(height: 32),

          // Список товаров в заказе
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: purchase.items.length,
              itemBuilder: (context, index) {
                final item = purchase.items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.product.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.product.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w500)),
                            Text('${item.quantity} шт. × ${item.product.price} \$', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                          ],
                        ),
                      ),
                      Text('${(item.product.price * item.quantity).toStringAsFixed(2)} \$', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Итого:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(
                '${purchase.totalAmount.toStringAsFixed(2)} \$',
                style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}