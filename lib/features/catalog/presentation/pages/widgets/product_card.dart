import 'package:auth_template/features/catalog/presentation/cart_cubit/cart_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entity/product_enitity/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
      ),
      child: InkWell( // Добавляем обработку нажатия на всю карточку
        onTap: () {
          context.pushNamed(
            'product-details',
            extra: product,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Блок с картинкой
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: Hero( // Добавляем Hero для анимации перехода
                  tag: 'product_image_${product.id}',
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: theme.colorScheme.primary.withOpacity(0.3),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Блок с текстом
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${product.price.toStringAsFixed(2)} \$',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min, // Чтобы вложенный Row не растягивался
                          children: [
                            Text(
                              product.rating.toStringAsFixed(2),
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 2), // Небольшой отступ между текстом и иконкой
                            Icon(
                              Icons.star_half,
                              size: 20,
                              color: theme.colorScheme.primary,
                            ),
                          ],
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
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
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.add_shopping_cart,
                                size: 20,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}