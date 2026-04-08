import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

final class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color error;
  final Color onError;

  final Color success;
  final Color onSuccess;

  final Color warning;
  final Color onWarning;

  const AppColorScheme({
    required this.error,
    required this.onError,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith() => this;

  @override
  ThemeExtension<AppColorScheme> lerp(covariant ThemeExtension<AppColorScheme>? other, double t) => this;

  factory AppColorScheme.light() {
    return AppColorScheme(
      error: AppColors.error500,
      onError: Colors.white,
      success: AppColors.success500,
      onSuccess: Colors.white,
      warning: AppColors.warning500,
      onWarning: Colors.white,
    );
  }

  factory AppColorScheme.dark() => AppColorScheme.light();
}
