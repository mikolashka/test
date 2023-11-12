import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'input_decoration_theme.dart';

@immutable
abstract class MainTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    useMaterial3: true,
    primaryColor: AppColors.blue,
    inputDecorationTheme: AppTextFieldTheme.theme,
  );
}