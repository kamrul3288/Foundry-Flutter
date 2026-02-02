import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/app_button_color.dart';
import 'package:flutter_design_system/src/components/button/app_button_color_role.dart';
import 'package:flutter_design_system/src/foundation/app_colors.dart';

final class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  final AppButtonColor primary;

  const AppButtonTheme({required this.primary});

  factory AppButtonTheme.light() => AppButtonTheme(
    primary: AppButtonColor.init(AppColors.purple500),
  );

  factory AppButtonTheme.dark() => AppButtonTheme(
    primary: AppButtonColor.init(AppColors.purple500),
  );

  @override
  ThemeExtension<AppButtonTheme> copyWith() => this;

  @override
  ThemeExtension<AppButtonTheme> lerp(covariant ThemeExtension<AppButtonTheme>? other, double t) => this;

  AppButtonColor resolve(AppButtonColorRole role) {
    return switch (role) {
      AppButtonColorPrimary() => primary,
      AppButtonColorCustom(color: final color) => color,
    };
  }
}
