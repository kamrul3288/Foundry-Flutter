import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

final class AppRadioGhostTheme extends ThemeExtension<AppRadioGhostTheme> {
  final AppRadioBtnStateSet brand;

  const AppRadioGhostTheme({
    required this.brand,
  });

  AppRadioBtnStateSet byIntent(AppRadioIntent intent) => switch (intent) {
    AppRadioIntent.brand => brand,
  };

  factory AppRadioGhostTheme.light() => AppRadioGhostTheme(
    brand: AppRadioBtnStateSet(
      idle: AppRadioBtnColors(
        background: Colors.transparent,
        foreground: AppColors.neutral500,
        border: Colors.transparent,
      ),
      selected: AppRadioBtnColors(
        background: AppColors.brand50,
        foreground: AppColors.brand500,
        border: Colors.transparent,
      ),
      disabled: AppRadioBtnColors(
        background: Colors.transparent,
        foreground: AppColors.neutral300,
        border: Colors.transparent,
      ),
    ),
  );

  // Note: Not fully implemented because currently I do not need dark mode, but the scope is kept.
  factory AppRadioGhostTheme.dark() => AppRadioGhostTheme.dark();

  // Note: Not fully implemented because currently I do not need to copy theme, but the scope is kept.
  @override
  ThemeExtension<AppRadioGhostTheme> copyWith() => this;

  // Note: Not fully implemented because currently I do not need to lerp theme, but the scope is kept.
  @override
  ThemeExtension<AppRadioGhostTheme> lerp(covariant ThemeExtension<AppRadioGhostTheme>? other, double t) => this;
}
