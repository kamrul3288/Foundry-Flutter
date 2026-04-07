import 'package:flutter/material.dart';

final class AppCardColors {
  final Color background;
  final Color? outline;
  final Color? outlineBackground;
  final Color? shadow;

  const AppCardColors({
    required this.background,
    this.outline,
    this.outlineBackground,
    this.shadow,
  });

  factory AppCardColors.standard(
    Color primary, {
    Color? outlineBackground,
    Color? shadow,
  }) {
    return AppCardColors(
      background: primary,
      outline: primary,
      outlineBackground: outlineBackground ?? primary.withValues(alpha: 0.3),
      shadow: shadow ?? primary.withValues(alpha: 0.2),
    );
  }
}
