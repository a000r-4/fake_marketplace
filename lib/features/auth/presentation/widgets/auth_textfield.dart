import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    required this.controller,
    required this.onChanged,
    this.keyboardType,
    this.obscureText,
    this.child,
    this.label,
    this.hint,
    this.isPassword = false,
    this.showErrors = false,
    this.validators = const [],
    this.maxLength = 50,
    this.errorText,
    super.key,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final bool showErrors;
  final List<String? Function(String)> validators;
  final Widget? child;
  final int? maxLength;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? _error() {
    if (!widget.showErrors || _focusNode.hasFocus) {
      return null;
    }

    for (final validator in widget.validators) {
      final check = validator(widget.controller.text);
      if (check != null) {
        return check;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (newFocus) {
        setState(() {});
      },
      child: TextFormField(
        obscureText: widget.obscureText ?? false ,
        controller: widget.controller,
        focusNode: _focusNode,
        maxLength: widget.maxLength,
        onChanged: (value) {
          widget.onChanged(value);
          setState(() {});
        },
        decoration: InputDecoration(
          suffixIcon: widget.child,
          counter: const SizedBox(),
          contentPadding: EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
          isDense: true,
          focusedBorder: _getFocusedBorder(),
          focusedErrorBorder: _getBorder(_error() != null),
          enabledBorder: _getBorder(_error() != null),
          errorBorder: _getBorder(_error() != null),
          errorText: _error(),
          label: widget.label == null
              ? null
              : Container(color: Colors.white, child: Text(widget.label!)),
          hintText: _focusNode.hasFocus ? '' : widget.hint,
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  InputBorder? _getFocusedBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.blue, width: 2),
  );

  InputBorder? _getBorder(bool isError) {
    if (isError) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      );
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: widget.controller.text.isNotEmpty
            ? Colors.blueAccent
            : Colors.blueGrey,
        width: 2,
      ),
    );
  }
}