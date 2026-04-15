import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  String? _verificationId;
  bool _codeSent = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _sendCode() {
    FocusManager.instance.primaryFocus?.unfocus();

    context.read<AuthBloc>().add(
      AuthBlocEvent.sendPhoneCode(
        phoneNumber: _phoneController.text.trim(),
        codeSent: (verificationId) {
          setState(() {
            _verificationId = verificationId;
            _codeSent = true;
          });
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message), backgroundColor: Colors.red),
          );
        },
      ),
    );
  }

  void _verifyCode() {
    if (_verificationId == null) return;
    FocusManager.instance.primaryFocus?.unfocus();

    context.read<AuthBloc>().add(
      AuthBlocEvent.verifySmsCode(
        verificationId: _verificationId!,
        smsCode: _codeController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Вход по номеру")),
      body: BlocConsumer<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
            },
            failure: (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(e.message), backgroundColor: Colors.red),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!_codeSent) ...[
                  TextField(
                    controller: _phoneController,
                    enabled: !isLoading,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Номер телефона",
                      hintText: "+7 999 999 99 99",
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isLoading ? null : _sendCode,
                    child: isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : const Text("Получить код"),
                  ),
                ] else ...[
                  Text(
                    "Введите код из SMS, отправленный на ${_phoneController.text}",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _codeController,
                    enabled: !isLoading,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Код подтверждения",
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isLoading ? null : _verifyCode,
                    child: isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : const Text("Подтвердить"),
                  ),
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => setState(() {
                      _codeSent = false;
                      _verificationId = null;
                      _codeController.clear();
                    }),
                    child: const Text("Изменить номер телефона"),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}