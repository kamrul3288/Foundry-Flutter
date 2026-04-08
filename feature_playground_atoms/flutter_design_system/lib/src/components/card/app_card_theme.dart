import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/card/card.dart';

final class AppCardTheme extends ThemeExtension<AppCardTheme> {
  final AppCardVariantSet neutral;

  const AppCardTheme({
    required this.neutral,
  });

  AppCardVariantSet byTone(AppCardTone tone) => switch (tone) {
    AppCardTone.neutral => neutral,
  };

  double defaultElevationFor(AppCardTone tone) => switch (tone) {
    AppCardTone.neutral => 0,
  };

  factory AppCardTheme.light() => AppCardTheme(
    neutral: AppCardVariantSet.standard(
      surface: Colors.yellow,
      border: Colors.yellow,
    ),
  );

  factory AppCardTheme.dark() => AppCardTheme.light();

  @override
  ThemeExtension<AppCardTheme> copyWith() => this;

  @override
  ThemeExtension<AppCardTheme> lerp(covariant ThemeExtension<AppCardTheme>? other, double t) {
    return this;
  }
}
