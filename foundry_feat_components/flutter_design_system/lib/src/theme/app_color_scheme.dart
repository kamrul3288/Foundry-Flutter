import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/foundation/app_colors.dart';

final class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color brandPrimary;
  final Color onBrandPrimary;
  final Color brandPrimaryContainer; //light background color
  final Color onBrandPrimaryContainer;

  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;

  final Color error;
  final Color onError;

  final Color success;
  final Color onSuccess;

  final Color warning;
  final Color onWarning;

  final Color background; // App's main background
  final Color surface; //Cards, Sheets, Dialogs

  final Color textPrimary;
  final Color textSecondary;
  final Color textSubtle;
  final Color textDisabled;

  final Color border; // default border color
  final Color divider; // default divier color

  const AppColorScheme({
    required this.brandPrimary,
    required this.onBrandPrimary,
    required this.brandPrimaryContainer,
    required this.onBrandPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.error,
    required this.onError,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.textSubtle,
    required this.textDisabled,
    required this.border,
    required this.divider,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith() => this;

  @override
  ThemeExtension<AppColorScheme> lerp(covariant ThemeExtension<AppColorScheme>? other, double t) => this;

  factory AppColorScheme.light() {
    return AppColorScheme(
      brandPrimary: AppColors.purple500,
      onBrandPrimary: Colors.white,
      brandPrimaryContainer: AppColors.purple200,
      onBrandPrimaryContainer: AppColors.purple900,
      secondary: AppColors.blue500,
      onSecondary: Colors.white,
      secondaryContainer: AppColors.blue200,
      onSecondaryContainer: AppColors.blue900,
      error: AppColors.red500,
      onError: Colors.white,
      success: AppColors.green500,
      onSuccess: Colors.white,
      warning: AppColors.yellow500,
      onWarning: Colors.white,
      background: Colors.white,
      surface: Colors.white,
      textPrimary: Colors.black,
      textSecondary: AppColors.gray800,
      textSubtle: AppColors.gray600,
      textDisabled: AppColors.gray500,
      border: AppColors.gray400,
      divider: AppColors.gray400,
    );
  }

  factory AppColorScheme.dark() {
    return AppColorScheme(
      brandPrimary: AppColors.purple300, // Lighter, easier on eyes
      onBrandPrimary: AppColors.gray900, // Dark text on light button
      brandPrimaryContainer: AppColors.purple900, // Dark container
      onBrandPrimaryContainer: AppColors.purple100, // Light text
      secondary: AppColors.blue300,
      onSecondary: AppColors.gray900,
      secondaryContainer: AppColors.blue900,
      onSecondaryContainer: AppColors.blue100,
      error: AppColors.red300,
      onError: AppColors.gray900,
      success: AppColors.green300,
      onSuccess: AppColors.gray900,
      warning: AppColors.yellow300,
      onWarning: AppColors.gray900,
      background: AppColors.gray900, // Absolute Dark
      surface: AppColors.gray800, // Lighter than background (Elevation)
      textPrimary: AppColors.gray50, // Almost White
      textSecondary: AppColors.gray300, // Light Gray
      textSubtle: AppColors.gray400, // Dimmer Gray
      textDisabled: AppColors.gray600, // Dark Gray
      border: AppColors.gray700, // Visible on dark bg
      divider: AppColors.gray800,
    );
  }
}
