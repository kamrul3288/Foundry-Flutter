import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';
import 'package:flutter_design_system/src/components/text/app_text_weight.dart';

/// Layout direction for radio cards.
enum AppRadioCardAxis { horizontal, vertical }

class AppRadioCardGroup<T> extends StatelessWidget {
  final List<AppRadioOption<T>> options;
  final T? value;
  final ValueChanged<T>? onChanged;
  final bool enabled;
  final AppRadioIntent intent;
  final AppRadioCardAxis axis;
  final double spacing;
  final double borderRadius;
  final EdgeInsetsGeometry itemPadding;
  final bool showCheckIndicator;

  const AppRadioCardGroup({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.intent = AppRadioIntent.brand,
    this.axis = AppRadioCardAxis.horizontal,
    this.spacing = 10,
    this.borderRadius = 10,
    this.itemPadding = const EdgeInsets.all(14),
    this.showCheckIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppRadioCardTheme>()!;
    final stateSet = theme.byIntent(intent);

    final cards = options.map((option) {
      final isSelected = option.value == value;
      final isDisabled = !enabled || !option.enabled || onChanged == null;
      final colors = stateSet.resolve(
        isSelected: isSelected,
        isDisabled: isDisabled,
      );

      return _CardItem(
        colors: colors,
        isSelected: isSelected,
        isDisabled: isDisabled,
        borderRadius: borderRadius,
        padding: itemPadding,
        showCheckIndicator: showCheckIndicator,
        onTap: isDisabled ? null : () => onChanged?.call(option.value),
        icon: option.icon,
        label: option.label,
        description: option.description,
      );
    }).toList();

    return Semantics(
      label: 'Card selection group',
      child: axis == AppRadioCardAxis.horizontal
          ? Row(
              children: [
                for (int i = 0; i < cards.length; i++) ...[
                  Expanded(child: cards[i]),
                  if (i < cards.length - 1) SizedBox(width: spacing),
                ],
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < cards.length; i++) ...[
                  cards[i],
                  if (i < cards.length - 1) SizedBox(height: spacing),
                ],
              ],
            ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final AppRadioCardStateColors colors;
  final bool isSelected;
  final bool isDisabled;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool showCheckIndicator;
  final VoidCallback? onTap;
  final Widget? icon;
  final String label;
  final String? description;

  const _CardItem({
    required this.colors,
    required this.isSelected,
    required this.isDisabled,
    required this.borderRadius,
    required this.padding,
    required this.showCheckIndicator,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: isSelected,
      enabled: !isDisabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          padding: padding,
          decoration: BoxDecoration(
            color: colors.background,
            border: Border.all(
              color: colors.border,
              width: colors.borderWidth,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Check indicator
              if (showCheckIndicator) ...[
                _CheckIndicator(
                  isSelected: isSelected,
                  background: colors.checkBackground,
                  border: colors.checkBorder,
                  iconColor: colors.checkIcon,
                ),
                const SizedBox(height: 10),
              ],

              // Optional icon
              if (icon != null) ...[
                IconTheme.merge(
                  data: IconThemeData(color: colors.titleColor, size: 20),
                  child: icon!,
                ),
                const SizedBox(height: 8),
              ],

              // Title
              AppText.bodyMedium(
                label,
                color: colors.titleColor,
                textWeight: isSelected ? AppTextWeight.semiBold : AppTextWeight.medium,
              ),

              // Description
              if (description != null) ...[
                const SizedBox(height: 4),
                AppText.captionLarge(
                  description!,
                  color: colors.descriptionColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckIndicator extends StatelessWidget {
  final bool isSelected;
  final Color background;
  final Color border;
  final Color iconColor;

  const _CheckIndicator({
    required this.isSelected,
    required this.background,
    required this.border,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: border, width: 1.5),
        shape: BoxShape.circle,
      ),
      child: isSelected ? CustomPaint(painter: _CheckPainter(color: iconColor)) : null,
    );
  }
}

class _CheckPainter extends CustomPainter {
  final Color color;
  _CheckPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(size.width * 0.25, size.height * 0.5)
      ..lineTo(size.width * 0.42, size.height * 0.68)
      ..lineTo(size.width * 0.75, size.height * 0.32);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CheckPainter old) => color != old.color;
}
