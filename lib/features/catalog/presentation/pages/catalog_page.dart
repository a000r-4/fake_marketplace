
import 'package:auth_template/features/catalog/presentation/pages/widgets/product_card.dart';
import 'package:auth_template/features/catalog/presentation/pages/widgets/product_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../catalog_cubit/catalog_cubit.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = ['Все', 'electronics', 'jewelery', "men's clothing", "women's clothing"];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('cart'),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      appBar: AppBar(
        // Вместо Title вставляем TextField
        title: TextField(
          onChanged: (value) => context.read<CatalogCubit>().filterProducts(query: value),
          decoration: InputDecoration(
            hintText: 'Поиск товаров...',
            prefixIcon: const Icon(Icons.search, size: 20),
            border: InputBorder.none,
            hintStyle: TextStyle(color: theme.colorScheme.outline),
          ),
        ),
      ),
      body: Column(
        children: [
          // Список тегов (Категории)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: categories.map((cat) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(cat),
                  onSelected: (selected) {
                    context.read<CatalogCubit>().filterProducts(category: cat);
                  },
                  selectedColor: theme.colorScheme.primaryContainer,
                  checkmarkColor: theme.colorScheme.primary,
                ),
              )).toList(),
            ),
          ),

          // Основной контент
          Expanded(
            child: BlocBuilder<CatalogCubit, CatalogState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => _buildSkeletonGrid(),
                  error: (msg) => _buildError(context, msg),
                  success: (products) {
                    if (products.isEmpty) {
                      return const Center(child: Text('Ничего не найдено'));
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) => ProductCard(product: products[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Выносим громоздкие части в отдельные методы для чистоты кода
  Widget _buildSkeletonGrid() => GridView.builder(
    padding: const EdgeInsets.all(16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    ),
    itemCount: 6,
    itemBuilder: (_, __) => const ProductSkeleton(),
  );

// Обновленный метод _buildError в CatalogPage
  Widget _buildError(BuildContext context, String msg) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.cloud_off, size: 48, color: Colors.grey),
        const SizedBox(height: 16),
        Text(
          "Не удалось обновить данные",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    ),
  );
}