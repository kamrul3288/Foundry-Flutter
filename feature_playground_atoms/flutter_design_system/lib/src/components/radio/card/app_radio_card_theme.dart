import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

final class AppRadioCardTheme extends ThemeExtension<AppRadioCardTheme> {
  final AppRadioCardStateSet brand;

  const AppRadioCardTheme({
    required this.brand,
  });

  AppRadioCardStateSet byIntent(AppRadioIntent intent) => switch (intent) {
    AppRadioIntent.brand => brand,
  };

  factory AppRadioCardTheme.light() => const AppRadioCardTheme(
    brand: AppRadioCardStateSet(
      idle: AppRadioCardStateColors(
        background: Colors.white,
        border: AppColors.neutral200,
        borderWidth: 1,
        titleColor: AppColors.neutral900,
        descriptionColor: AppColors.neutral500,
        checkBackground: Colors.transparent,
        checkBorder: AppColors.neutral300,
        checkIcon: Colors.transparent,
      ),
      selected: AppRadioCardStateColors(
        background: AppColors.brand50,
        border: AppColors.brand400,
        borderWidth: 2,
        titleColor: AppColors.brand800,
        descriptionColor: AppColors.brand600,
        checkBackground: AppColors.brand500,
        checkBorder: AppColors.brand500,
        checkIcon: Colors.white,
      ),
      disabled: AppRadioCardStateColors(
        background: AppColors.neutral50,
        border: AppColors.neutral200,
        borderWidth: 1,
        titleColor: AppColors.neutral300,
        descriptionColor: AppColors.neutral300,
        checkBackground: AppColors.neutral100,
        checkBorder: AppColors.neutral200,
        checkIcon: Colors.transparent,
      ),
    ),
  );

  factory AppRadioCardTheme.dark() => AppRadioCardTheme.light();

  @override
  ThemeExtension<AppRadioCardTheme> copyWith() => AppRadioCardTheme.light();

  @override
  ThemeExtension<AppRadioCardTheme> lerp(covariant ThemeExtension<AppRadioCardTheme>? other, double t) => this;
}
