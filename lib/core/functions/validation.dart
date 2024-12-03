import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';

class Validation {
  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).emailConnotBeEmpty;
    }
    const emailPattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return S.of(context).enterVaildEmail;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordConnotEmpty;
    }
    if (value.length < 8) {
      return S.of(context).passwordMostBeAtLeast8char;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return S.of(context).passwordMustContainOneUpperLetter;
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return S.of(context).passwordMustContainOneLowerLetter;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return S.of(context).passwordMustContainOnedigit;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return S.of(context).passwordMustContainOneSpecialChar;
    }
    return null;
  }
}
