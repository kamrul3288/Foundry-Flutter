import 'package:flutter/material.dart';

class AppTagColors {
  final Color background;
  final Color foreground;

  final Color? outline;
  final Color? outlineForeground;

  final Color? outlineFillBackground;
  final Color? outlineFillForeground;

  const AppTagColors({
    required this.background,
    required this.foreground,
    this.outline,
    this.outlineForeground,
    this.outlineFillBackground,
    this.outlineFillForeground,
  });

  factory AppTagColors.standard(
    Color primary, {
    Color? foreground,
    Color? outline,
    Color? outlineForeground,
    Color? outlineFillBackground,
    Color? outlineFillForeground,
  }) {
    return AppTagColors(
      background: primary,
      foreground: foreground ?? Colors.white,
      outline: outline ?? primary,
      outlineForeground: outlineForeground ?? foreground ?? primary,
      outlineFillBackground: outlineFillBackground ?? primary,
      outlineFillForeground: outlineFillForeground ?? foreground ?? primary,
    );
  }
}
