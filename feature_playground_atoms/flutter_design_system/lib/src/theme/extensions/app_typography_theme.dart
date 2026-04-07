import 'package:flutter/material.dart';
import '../../foundation/app_typography_tokens.dart';
import '../app_color_scheme.dart';

class AppTypographyTheme extends ThemeExtension<AppTypographyTheme> {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle caption;
  final TextStyle captionSmall;

  AppTypographyTheme._({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.caption,
    required this.captionSmall,
  });

  factory AppTypographyTheme.textStyleTheme(AppColorScheme colorScheme) {
    return AppTypographyTheme._(
      h1: TextStyle(fontSize: AppFontSize.h1, fontWeight: AppFontWeight.bold, height: 1.15, letterSpacing: -0.2, color: colorScheme.textPrimary),
      h2: TextStyle(fontSize: AppFontSize.h2, fontWeight: AppFontWeight.semiBold, height: 1.15, letterSpacing: -0.2, color: colorScheme.textPrimary),
      h3: TextStyle(fontSize: AppFontSize.h3, fontWeight: AppFontWeight.medium, height: 1.15, letterSpacing: -0.2, color: colorScheme.textPrimary),

      titleLarge: TextStyle(fontSize: AppFontSize.titleLarge, fontWeight: AppFontWeight.bold, height: 1.2, color: colorScheme.textPrimary),
      titleMedium: TextStyle(fontSize: AppFontSize.titleMedium, fontWeight: AppFontWeight.semiBold, height: 1.4, letterSpacing: 0.1, color: colorScheme.textPrimary),
      titleSmall: TextStyle(fontSize: AppFontSize.titleSmall, fontWeight: AppFontWeight.medium, height: 1.4, letterSpacing: 0.1, color: colorScheme.textPrimary),

      bodyLarge: TextStyle(fontSize: AppFontSize.bodyLarge, fontWeight: AppFontWeight.regular, height: 1.5, letterSpacing: 0.2, color: colorScheme.textPrimary),
      bodyMedium: TextStyle(fontSize: AppFontSize.bodyMedium, fontWeight: AppFontWeight.regular, height: 1.5, letterSpacing: 0.2, color: colorScheme.textPrimary),
      bodySmall: TextStyle(fontSize: AppFontSize.bodySmall, fontWeight: AppFontWeight.regular, height: 1.4, letterSpacing: 0.4, color: colorScheme.textPrimary),

      caption: TextStyle(fontSize: AppFontSize.caption, fontWeight: AppFontWeight.medium, height: 1.3, letterSpacing: 0.5, color: colorScheme.textSecondary),
      captionSmall: TextStyle(fontSize: AppFontSize.captionSmall, fontWeight: AppFontWeight.medium, height: 1.3, letterSpacing: 0.5, color: colorScheme.textSecondary),
    );
  }

  TextStyle getVariant(AppTypographyVariant variant) {
    return switch (variant) {
      AppTypographyVariant.h1 => h1,
      AppTypographyVariant.h2 => h2,
      AppTypographyVariant.h3 => h3,
      AppTypographyVariant.titleLarge => titleLarge,
      AppTypographyVariant.titleMedium => titleMedium,
      AppTypographyVariant.titleSmall => titleSmall,
      AppTypographyVariant.bodyLarge => bodyLarge,
      AppTypographyVariant.bodyMedium => bodyMedium,
      AppTypographyVariant.bodySmall => bodySmall,
      AppTypographyVariant.caption => caption,
      AppTypographyVariant.captionSmall => captionSmall,
    };
  }

  @override
  ThemeExtension<AppTypographyTheme> copyWith() => this;
  @override
  ThemeExtension<AppTypographyTheme> lerp(ThemeExtension<AppTypographyTheme>? other, double t) => this;
}
