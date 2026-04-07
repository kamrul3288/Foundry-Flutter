import 'package:flutter/material.dart';

final class AppButtonColor {
  final Color background;
  final Color foreground;
  final Color outline;
  final Color? outlineForeground;

  const AppButtonColor({
    required this.background,
    required this.foreground,
    required this.outline,
    this.outlineForeground,
  });

  factory AppButtonColor.create(
    Color primary, {
    Color foreground = Colors.white,
    Color? outline,
    Color? outlineForeground,
  }) => AppButtonColor(
    background: primary,
    foreground: foreground,
    outline: outline ?? primary,
    outlineForeground: outlineForeground,
  );
}
