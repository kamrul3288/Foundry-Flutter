import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

final class AppRadioClassicTheme extends ThemeExtension<AppRadioClassicTheme> {
  final AppRadioClassicIntentColors brand;

  const AppRadioClassicTheme({
    required this.brand,
  });

  AppRadioClassicIntentColors byIntent(AppRadioIntent intent) => switch (intent) {
    AppRadioIntent.brand => brand,
  };

  factory AppRadioClassicTheme.light() {
    return AppRadioClassicTheme(
      brand: AppRadioClassicIntentColors(
        unselected: AppRadioClassicStateColors(
          indicator: AppColors.neutral400,
          label: AppColors.neutral500,
          description: AppColors.neutral400,
        ),
        selected: AppRadioClassicStateColors(
          indicator: AppColors.brand500,
          label: AppColors.brand500,
          description: AppColors.brand400,
        ),
        disabled: AppRadioClassicStateColors(
          indicator: AppColors.neutral400,
          label: AppColors.neutral400,
          description: AppColors.neutral300,
        ),
      ),
    );
  }

  // Note: Not fully implemented because currently I do not need dark mode, but the scope is kept.
  factory AppRadioClassicTheme.dark() => AppRadioClassicTheme.light();

  // Note: Not fully implemented because currently I do not need to copy theme, but the scope is kept.
  @override
  ThemeExtension<AppRadioClassicTheme> copyWith() => this;

  // Note: Not fully implemented because currently I do not need to lerp theme, but the scope is kept.
  @override
  ThemeExtension<AppRadioClassicTheme> lerp(covariant ThemeExtension<AppRadioClassicTheme>? other, double t) => this;
}
