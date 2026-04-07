import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/app_button_color.dart';
import 'package:flutter_design_system/src/components/button/app_button_intent.dart';
import 'package:flutter_design_system/src/foundation/app_colors.dart';

final class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  final AppButtonVariantSet brand;

  const AppButtonTheme({
    required this.brand,
  });

  AppButtonVariantSet byIntent(AppButtonIntent intent) => switch (intent) {
    AppButtonIntentBrand() => brand,
    AppButtonIntentCustom(variants: final v) => v,
  };

  factory AppButtonTheme.light() => AppButtonTheme(
    brand: AppButtonVariantSet.standard(
      solid: AppColors.purple500,
      onSolid: Colors.white,
    ),
  );

  //if you need dark mode, implement this method
  factory AppButtonTheme.dark() => AppButtonTheme.light();

  //if you need to copy with new values, implement this method
  @override
  ThemeExtension<AppButtonTheme> copyWith() => this;

  //if you need smooth transition between themes, implement this method
  @override
  ThemeExtension<AppButtonTheme> lerp(covariant ThemeExtension<AppButtonTheme>? other, double t) => this;
}
