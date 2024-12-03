import 'package:almabad/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.obscureText,
      this.suffixIcon,
      this.prefixIcon});
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      style: const TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
          filled: true,
          fillColor: AppColor.tootGold,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
