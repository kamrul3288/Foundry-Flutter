import 'package:flutter/material.dart';
import 'app_card_colors.dart';
import '../../theme/extensions/app_card_theme.dart';

class AppCard extends StatelessWidget {
  final double elevation;
  final Widget child;
  final AppCardColorRole colorRole;
  final AppCardVariant variant;
  final _AppCardShape shape;
  final EdgeInsetsGeometry padding;
  final bool isFullWidth;
  final double? height;
  final double? width;
  final AppCardCornerRadius cornerRadius;
  final AppCardCornerMode cornerMode;

  const AppCard._({
    required this.child,
    required this.elevation,
    required this.colorRole,
    required this.variant,
    required this.shape,
    required this.padding,
    required this.isFullWidth,
    this.cornerRadius = AppCardCornerRadius.md,
    this.cornerMode = AppCardCornerMode.all,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppCardTheme>()!;
    final colors = _mapColorsToVariant(theme.resolve(colorRole));
    final double radius = switch (cornerRadius) {
      AppCardCornerRadius.sm => 5,
      AppCardCornerRadius.md => 8,
      AppCardCornerRadius.lg => 16,
    };

    return Material(
      clipBehavior: Clip.antiAlias,
      type: MaterialType.card,
      elevation: elevation,
      color: colors.background,
      shadowColor: colors.shadow,
      shape: _resolveShape(shape, colors, radius),
      child: Container(
        padding: padding,
        alignment: shape == _AppCardShape.circle ? Alignment.center : null,
        width: isFullWidth ? double.infinity : width,
        height: height,
        child: child,
      ),
    );
  }

  AppCardColors _mapColorsToVariant(AppCardColors baseColor) => switch (variant) {
    AppCardVariant.filled => AppCardColors(background: baseColor.background, outline: Colors.transparent),
    AppCardVariant.outline => AppCardColors(background: Colors.transparent, outline: baseColor.outline),
    AppCardVariant.filledOutline => AppCardColors(background: baseColor.outlineBackground ?? baseColor.background, outline: baseColor.outline),
  };

  ShapeBorder _resolveShape(_AppCardShape shape, AppCardColors colors, double radius) => switch (shape) {
    _AppCardShape.pill => StadiumBorder(side: _getBorderSide(colors.outline)),
    _AppCardShape.rounded => RoundedRectangleBorder(borderRadius: _resolveCornerRadius(cornerMode, radius), side: _getBorderSide(colors.outline)),
    _AppCardShape.circle => CircleBorder(side: _getBorderSide(colors.outline)),
    _AppCardShape.sharp => RoundedRectangleBorder(borderRadius: BorderRadius.circular(0), side: _getBorderSide(colors.outline)),
  };

  BorderRadiusGeometry _resolveCornerRadius(AppCardCornerMode cornerMode, double radius) => switch (cornerMode) {
    AppCardCornerMode.all => BorderRadius.circular(radius),
    AppCardCornerMode.top => BorderRadius.vertical(top: Radius.circular(radius)),
    AppCardCornerMode.bottom => BorderRadius.vertical(bottom: Radius.circular(radius)),
    AppCardCornerMode.left => BorderRadius.horizontal(left: Radius.circular(radius)),
    AppCardCornerMode.right => BorderRadius.horizontal(right: Radius.circular(radius)),
  };

  BorderSide _getBorderSide(Color? outline) => BorderSide(color: outline ?? Colors.transparent, width: 1);

  factory AppCard.rounded({
    required Widget child,
    double elevation = 0,
    AppCardCornerRadius cornerRadius = AppCardCornerRadius.md,
    AppCardColorRole colorRole = AppCardColorRole.surface,
    AppCardVariant variant = AppCardVariant.filled,
    AppCardCornerMode cornerMode = AppCardCornerMode.all,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
    bool isFullWidth = true,
    double? height,
    double? width,
  }) {
    return AppCard._(
      elevation: elevation,
      colorRole: colorRole,
      variant: variant,
      shape: _AppCardShape.rounded,
      cornerRadius: cornerRadius,
      cornerMode: cornerMode,
      padding: padding,
      isFullWidth: isFullWidth,
      height: height,
      width: width,
      child: child,
    );
  }

  factory AppCard.pill({
    required Widget child,
    double elevation = 0,
    AppCardColorRole colorRole = AppCardColorRole.surface,
    AppCardVariant variant = AppCardVariant.filled,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
    bool isFullWidth = true,
    double? height,
    double? width,
  }) {
    return AppCard._(
      elevation: elevation,
      colorRole: colorRole,
      variant: variant,
      shape: _AppCardShape.pill,
      padding: padding,
      isFullWidth: isFullWidth,
      height: height,
      width: width,
      child: child,
    );
  }

  factory AppCard.circle({
    required Widget child,
    double elevation = 0,
    AppCardColorRole colorRole = AppCardColorRole.surface,
    AppCardVariant variant = AppCardVariant.filled,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    double? size,
  }) {
    return AppCard._(
      elevation: elevation,
      colorRole: colorRole,
      variant: variant,
      shape: _AppCardShape.circle,
      padding: padding,
      isFullWidth: false,
      height: size,
      width: size,
      child: child,
    );
  }
}

enum AppCardVariant { filled, outline, filledOutline }

enum AppCardCornerMode { all, top, bottom, left, right }

enum AppCardCornerRadius { sm, md, lg }

enum _AppCardShape { rounded, pill, circle, sharp }
