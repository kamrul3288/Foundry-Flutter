import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/checkbox/checkbox.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

final class AppCheckboxTheme extends ThemeExtension<AppCheckboxTheme> {
  final AppCheckboxColors colors;

  const AppCheckboxTheme({
    required this.colors,
  });

  factory AppCheckboxTheme.light() => AppCheckboxTheme(
    colors: AppCheckboxColors(
      checked: AppColors.brand500,
      unchecked: AppColors.neutral400,
      disabled: AppColors.neutral300,
      error: AppColors.error500,
    ),
  );

  // Note: Not fully implemented because currently I do not need dark mode, but the scope is kept.
  factory AppCheckboxTheme.dark() => AppCheckboxTheme.light();

  // Note: Not fully implemented because currently I do not need to extend this theme, but the scope is kept.
  @override
  ThemeExtension<AppCheckboxTheme> copyWith() => this;

  // Note: Not fully implemented because currently I do not need to lerp this theme, but the scope is kept.
  @override
  ThemeExtension<AppCheckboxTheme> lerp(covariant ThemeExtension<AppCheckboxTheme>? other, double t) => this;
}
