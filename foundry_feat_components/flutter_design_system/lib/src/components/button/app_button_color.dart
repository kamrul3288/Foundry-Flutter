import 'package:flutter/material.dart';

final class AppButtonColor {
  final Color background;
  final Color foreground;
  final Color? outline;
  final Color? outlineForeground;

  const AppButtonColor({
    required this.background,
    required this.foreground,
    this.outline,
    this.outlineForeground,
  });

  factory AppButtonColor.init(
    Color background, {
    Color foreground = Colors.white,
    Color? outline,
    Color? outlineForeground,
  }) => AppButtonColor(
    background: background,
    foreground: foreground,
    outline: outline,
    outlineForeground: outlineForeground,
  );
}
