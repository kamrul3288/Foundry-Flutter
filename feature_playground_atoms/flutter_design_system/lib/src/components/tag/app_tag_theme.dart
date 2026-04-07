import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/tag/tag.dart';
import 'package:flutter_design_system/src/foundation/app_colors.dart';

final class AppTagTheme extends ThemeExtension<AppTagTheme> {
  final AppTagVariantSet brand;
  final AppTagVariantSet info;

  const AppTagTheme({required this.brand, required this.info});

  AppTagVariantSet byIntent(AppTagIntent intent) => switch (intent) {
    AppTagIntent.brand => brand,
    AppTagIntent.info => info,
  };

  factory AppTagTheme.light() => AppTagTheme(
    brand: AppTagVariantSet.standard(solid: AppColors.purple500, onSolid: Colors.white),
    info: AppTagVariantSet.standard(solid: AppColors.gray200, onSolid: Colors.black),
  );

  factory AppTagTheme.dark() => AppTagTheme.light();

  @override
  ThemeExtension<AppTagTheme> copyWith() => this;
  @override
  ThemeExtension<AppTagTheme> lerp(covariant ThemeExtension<AppTagTheme>? other, double t) => this;
}
