import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/inputfiled/input_field_color.dart';
import 'package:flutter_design_system/src/theme/extensions/app_input_theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;

  // Configuration
  final AppInputVariant variant;
  final AppInputRole role;
  final bool enabled;
  final Widget? prefixIcon;
  final AppInputShape shape;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.prefixIcon,
    required this.variant,
    this.role = AppInputRole.primary,
    this.enabled = true,
    this.shape = AppInputShape.rounded,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppInputTheme>()!;
    final colors = _mapColorsToVariant(theme.resolve(role), variant);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: controller,
          enabled: enabled,
          style: TextStyle(color: colors.textColor),
          cursorColor: colors.activeBorder,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            errorText: errorText,

            labelStyle: TextStyle(color: colors.labelColor),
            hintStyle: TextStyle(color: colors.labelColor.withValues(alpha: 0.7)),

            filled: variant == AppInputVariant.filled,
            fillColor: colors.fillColor,

            border: _getBorderShape(colors.inactiveBorder),
            enabledBorder: _getBorderShape(colors.inactiveBorder),
            focusedBorder: _getBorderShape(colors.activeBorder, width: 1.0),
            errorBorder: _getBorderShape(colors.errorBorder),
            focusedErrorBorder: _getBorderShape(colors.errorBorder, width: 1.0),
            disabledBorder: _getBorderShape(colors.inactiveBorder.withValues(alpha: 0.3)),
            floatingLabelStyle: TextStyle(color: colors.labelFocusColor),
            prefixIcon: prefixIcon,
            contentPadding: _getContentPadding(),
          ),
        ),
      ],
    );
  }

  AppInputColor _mapColorsToVariant(AppInputColor base, AppInputVariant variant) {
    return switch (variant) {
      AppInputVariant.filled => base,
      AppInputVariant.outline => AppInputColor(
        fillColor: Colors.transparent,
        activeBorder: base.activeBorder,
        inactiveBorder: base.inactiveBorder,
        errorBorder: base.errorBorder,
        textColor: base.textColor,
        labelColor: base.labelColor,
        labelFocusColor: base.labelFocusColor ?? base.activeBorder,
      ),
      AppInputVariant.underline => AppInputColor(
        fillColor: Colors.transparent,
        activeBorder: base.activeBorder,
        inactiveBorder: base.inactiveBorder,
        errorBorder: base.errorBorder,
        textColor: base.textColor,
        labelColor: base.labelColor,
        labelFocusColor: base.labelFocusColor ?? base.activeBorder,
      ),
    };
  }

  /// Returns OutlineInputBorder or UnderlineInputBorder based on variant
  InputBorder _getBorderShape(Color color, {double width = 1.0}) {
    final borderSide = BorderSide(color: color, width: width);

    return switch (variant) {
      AppInputVariant.outline => OutlineInputBorder(borderRadius: _getBorderRadius(), borderSide: borderSide),
      AppInputVariant.underline => UnderlineInputBorder(borderSide: borderSide),
      AppInputVariant.filled => OutlineInputBorder(borderRadius: _getBorderRadius(), borderSide: borderSide),
    };
  }

  /// Returns OutlineInputBorder or UnderlineInputBorder based on variant
  BorderRadius _getBorderRadius() {
    return switch (shape) {
      AppInputShape.rounded => BorderRadius.circular(8),
      AppInputShape.pill => BorderRadius.circular(999),
    };
  }

  /// Adjust padding based on variant for better look
  EdgeInsetsGeometry _getContentPadding() {
    return switch (variant) {
      AppInputVariant.outline => const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      AppInputVariant.filled => const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      AppInputVariant.underline => const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
    };
  }
}

enum AppInputVariant { outline, underline, filled }

enum AppInputShape { rounded, pill }
