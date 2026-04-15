import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class AuthValidators {
  static final email = ValidationBuilder()
      .required('Введите email')
      .email('Некорректный email')
      .build();

  static final password = ValidationBuilder()
      .required('Введите пароль')
      .minLength(6, 'Минимум 6 символов')
      .build();

  static FormFieldValidator<String> confirmPassword(String password) {
    return ValidationBuilder()
        .required('Подтвердите пароль')
        .add((value) {
      if (value != password) {
        return 'Пароли не совпадают';
      }
      return null;
    }).build();
  }
}