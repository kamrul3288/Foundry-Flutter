import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/inputfiled/inputfield.dart';
import 'package:flutter_design_system/src/foundation/app_colors.dart';

final class AppInputFieldTheme extends ThemeExtension<AppInputFieldTheme> {
  final AppInputFieldColors colors;
  final double focusedBorderWidth;
  final double defaultBorderWidth;

  const AppInputFieldTheme({
    required this.colors,
    this.focusedBorderWidth = 2.0,
    this.defaultBorderWidth = 1.0,
  });

  factory AppInputFieldTheme.light() => AppInputFieldTheme(
    colors: AppInputFieldColors(
      fill: AppColors.gray100,
      fillDisabled: AppColors.gray100,
      borderDefault: AppColors.gray300,
      borderHover: AppColors.gray400,
      borderFocused: AppColors.purple500,
      borderError: AppColors.red500,
      borderErrorFocused: AppColors.red600,
      borderDisabled: AppColors.gray200,
      text: AppColors.gray900,
      textDisabled: AppColors.gray400,
      placeholder: AppColors.gray400,
      label: AppColors.gray700,
      labelFocused: AppColors.purple500,
      labelError: AppColors.red500,
      labelDisabled: AppColors.gray400,
      helper: AppColors.gray600,
      helperError: AppColors.red500,
      icon: AppColors.gray500,
      iconFocused: AppColors.purple500,
      iconError: AppColors.red500,
      iconDisabled: AppColors.gray300,
      cursor: AppColors.purple500,
    ),
  );

  // Note: Not fully implemented because currently I do not need dark mode, but the scope is kept.
  factory AppInputFieldTheme.dark() => AppInputFieldTheme.light();

  // Note: Not fully implemented because currently I do not need mutability, but the scope is kept.
  @override
  ThemeExtension<AppInputFieldTheme> copyWith({
    AppInputFieldColors? colors,
    double? focusedBorderWidth,
    double? defaultBorderWidth,
  }) {
    return AppInputFieldTheme(
      colors: colors ?? this.colors,
      focusedBorderWidth: focusedBorderWidth ?? this.focusedBorderWidth,
      defaultBorderWidth: defaultBorderWidth ?? this.defaultBorderWidth,
    );
  }

  // Note: Not fully implemented because currently I do not need smoothness, but the scope is kept.
  @override
  ThemeExtension<AppInputFieldTheme> lerp(covariant ThemeExtension<AppInputFieldTheme>? other, double t) => this;
}

// class AppInputTheme extends ThemeExtension<AppInputTheme> {
//   final AppInputColor primary;

//   const AppInputTheme._({required this.primary});

//   factory AppInputTheme.light() => AppInputTheme._(
//     primary: AppInputColor.standard(
//       fillColor: Colors.white,
//       activeBorder: AppColors.purple500,
//       inactiveBorder: AppColors.gray200,
//       textColor: AppColors.gray900,
//       labelColor: AppColors.gray600,
//     ),
//   );

//   factory AppInputTheme.dark() => AppInputTheme.light();

//   AppInputColor resolve(AppInputRole role) => switch (role) {
//     AppInputRole.primary => primary,
//   };

//   @override
//   ThemeExtension<AppInputTheme> copyWith() => this;
//   @override
//   ThemeExtension<AppInputTheme> lerp(ThemeExtension<AppInputTheme>? other, double t) => this;
// }

// enum AppInputRole { primary }
