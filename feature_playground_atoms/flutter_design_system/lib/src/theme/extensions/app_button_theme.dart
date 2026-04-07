import 'package:flutter/material.dart';
import '../../components/button/app_button_color.dart';
import '../../components/button/app_button_color_role.dart';
import '../../foundation/app_colors.dart';

final class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  final AppButtonColor primary;

  const AppButtonTheme({required this.primary});

  factory AppButtonTheme.light() => AppButtonTheme(
    primary: AppButtonColor.create(AppColors.purple500),
  );

  factory AppButtonTheme.dark() => AppButtonTheme.light();

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
