
import 'package:auth_template/features/catalog/presentation/pages/widgets/product_card.dart';
import 'package:auth_template/features/catalog/presentation/pages/widgets/product_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../catalog_cubit/catalog_cubit.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог товаров'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<CatalogCubit, CatalogState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            // Заменяем индикатор на сетку из скелетонов
            loading: () => GridView.builder(
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(), // Отключаем скролл во время загрузки
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 6, // Отрисовываем 6 карточек-заглушек
              itemBuilder: (context, index) => const ProductSkeleton(),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  Padding(
                    padding:EdgeInsetsGeometry.all(12),
                    child: ElevatedButton(
                      onPressed: () => context.read<CatalogCubit>().loadProducts(),
                      child: const Text('Повторить'),
                    ),
                  ),
                ],
              ),
            ),
            success: (products) => GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            ),
          );
        },
      ),
    );
  }
}