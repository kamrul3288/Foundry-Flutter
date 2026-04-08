import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/foundation/app_colors.dart';

final class AppTopBarTheme extends ThemeExtension<AppTopBarTheme> {
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;

  const AppTopBarTheme({
    required this.backgroundColor,
    required this.foregroundColor,
    this.elevation = 0,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
  });

  factory AppTopBarTheme.light() => const AppTopBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.gray900,
    elevation: 0,
    scrolledUnderElevation: 2,
    surfaceTintColor: Colors.transparent,
  );

  // Note: Not fully implemented because currently I do not need dark mode, but the scope is kept.
  factory AppTopBarTheme.dark() => AppTopBarTheme.light();

  // Note: Not fully implemented because currently I do not need mutability, but the scope is kept.
  @override
  ThemeExtension<AppTopBarTheme> copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
    double? scrolledUnderElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) {
    return AppTopBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
      scrolledUnderElevation: scrolledUnderElevation ?? this.scrolledUnderElevation,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
    );
  }

  // Note: Not fully implemented because currently I do not need smoothness, but the scope is kept.
  @override
  ThemeExtension<AppTopBarTheme> lerp(covariant ThemeExtension<AppTopBarTheme>? other, double t) => this;
}
