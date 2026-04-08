import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/card/card.dart';

final class AppCardTheme extends ThemeExtension<AppCardTheme> {
  final AppCardVariantSet neutral;

  const AppCardTheme({
    required this.neutral,
  });

  AppCardVariantSet byTone(AppCardTone tone) => switch (tone) {
    AppCardTone.warning => neutral,
  };

  double defaultElevationFor(AppCardTone tone) => switch (tone) {
    AppCardTone.warning => 0,
  };

  factory AppCardTheme.light() => AppCardTheme(
    neutral: AppCardVariantSet.standard(
      surface: Colors.yellow,
      border: Colors.yellow,
    ),
  );

  // Note: Not fully implemented because currently I do not need dark mode, but the scope is kept.
  factory AppCardTheme.dark() => AppCardTheme.light();

  // Note: Not fully implemented because currently I do not need mutability, but the scope is kept.
  @override
  ThemeExtension<AppCardTheme> copyWith() => this;

  // Note: Not fully implemented because currently I do not need smoothness, but the scope is kept.
  @override
  ThemeExtension<AppCardTheme> lerp(covariant ThemeExtension<AppCardTheme>? other, double t) {
    return this;
  }
}
