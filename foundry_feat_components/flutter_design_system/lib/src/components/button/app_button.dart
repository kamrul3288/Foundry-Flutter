import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/app_button_color.dart';
import 'package:flutter_design_system/src/components/button/app_button_color_role.dart';
import 'package:flutter_design_system/src/theme/extensions/app_button_theme.dart';

final class AppButton extends StatelessWidget {
  final Widget child;
  final AppButtonSize size;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? leading;
  final Widget? trailing;
  final AppButtonColorRole colorRole;
  final bool isFullWidth;
  final _ButtonVariant variant;
  final AppButtonShape shape;
  final bool enableColorFilter;
  final EdgeInsetsGeometry? padding;
  final bool isWrapContent;

  const AppButton._({
    required this.child,
    this.size = AppButtonSize.md,
    this.onPressed,
    this.isLoading = false,
    this.leading,
    this.trailing,
    required this.colorRole,
    this.isFullWidth = true,
    required this.variant,
    this.shape = AppButtonShape.sharp,
    this.enableColorFilter = false,
    this.padding,
    this.isWrapContent = false,
  });

  OutlinedBorder? _resolveButtonShape() => switch (shape) {
    AppButtonShape.rounded => RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    AppButtonShape.pill => const StadiumBorder(),
    AppButtonShape.circle => const CircleBorder(),
    AppButtonShape.sharp => RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  };

  BorderSide? _resolveBorderSide(AppButtonColor color) {
    if (variant == _ButtonVariant.outline) {
      return BorderSide(color: onPressed == null ? color.outline!.withValues(alpha: 0.2) : color.outline!);
    }
    return null;
  }

  AppButtonColor _mapColorsToVariant(AppButtonColor base, _ButtonVariant variant) {
    return switch (variant) {
      _ButtonVariant.filled => base,
      _ButtonVariant.outline => AppButtonColor(
        background: Colors.transparent,
        foreground: base.outlineForeground ?? base.background,
        outline: base.outline ?? base.background,
      ),
      _ButtonVariant.icon || _ButtonVariant.text => AppButtonColor(
        background: Colors.transparent,
        foreground: base.background,
        outline: null,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppButtonTheme>()!;
    final baseColors = theme.resolve(colorRole);
    final colors = _mapColorsToVariant(baseColors, variant);

    // Resolve Dimensions
    final double height = switch (size) {
      AppButtonSize.sm => 32.0,
      AppButtonSize.md => 48.0,
      AppButtonSize.lg => 56.0,
    };

    final double iconSize = switch (size) {
      AppButtonSize.sm => 16.0,
      AppButtonSize.md => 20.0,
      AppButtonSize.lg => 24.0,
    };

    final TextStyle textStyle = switch (size) {
      AppButtonSize.sm => const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      AppButtonSize.md => const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      AppButtonSize.lg => const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    };

    return SizedBox(
      height: isWrapContent ? null : height,
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colors.background,
          foregroundColor: colors.foreground,
          disabledBackgroundColor: variant == _ButtonVariant.filled ? colors.background.withValues(alpha: 0.2) : Colors.transparent,
          side: _resolveBorderSide(colors),
          overlayColor: variant == _ButtonVariant.filled ? null : colors.foreground.withValues(alpha: 0.2),
          shadowColor: Colors.transparent,
          shape: _resolveButtonShape(),
          padding: padding,
          tapTargetSize: isWrapContent ? MaterialTapTargetSize.shrinkWrap : null,
          minimumSize: isWrapContent ? Size.zero : null,
        ),
        child: _buildChild(colors, iconSize, textStyle),
      ),
    );
  }

  Widget _buildChild(AppButtonColor color, double iconSize, TextStyle textStyle) {
    if (isLoading) {
      return SizedBox(
        height: iconSize,
        width: iconSize,
        child: CircularProgressIndicator(strokeWidth: 2, color: color.foreground),
      );
    }

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null) ...[leading!, const SizedBox(width: 8)],
        Flexible(child: child),
        if (trailing != null) ...[const SizedBox(width: 8), trailing!],
      ],
    );

    final isEnabled = onPressed != null;
    final effectiveColor = isEnabled ? color.foreground : color.foreground.withValues(alpha: 0.6);
    if (enableColorFilter) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(effectiveColor, BlendMode.srcIn),
        child: DefaultTextStyle(
          style: textStyle.copyWith(color: effectiveColor),
          child: content,
        ),
      );
    }
    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: DefaultTextStyle(
        style: textStyle.copyWith(color: effectiveColor),
        child: content,
      ),
    );
  }

  factory AppButton.filled(
    Widget child, {
    required VoidCallback? onPressed,
    bool isLoading = false,
    Widget? leading,
    Widget? trailing,
    AppButtonColorRole colorRole = const AppButtonColorRole.primary(),
    bool isFullWidth = true,
    AppButtonSize size = AppButtonSize.md,
    AppButtonShape shape = AppButtonShape.rounded,
    bool enableColorFilter = true,
    EdgeInsetsGeometry? padding,
  }) {
    return AppButton._(
      onPressed: onPressed,
      isLoading: isLoading,
      leading: leading,
      trailing: trailing,
      variant: _ButtonVariant.filled,
      colorRole: colorRole,
      isFullWidth: isFullWidth,
      size: size,
      shape: shape,
      enableColorFilter: enableColorFilter,
      padding: padding,
      child: child,
    );
  }

  factory AppButton.outline(
    Widget child, {
    required VoidCallback? onPressed,
    bool isLoading = false,
    Widget? leading,
    Widget? trailing,
    AppButtonColorRole colorRole = const AppButtonColorRole.primary(),
    bool isFullWidth = true,
    AppButtonSize size = AppButtonSize.md,
    AppButtonShape shape = AppButtonShape.rounded,
    bool enableColorFilter = true,
    EdgeInsetsGeometry? padding,
  }) {
    return AppButton._(
      onPressed: onPressed,
      isLoading: isLoading,
      leading: leading,
      trailing: trailing,
      variant: _ButtonVariant.outline,
      colorRole: colorRole,
      isFullWidth: isFullWidth,
      size: size,
      shape: shape,
      enableColorFilter: enableColorFilter,
      padding: padding,
      child: child,
    );
  }

  factory AppButton.text(
    String text, {
    required VoidCallback? onPressed,
    bool isLoading = false,
    AppButtonColorRole colorRole = const AppButtonColorRole.primary(),
    AppButtonSize size = AppButtonSize.md,
    EdgeInsetsGeometry? padding = EdgeInsets.zero,
  }) {
    return AppButton._(
      onPressed: onPressed,
      isLoading: isLoading,
      variant: _ButtonVariant.text,
      colorRole: colorRole,
      size: size,
      shape: AppButtonShape.pill,
      isFullWidth: false,
      isWrapContent: true,
      padding: padding,
      child: Text(text),
    );
  }

  factory AppButton.icon(
    Widget icon, {
    required VoidCallback? onPressed,
    bool isLoading = false,
    AppButtonColorRole colorRole = const AppButtonColorRole.primary(),
    AppButtonSize size = AppButtonSize.md,
    bool enableColorFilter = true,
  }) {
    return AppButton._(
      onPressed: onPressed,
      isLoading: isLoading,
      variant: _ButtonVariant.icon,
      colorRole: colorRole,
      size: size,
      shape: AppButtonShape.circle,
      enableColorFilter: enableColorFilter,
      isFullWidth: false,
      isWrapContent: true,
      padding: EdgeInsets.zero,
      child: icon,
    );
  }
}

enum AppButtonSize { sm, md, lg }

enum AppButtonShape { rounded, pill, circle, sharp }

enum _ButtonVariant { filled, outline, text, icon }
