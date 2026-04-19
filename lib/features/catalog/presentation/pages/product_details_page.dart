import 'package:auth_template/features/catalog/presentation/pages/widgets/product_skeleton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entity/product_enitity/product_entity.dart';
import '../cart_cubit/cart_cubit.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали товара'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение товара
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: CachedNetworkImage( // БЕЗ Hero
                imageUrl: product.image,
                fit: BoxFit.contain,
                placeholder: (context, url) => const ProductSkeleton(), // Тот же скелетон
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: Colors.grey,
                    size: 80,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Категория
                  Text(
                    product.category.toUpperCase(),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Название
                  Text(
                    product.title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Рейтинг
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'рейтинг в магазине',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Описание
                  Text(
                    'Описание',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Кнопка покупки снизу
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Цена'),
                  Text(
                    '${product.price} \$',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CartCubit>().addToCart(product);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Убираем предыдущий, если он есть
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('"${product.title}" добавлен в корзину'),
                        duration: const Duration(seconds: 3), // Увеличим время, чтобы успеть нажать
                        backgroundColor: theme.colorScheme.primary,
                        action: SnackBarAction(
                          label: 'В КОРЗИНУ',
                          textColor: Colors.white,
                          onPressed: () {
                            context.pushNamed('cart');
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text('В корзину'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}