import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design_system/src/foundation/app_colors.dart';

final class AppScaffoldTheme extends ThemeExtension<AppScaffoldTheme> {
  final Color backgroundColor;
  final SystemUiOverlayStyle overlayStyle;

  const AppScaffoldTheme({
    required this.backgroundColor,
    required this.overlayStyle,
  });

  factory AppScaffoldTheme.light() => AppScaffoldTheme(
    backgroundColor: AppColors.gray50,
    overlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.gray50,
    ),
  );

  factory AppScaffoldTheme.dark() => AppScaffoldTheme.light();

  @override
  ThemeExtension<AppScaffoldTheme> copyWith({
    Color? backgroundColor,
    SystemUiOverlayStyle? overlayStyle,
  }) {
    return AppScaffoldTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      overlayStyle: overlayStyle ?? this.overlayStyle,
    );
  }

  @override
  ThemeExtension<AppScaffoldTheme> lerp(covariant ThemeExtension<AppScaffoldTheme>? other, double t) => this;
}
