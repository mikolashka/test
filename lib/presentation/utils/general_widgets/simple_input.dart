import 'package:devtools_test/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleInputLayout extends StatelessWidget {
  final String title;
  final bool? obscureText;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType? keyboardType;
  final VoidCallback? onClick;
  final List<TextInputFormatter>? inputFormatters;

  const SimpleInputLayout(
      {super.key,
      required this.title,
      this.obscureText,
      this.inputFormatters,
      this.icon,
      this.onClick,
      this.readOnly = false,
      required this.controller,
      this.validator,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onClick,
      validator: validator,
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        fillColor: Colors.white,
        hintText: title,
        prefixIcon: icon,
        prefixIconColor: AppColors.grayText,
      ),
    );
  }
}
