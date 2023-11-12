import 'package:devtools_test/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppTextFieldTheme {
  static const _borderRadius = BorderRadius.all(Radius.circular(10));

  static const theme = InputDecorationTheme(
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFD9DEDE)),
      borderRadius: _borderRadius,
      gapPadding: 12,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.dirtyWhite),
      borderRadius: _borderRadius,
      gapPadding: 12,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.yellow),
      borderRadius: _borderRadius,
      gapPadding: 12,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red),
      borderRadius: _borderRadius,
      gapPadding: 12,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red),
      borderRadius: _borderRadius,
      gapPadding: 12,
    ),
    fillColor: AppColors.background,
    filled: true,
  );
}