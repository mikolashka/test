import 'package:devtools_test/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SimpleInputLayout extends StatelessWidget {
  final String title;
  final bool? obscureText;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final VoidCallback? onClick;

  const SimpleInputLayout({super.key,
    required this.title,
    this.obscureText,
    this.icon,
    this.onClick,
    this.readOnly = false,
    required this.controller,
    this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onClick,
      validator: validator,
      obscureText: obscureText ?? false,
      controller: controller,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        fillColor: Colors.white,
        hintText: title,
        prefixIcon: icon,
        prefixIconColor: AppColors.grayText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
          borderSide: const BorderSide(
            color: AppColors.grayText, // Желтый цвет активной границы
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
          borderSide: const BorderSide(
            color: AppColors.yellow, // Желтый цвет активной границы
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
