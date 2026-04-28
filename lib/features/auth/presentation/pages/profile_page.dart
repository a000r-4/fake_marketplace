import 'package:auth_template/core/utils/timestamp.dart';
import 'package:auth_template/features/auth/domain/entity/user_entity.dart';
import 'package:auth_template/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_template/features/catalog/data/model/cart_purchase_model/cart_purchase_model.dart'; // Убедись в правильности пути
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../catalog/presentation/pages/widgets/purchase_details_sheet.dart';

import 'package:auth_template/features/catalog/presentation/purchase_history_cubit/purchase_history_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Получаем юзера
    final user = context.select<AuthCubit, UserEntity?>(
          (cubit) => cubit.state.maybeWhen(
        authenticated: (user) => user,
        orElse: () => null,
      ),
    );

    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<PurchaseHistoryCubit>().loadHistory(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(), // Нужно для RefreshIndicator
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _buildProfileCard(theme, user),
                const SizedBox(height: 12),
                ListTile(
                  onTap: () => context.pushNamed('profile_edit'),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.settings_suggest_outlined, color: theme.colorScheme.primary),
                  ),
                  title: const Text('Управление профилем', style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const SizedBox(height: 24),
                Text('История заказов',
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                // --- Секция истории покупок через BLOC ---
                BlocBuilder<PurchaseHistoryCubit, PurchaseHistoryState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      error: (message) => Center(
                        child: Text(message, style: const TextStyle(color: Colors.red)),
                      ),
                      success: (purchases) {
                        if (purchases.isEmpty) {
                          return _buildEmptyHistory();
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: purchases.length,
                          itemBuilder: (context, index) {
                            final purchase = purchases[index];
                            return _buildPurchaseCard(context, purchase);
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Выносим маленькие виджеты в методы для чистоты кода
  Widget _buildProfileCard(ThemeData theme, UserEntity user) {
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: theme.colorScheme.primary,
              child: Text(user.email![0].toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 24)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.displayName ?? 'Покупатель',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  Text(user.email!, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseCard(BuildContext context, PurchaseModel purchase) {
    final formattedDate = timestamp(purchase.date);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => PurchaseDetailsSheet(purchase: purchase),
          );
        },
        leading: const CircleAvatar(child: Icon(Icons.shopping_bag)),
        title: Text('Заказ #${purchase.id.substring(purchase.id.length - 5)}'),
        subtitle: Text('$formattedDate\nТоваров: ${purchase.items.length}'),
        trailing: Text(
          '${purchase.totalAmount.toStringAsFixed(2)} \$',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildEmptyHistory() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      child: Column(
        children: [
          Icon(Icons.history_toggle_off, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 12),
          const Text('История заказов пуста', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}