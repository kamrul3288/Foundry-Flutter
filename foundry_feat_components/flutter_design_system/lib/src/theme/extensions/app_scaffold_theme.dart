import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/foundation/app_colors.dart';

final class AppScaffoldTheme extends ThemeExtension<AppScaffoldTheme> {
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final Color foregroundColor;
  final double elevation;

  const AppScaffoldTheme({
    required this.backgroundColor,
    required this.appBarBackgroundColor,
    required this.foregroundColor,
    required this.elevation,
  });

  factory AppScaffoldTheme.light() => AppScaffoldTheme(
    backgroundColor: AppColors.gray50,
    appBarBackgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  );

  factory AppScaffoldTheme.dark() => AppScaffoldTheme.light();

  @override
  AppScaffoldTheme copyWith() => this;
  @override
  AppScaffoldTheme lerp(AppScaffoldTheme? other, double t) => this;
}
