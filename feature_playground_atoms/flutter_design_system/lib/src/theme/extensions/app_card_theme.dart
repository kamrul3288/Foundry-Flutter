import 'package:flutter/material.dart';
import '../../components/cards/app_card_colors.dart';

final class AppCardTheme extends ThemeExtension<AppCardTheme> {
  final AppCardColors surface;

  const AppCardTheme({
    required this.surface,
  });

  factory AppCardTheme.light() {
    return AppCardTheme(
      surface: AppCardColors.standard(Colors.white),
    );
  }

  AppCardColors resolve(AppCardColorRole role) => switch (role) {
    AppCardColorRole.surface => surface,
  };

  @override
  ThemeExtension<AppCardTheme> copyWith() => this;
  @override
  ThemeExtension<AppCardTheme> lerp(covariant ThemeExtension<AppCardTheme>? other, double t) => this;
}

enum AppCardColorRole { surface }
