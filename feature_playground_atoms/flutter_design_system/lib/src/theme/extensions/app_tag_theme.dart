import 'package:flutter/material.dart';
import '../../components/tag/app_tag_colors.dart';
import '../../foundation/app_colors.dart';

final class AppTagTheme extends ThemeExtension<AppTagTheme> {
  final AppTagColors primary;
  final AppTagColors neutral;

  const AppTagTheme({
    required this.primary,
    required this.neutral,
  });

  factory AppTagTheme.light() => AppTagTheme(
    primary: AppTagColors.standard(
      AppColors.purple500,
      outlineFillBackground: AppColors.purple100,
    ),
    neutral: AppTagColors.standard(
      AppColors.gray200,
      foreground: AppColors.gray700,
      outlineFillBackground: AppColors.gray100,
    ),
  );

  factory AppTagTheme.dark() => AppTagTheme.light();

  @override
  ThemeExtension<AppTagTheme> copyWith() => this;
  @override
  ThemeExtension<AppTagTheme> lerp(covariant ThemeExtension<AppTagTheme>? other, double t) => this;

  AppTagColors resolve(AppTagColorRole role) => switch (role) {
    AppTagColorRole.primary => primary,
    AppTagColorRole.neutral => neutral,
  };
}

enum AppTagColorRole { primary, neutral }
