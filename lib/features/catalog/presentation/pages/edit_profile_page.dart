import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../cart_cubit/cart_cubit.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Управление профилем')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Безопасность и аккаунт',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 16),

            // Кнопка удаления аккаунта
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.red.shade50,
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text('Удалить аккаунт', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              subtitle: const Text('Все данные будут стерты безвозвратно'),
              onTap: () => _showDeleteDialog(context),
            ),

            const Spacer(), // Прижимает кнопку выхода к низу

            // Кнопка выхода
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey[800],
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () async {
                  await context.read<CartCubit>().clearAllLocalData();
                  if (context.mounted) {
                    context.read<AuthBloc>().add(const AuthBlocEvent.signOut());
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Выйти из аккаунта'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Подтвердите удаление'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Это действие необратимо. Введите пароль для подтверждения.'),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Ваш пароль',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              final password = passwordController.text.trim();
              if (password.isNotEmpty) {
                // 1. Сначала подтверждаем личность, потом удаляем
                // Можно передать пароль в событие Блока
                context.read<AuthBloc>().add(AuthBlocEvent.deleteAccount(password: password));
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Удалить всё', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}