// ignore_for_file: unused_element_parameter, unused_element

import 'package:flutter/material.dart';
import 'app_text_weight.dart';
import '../../theme/extensions/app_typography_theme.dart';
import '../../foundation/app_typography_tokens.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final AppTypographyVariant variant;
  final AppTextWeight? textWeight;
  final bool inheritColor;

  const AppText._(this.text, {super.key, required this.variant, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<AppTypographyTheme>()!;
    final baseStyle = typography.getVariant(variant);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: baseStyle.copyWith(
        color: color ?? (inheritColor ? DefaultTextStyle.of(context).style.color : baseStyle.color),
        fontWeight: textWeight?.fontWeight ?? baseStyle.fontWeight,
      ),
    );
  }

  const AppText.h1(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.h1;

  const AppText.h2(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.h2;

  const AppText.h3(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.h3;

  const AppText.titleLarge(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.titleLarge;

  const AppText.titleMedium(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.titleMedium;

  const AppText.titleSmall(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.titleSmall;

  const AppText.bodyLarge(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.bodyLarge;

  const AppText.bodyMedium(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.bodyMedium;

  const AppText.bodySmall(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.bodySmall;

  const AppText.caption(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.caption;

  const AppText.captionSmall(this.text, {super.key, this.color, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.textWeight, this.inheritColor = false}) : variant = AppTypographyVariant.captionSmall;
}
