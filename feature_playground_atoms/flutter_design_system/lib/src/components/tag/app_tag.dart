import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/tag/app_tag_colors.dart';
import 'package:flutter_design_system/src/theme/extensions/app_tag_theme.dart';

class AppTag extends StatelessWidget {
  final AppTagVariant variant;
  final AppTagShape shape;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final bool forceIconTheme;
  final AppTagColorRole colorRole;

  const AppTag({
    super.key,
    required this.variant,
    required this.shape,
    this.padding = const EdgeInsets.all(4),
    required this.child,
    this.leading,
    this.trailing,
    this.forceIconTheme = true,
    this.colorRole = AppTagColorRole.primary,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTagTheme>()!;
    final colors = _mapColorsToVariant(theme.resolve(colorRole));
    return Material(
      shape: _resolveShape(shape, colors),
      color: colors.background,
      child: _buildContent(colors),
    );
  }

  Widget _buildContent(AppTagColors colors) {
    final content = Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) ...[_applyColorFilter(leading!, colors.foreground), SizedBox(width: 4)],
          child,
          if (trailing != null) ...[SizedBox(width: 4), _applyColorFilter(trailing!, colors.foreground)],
        ],
      ),
    );

    return IconTheme.merge(
      data: IconThemeData(color: colors.foreground),
      child: DefaultTextStyle(
        style: TextStyle(color: colors.foreground),
        child: content,
      ),
    );
  }

  Widget _applyColorFilter(Widget widget, Color color) {
    if (forceIconTheme) {
      return ColorFiltered(colorFilter: ColorFilter.mode(color, BlendMode.srcIn), child: widget);
    }
    return widget;
  }

  AppTagColors _mapColorsToVariant(AppTagColors baseColors) => switch (variant) {
    AppTagVariant.filled => baseColors,
    AppTagVariant.outline => AppTagColors(
      background: Colors.transparent,
      foreground: baseColors.outlineForeground ?? baseColors.foreground,
      outline: baseColors.outline ?? baseColors.background,
    ),
    AppTagVariant.filledOutline => AppTagColors(
      background: baseColors.outlineFillBackground ?? baseColors.background,
      foreground: baseColors.outlineFillForeground ?? baseColors.foreground,
      outline: baseColors.outline ?? baseColors.background,
    ),
  };

  ShapeBorder _resolveShape(AppTagShape shape, AppTagColors colors) => switch (shape) {
    AppTagShape.pill => StadiumBorder(side: _getBorderSide(colors.outline!)),
    AppTagShape.rounded => RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: _getBorderSide(colors.outline!)),
    AppTagShape.circle => CircleBorder(side: _getBorderSide(colors.outline!)),
    AppTagShape.sharp => RoundedRectangleBorder(borderRadius: BorderRadius.circular(0), side: _getBorderSide(colors.outline!)),
  };

  BorderSide _getBorderSide(Color outline) => BorderSide(color: outline, width: 1);
}

enum AppTagVariant { filled, outline, filledOutline }

enum AppTagShape { pill, rounded, circle, sharp }
