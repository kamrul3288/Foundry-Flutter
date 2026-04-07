import 'package:flutter/material.dart';

class AppFontWeight {
  AppFontWeight._();

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class AppFontSize {
  AppFontSize._();
  static const double h1 = 57.0;
  static const double h2 = 45.0;
  static const double h3 = 36.0;
  static const double h4 = 28.0;
  static const double titleLarge = 24.0;
  static const double titleMedium = 20.0;
  static const double titleSmall = 18.0;
  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;
  static const double caption = 10.0;
  static const double captionSmall = 9.0;
}

enum AppTypographyVariant { h1, h2, h3, titleLarge, titleMedium, titleSmall, bodyLarge, bodyMedium, bodySmall, caption, captionSmall }
