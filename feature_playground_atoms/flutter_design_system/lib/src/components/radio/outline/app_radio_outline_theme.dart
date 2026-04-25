import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

final class AppRadioOutlineTheme extends ThemeExtension<AppRadioOutlineTheme> {
  final AppRadioBtnStateSet brand;

  const AppRadioOutlineTheme({
    required this.brand,
  });

  AppRadioBtnStateSet byIntent(AppRadioIntent intent) => switch (intent) {
    AppRadioIntent.brand => brand,
  };

  factory AppRadioOutlineTheme.light() => AppRadioOutlineTheme(
    brand: AppRadioBtnStateSet(
      idle: AppRadioBtnColors(
        background: Colors.transparent,
        foreground: AppColors.neutral600,
        border: AppColors.neutral300,
      ),
      selected: AppRadioBtnColors(
        background: AppColors.brand50,
        foreground: AppColors.brand500,
        border: AppColors.brand500,
      ),
      disabled: AppRadioBtnColors(
        background: Colors.transparent,
        foreground: AppColors.neutral300,
        border: AppColors.neutral200,
      ),
    ),
  );

  // Note: Not fully implemented because currently I do not need dark mode, but the scope is kept.
  factory AppRadioOutlineTheme.dark() => AppRadioOutlineTheme.light();

  // Note: Not fully implemented because currently I do not need mutability, but the scope is kept.
  @override
  ThemeExtension<AppRadioOutlineTheme> copyWith() => this;

  // Note: Not fully implemented because currently I do not need smoothness, but the scope is kept.
  @override
  ThemeExtension<AppRadioOutlineTheme> lerp(covariant ThemeExtension<AppRadioOutlineTheme>? other, double t) => this;
}
