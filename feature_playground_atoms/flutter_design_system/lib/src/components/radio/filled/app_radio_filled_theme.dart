import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

final class AppRadioFilledTheme extends ThemeExtension<AppRadioFilledTheme> {
  final AppRadioBtnStateSet brand;

  const AppRadioFilledTheme({
    required this.brand,
  });

  AppRadioBtnStateSet byIntent(AppRadioIntent intent) => switch (intent) {
    AppRadioIntent.brand => brand,
  };

  factory AppRadioFilledTheme.light() => AppRadioFilledTheme(
    brand: AppRadioBtnStateSet(
      idle: AppRadioBtnColors(
        background: Colors.transparent,
        foreground: AppColors.neutral600,
        border: AppColors.neutral300,
      ),
      selected: AppRadioBtnColors(
        background: AppColors.brand500,
        foreground: Colors.white,
        border: AppColors.brand500,
      ),
      disabled: AppRadioBtnColors(
        background: AppColors.neutral100,
        foreground: AppColors.neutral300,
        border: AppColors.neutral200,
      ),
    ),
  );

  // Note: Not fully implemented because currently I do not need dark mode, but the scope is kept.
  factory AppRadioFilledTheme.dark() => AppRadioFilledTheme.light();

  // Note: Not fully implemented because currently I do not need to copy theme, but the scope is kept.
  @override
  ThemeExtension<AppRadioFilledTheme> copyWith() => this;

  // Note: Not fully implemented because currently I do not need to lerp theme, but the scope is kept.
  @override
  ThemeExtension<AppRadioFilledTheme> lerp(covariant ThemeExtension<AppRadioFilledTheme>? other, double t) => this;
}
