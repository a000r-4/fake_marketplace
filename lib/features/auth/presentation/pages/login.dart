import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/exceptions/auth_exceptions.dart';
import '../../../../core/validators/auth_validator.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_textfield.dart';

enum AuthType { login, register }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordHidden = true;
  bool _confirmPasswordHidden = true;
  bool _showErrors = false;
  bool _isSubmitting = false;

  AuthType _authType = AuthType.register;

  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _toggleMode() {
    setState(() {
      _authType = _authType == AuthType.login ? AuthType.register : AuthType.login;
      _formKey.currentState?.reset();
      _showErrors = false;
      _emailError = null;
      _passwordError = null;
      _passwordController.clear();
      _confirmPasswordController.clear();
    });
  }

  void _onFieldChanged() {
    if (_emailError != null || _passwordError != null) {
      setState(() {
        _emailError = null;
        _passwordError = null;
      });
    }
  }

  void _submit() {
    if (_isSubmitting) return;

    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _showErrors = true);

    if (!_formKey.currentState!.validate()) return;

    if (_authType == AuthType.register &&
        _passwordController.text != _confirmPasswordController.text) {
      setState(() => _passwordError = "Пароли не совпадают");
      return;
    }
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    if (_authType == AuthType.login) {
      context.read<AuthBloc>().add(AuthBlocEvent.signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      ));
    } else {
      context.read<AuthBloc>().add(AuthBlocEvent.signUpWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      ));
    }

    setState(() {
      _isSubmitting = true;
      _emailError = null;
      _passwordError = null;
    });
    if (_authType == AuthType.login) {
      context.read<AuthBloc>().add(AuthBlocEvent.signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      ));
    } else {
      context.read<AuthBloc>().add(AuthBlocEvent.signUpWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      ));
    }
  }

  void _handleFailure(AuthException ex) {
    setState(() {
      _isSubmitting = false;
      switch (ex.type) {
        case AuthErrorType.invalidEmail:
        case AuthErrorType.userNotFound:
          _emailError = ex.message;
          break;
        case AuthErrorType.wrongPassword:
        case AuthErrorType.weakPassword:
          _passwordError = ex.message;
          break;
        default:
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(ex.message), backgroundColor: Colors.red),
            );
          });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            setState(() => _isSubmitting = false);
          },
          failure: (ex) {
            _handleFailure(ex);
          },
          loading: () {
            setState(() => _isSubmitting = true);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_authType == AuthType.login ? 'Вход' : 'Регистрация'),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Form(
                  key: _formKey,
                  autovalidateMode: _showErrors
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AuthTextField(
                        controller: _emailController,
                        validators: [AuthValidators.email],
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        showErrors: _showErrors,
                        errorText: _emailError,
                        onChanged: (_) => _onFieldChanged(),
                      ),
                      const SizedBox(height: 16),
                      AuthTextField(
                        controller: _passwordController,
                        validators: [AuthValidators.password],
                        label: 'Пароль',
                        showErrors: _showErrors,
                        errorText: _passwordError,
                        obscureText: _passwordHidden,
                        onChanged: (_) => _onFieldChanged(),
                        child: IconButton(
                          icon: Icon(_passwordHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () =>
                              setState(() => _passwordHidden = !_passwordHidden),
                        ),
                      ),
                      if (_authType == AuthType.register) ...[
                        const SizedBox(height: 16),
                        AuthTextField(
                          controller: _confirmPasswordController,
                          validators: [
                            AuthValidators.confirmPassword(
                                _passwordController.text)
                          ],
                          label: 'Подтвердите пароль',
                          showErrors: _showErrors,
                          obscureText: _confirmPasswordHidden,
                          onChanged: (_) => _onFieldChanged(),
                          child: IconButton(
                            icon: Icon(_confirmPasswordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            onPressed: () => setState(
                                    () => _confirmPasswordHidden = !_confirmPasswordHidden),
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _isSubmitting ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: _isSubmitting
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(_authType == AuthType.login
                            ? 'Войти'
                            : 'Создать аккаунт'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _toggleMode,
                        child: Text(_authType == AuthType.login
                            ? 'Еще нет аккаунта? Зарегистрируйтесь'
                            : 'Уже есть аккаунт? Войдите'),
                      ),
                      TextButton(
                        onPressed: () =>
                            GoRouter.of(context).push('/phone'),
                        child: const Text('По номеру телефона'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}