import 'package:flutter/material.dart';
import '../../components/inputfiled/input_field_color.dart';
import '../../foundation/app_colors.dart';

class AppInputTheme extends ThemeExtension<AppInputTheme> {
  final AppInputColor primary;

  const AppInputTheme._({required this.primary});

  factory AppInputTheme.light() => AppInputTheme._(
    primary: AppInputColor.standard(
      fillColor: Colors.white,
      activeBorder: AppColors.purple500,
      inactiveBorder: AppColors.gray200,
      textColor: AppColors.gray900,
      labelColor: AppColors.gray600,
    ),
  );

  factory AppInputTheme.dark() => AppInputTheme.light();

  AppInputColor resolve(AppInputRole role) => switch (role) {
    AppInputRole.primary => primary,
  };

  @override
  ThemeExtension<AppInputTheme> copyWith() => this;
  @override
  ThemeExtension<AppInputTheme> lerp(ThemeExtension<AppInputTheme>? other, double t) => this;
}

enum AppInputRole { primary }
