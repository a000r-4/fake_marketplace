import 'package:auth_template/core/utils/timestamp.dart';
import 'package:auth_template/features/auth/domain/entity/user_entity.dart';
import 'package:auth_template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_template/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_template/features/catalog/data/model/cart_purchase_model/cart_purchase_model.dart'; // Убедись в правильности пути
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../catalog/presentation/pages/widgets/purchase_details_sheet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
      appBar: AppBar(title: const Text('Профиль')),
      body: SingleChildScrollView( // Добавляем скролл, так как история может быть длинной
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 16),

// Строка управления профилем
              ListTile(
                onTap: () {
                  // Если используешь GoRouter:
                   context.pushNamed('profile_edit');

                  // Если обычный Navigator:

                },
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.settings_suggest_outlined, color: theme.colorScheme.primary),
                ),
                title: const Text('Управление профилем', style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: const Text('Имя, пароль, настройки аккаунта'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: theme.colorScheme.primary,
                        child: Text(
                          user.email![0].toUpperCase(),
                          style: const TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.displayName ?? 'Покупатель',
                              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                          Text(user.email!, style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Text('История заказов', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              // --- Секция истории покупок из Hive ---
              ValueListenableBuilder(
                valueListenable: Hive.box<PurchaseModel>('history_box').listenable(),
                builder: (context, Box<PurchaseModel> box, _) {
                  final purchases = box.values.toList().reversed.toList(); // Сначала новые

                  if (purchases.isEmpty) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 12),
                          const Text('Вы еще ничего не купили', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true, // Позволяет ListView работать внутри Column
                    physics: const NeverScrollableScrollPhysics(), // Скроллить будет SingleChildScrollView
                    itemCount: purchases.length,
                    itemBuilder: (context, index) {
                      final purchase = purchases[index];
                      // Форматируем дату: "22 апреля, 17:44"
                      final formattedDate = timestamp(purchase.date);

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          onTap: () {
                            // Вызываем наш созданный Sheet
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => PurchaseDetailsSheet(purchase: purchase),
                            );
                          },
                          leading: const CircleAvatar(child: Icon(Icons.check)),
                          title: Text('Заказ #${purchase.id.substring(purchase.id.length - 5)}'),
                          subtitle: Text('$formattedDate\nТоваров: ${purchase.items.length}'),
                          isThreeLine: true,
                          trailing: const Icon(Icons.chevron_right), // Добавим иконку стрелочки
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}