import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/app_button_color.dart';
import 'package:flutter_design_system/src/components/button/app_button_color_role.dart';
import 'package:flutter_design_system/src/components/button/app_button_types.dart';
import 'package:flutter_design_system/src/theme/extensions/app_button_theme.dart';
import 'package:flutter_design_system/src/theme/extensions/app_typography_theme.dart';

class AppButtonCore extends StatelessWidget {
  const AppButtonCore({
    super.key,
    required this.child,
    required this.variant,
    required this.onPressed,
    required this.colorRole,
    this.height = AppButtonHeight.md,
    this.shape = AppButtonShape.rounded,
    this.isLoading = false,
    this.leading,
    this.trailing,
    this.width,
    this.padding,
    this.shrinkWrap = false,
  });

  final Widget child;
  final AppButtonVariant variant;
  final VoidCallback? onPressed;
  final AppButtonColorRole colorRole;
  final AppButtonHeight height;
  final AppButtonShape shape;
  final bool isLoading;
  final Widget? leading;
  final Widget? trailing;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;

  OutlinedBorder? _resolveButtonShape() => switch (shape) {
    AppButtonShape.rounded => RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    AppButtonShape.pill => const StadiumBorder(),
    AppButtonShape.circle => const CircleBorder(),
    AppButtonShape.sharp => const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  };

  BorderSide? _resolveBorderSide(AppButtonColor color) {
    if (variant == AppButtonVariant.outline) {
      return BorderSide(color: onPressed == null ? color.outline.withValues(alpha: 0.2) : color.outline);
    }
    return null;
  }

  // Resolves the colors based on the variant (Filled vs Outline vs Text)
  AppButtonColor _mapColorsToVariant(AppButtonColor base) {
    return switch (variant) {
      AppButtonVariant.filled => base,
      AppButtonVariant.outline => AppButtonColor(
        background: Colors.transparent,
        foreground: base.outlineForeground ?? base.background,
        outline: base.outline,
      ),
      AppButtonVariant.text || AppButtonVariant.icon => AppButtonColor(
        background: Colors.transparent,
        foreground: base.background,
        outline: Colors.transparent,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppButtonTheme>()!;
    final typography = Theme.of(context).extension<AppTypographyTheme>()!;

    final baseColors = theme.resolve(colorRole);
    final colors = _mapColorsToVariant(baseColors);

    // Resolve Dimensions
    final double resolveHeight = switch (height) {
      AppButtonHeight.sm => 32.0,
      AppButtonHeight.md => 48.0,
      AppButtonHeight.lg => 56.0,
    };

    final double loadingSize = switch (height) {
      AppButtonHeight.sm => 12.0,
      AppButtonHeight.md => 16.0,
      AppButtonHeight.lg => 20.0,
    };

    final TextStyle textStyle = switch (height) {
      AppButtonHeight.sm => typography.bodySmall.copyWith(fontWeight: FontWeight.w500),
      AppButtonHeight.md => typography.bodyMedium.copyWith(fontWeight: FontWeight.w500),
      AppButtonHeight.lg => typography.bodyLarge.copyWith(fontWeight: FontWeight.w500),
    };

    // Calculate effective content color
    final contentColor = onPressed != null ? colors.foreground : colors.foreground.withValues(alpha: 0.6);
    final disableBgColor = variant == AppButtonVariant.filled ? colors.background.withValues(alpha: 0.2) : Colors.transparent;
    final overlayColor = variant == AppButtonVariant.filled ? null : colors.foreground.withValues(alpha: 0.2);

    return SizedBox(
      height: shrinkWrap ? null : resolveHeight,
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colors.background,
          foregroundColor: colors.foreground,
          disabledBackgroundColor: isLoading ? colors.background : disableBgColor,
          side: _resolveBorderSide(colors),
          overlayColor: overlayColor,
          shadowColor: Colors.transparent,
          shape: _resolveButtonShape(),
          padding: padding,
          tapTargetSize: shrinkWrap ? MaterialTapTargetSize.shrinkWrap : null,
          minimumSize: shrinkWrap ? Size.zero : null,
        ),
        child: _buildChild(contentColor, loadingSize, textStyle),
      ),
    );
  }

  Widget _buildChild(Color contentColor, double loadingSize, textStyle) {
    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Text("Processing...", style: textStyle.copyWith(color: contentColor)),
          SizedBox(
            width: loadingSize,
            height: loadingSize,
            child: CircularProgressIndicator(strokeWidth: 2, color: contentColor),
          ),
        ],
      );
    }

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leading != null) ...[leading!, const SizedBox(width: 8)],
        Flexible(child: child),
        if (trailing != null) ...[const SizedBox(width: 8), trailing!],
      ],
    );

    return DefaultTextStyle(
      style: textStyle.copyWith(color: contentColor),
      child: content,
    );
  }
}
